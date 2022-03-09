//     ********  packet_parser core logic module ******* 


//     ****  This block takes FIELD_OFFSET and FIELD_SIZE and outputs OutBus_Field and OutBus_Valid
//     ****  OutBus_Valid is always asserted one CC after InBus_DataEop

//Byte order assumption:
//Bytes are arriving in following order:
//{B7,B6,B5,B4,B3,B2,B1,B0}

module packet_parser
  #(
    parameter
    DATA_WIDTH,
    FIELD_SIZE_MAX,
    FIELD_OFFSET,
    FIELD_SIZE
    )
(
  input  Clk, Rst,
  input  InBus_DataSop,
  input  InBus_DataEop,
  input  InBus_DataValid,
  input  [$clog2(DATA_WIDTH/8)-1:0] InBus_Mod,
  input  [DATA_WIDTH-1:0] InBus_Data,

  output reg OutBus_Valid,
  output reg [((FIELD_SIZE_MAX*8)-1):0] OutBus_Field,
  output reg error_offset_or_size
);

localparam
  IDLE = 2'd0,
  PARSE = 2'd1;
    
reg field_found;
reg [15:0] pending_bytes,word_count;
reg [1:0] state;

//assumption:
//InBus_Mod is non-zero only at InBus_DataEop. 
wire [(DATA_WIDTH/8)-1:0] byte_valid = InBus_DataEop ? InBus_Mod : DATA_WIDTH/8;

always @ (posedge Clk) 
begin
if (Rst) 
  begin
    OutBus_Valid <= 1'b0;
    OutBus_Field <= 'd0;
    word_count <= 'd0;
    error_offset_or_size <= 1'b0;
    field_found   <= 1'b0;
    pending_bytes <= 'd0;
  end
else 
  begin
    case (state)
    IDLE: begin
      OutBus_Valid <= 1'b0;
      //packet contained in single CC
      if (InBus_DataValid & InBus_DataSop & InBus_DataEop)
        begin
          if ((InBus_Mod >= FIELD_OFFSET) && (FIELD_SIZE <= (InBus_Mod - FIELD_OFFSET)))
            begin
              OutBus_Valid  <= 1'b1;
              OutBus_Field  <= InBus_Data[FIELD_OFFSET*8 +: FIELD_SIZE*8];
            end
          else
            error_offset_or_size <= 1'b1;
        end
      else
      //Packet larger than one CC
      if (InBus_DataValid & InBus_DataSop & ~InBus_DataEop)
        begin
          //all bytes are valid
          word_count <= word_count + DATA_WIDTH/8;
          state <= PARSE;
          if (DATA_WIDTH/8 >= FIELD_OFFSET)
            begin
              field_found   <= 1'b1;
              if (FIELD_SIZE <= (DATA_WIDTH/8 - FIELD_OFFSET)) //complete field in this word, collect all
                begin
                  OutBus_Field  <= InBus_Data[FIELD_OFFSET*8 +: FIELD_SIZE*8];
                  pending_bytes <= 'd0;
                end
              else
                begin
                  OutBus_Field  <= InBus_Data[FIELD_OFFSET*8 +: (DATA_WIDTH - FIELD_OFFSET*8)]; //partial field in this word. Collect available bytes in this CC
                  pending_bytes <= FIELD_SIZE - (DATA_WIDTH/8 - FIELD_OFFSET);
                end
            end
        end
    end //end IDLE

    PARSE: begin
      if (InBus_DataValid)
        begin
           word_count <= word_count + DATA_WIDTH/8;
           if (field_found) //field is already found, collect the bytes
             begin
               if ((pending_bytes > 0) && (pending_bytes <= byte_valid)) 
               //complete field contained within this word, collect all bytes
                 begin
                   OutBus_Field <= {OutBus_Field,InBus_Data[(FIELD_SIZE%(DATA_WIDTH/8)*8):0]};
                   pending_bytes <= 'd0;
                 end
               else if (pending_bytes > byte_valid) 
                 begin
                   if (InBus_DataEop)
                     error_offset_or_size <= 1;
                   else
                     begin
                       OutBus_Field <= {OutBus_Field,InBus_Data[DATA_WIDTH-1:0]};
                       pending_bytes <= pending_bytes - byte_valid;
                     end
                 end
             end
           else if ((word_count + InBus_Mod) >= FIELD_OFFSET) //find the start of field
             begin
               field_found   <= 1'b1;
               if (FIELD_SIZE <= (byte_valid - (FIELD_OFFSET%(DATA_WIDTH/8)))) 
               //complete field contained within this word, collect all
                 begin
                   OutBus_Field  <= InBus_Data[(FIELD_OFFSET%(DATA_WIDTH/8)*8) +: FIELD_SIZE*8];
                   pending_bytes <= 'd0;
                 end
               else
                 if (InBus_DataEop)
                   error_offset_or_size <= 1;
                 else
                   begin
                     //collect all bytes in this word from offset
                     OutBus_Field  <= InBus_Data[(FIELD_OFFSET%(DATA_WIDTH/8))*8 +: (DATA_WIDTH - (FIELD_OFFSET%(DATA_WIDTH/8))*8)];
                     pending_bytes <= FIELD_SIZE - (DATA_WIDTH/8 - (FIELD_OFFSET%(DATA_WIDTH/8)));
                   end
             end

           if (InBus_DataEop)
            begin
              word_count   <= 0;
              OutBus_Valid <= 1'b1;
              state        <= IDLE;
              field_found  <= 1'b0;
            end
        end
    end //end PARSE

    default: begin
      state <= IDLE;
    end
    endcase 
  end
end

endmodule
