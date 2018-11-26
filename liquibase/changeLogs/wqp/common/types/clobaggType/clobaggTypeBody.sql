create or replace type body clobagg_type is
    static function ODCIAggregateInitialize(sctx in out clobagg_type)
        return number is
        begin
            sctx := clobagg_type(null) ;
            return ODCIConst.Success ;
        end;

    member function ODCIAggregateIterate(self  in out clobagg_type,
                                         value in     clob)
        return number is
        begin
            self.text := self.text || value ;
            return ODCIConst.Success;
        end;

    member function ODCIAggregateTerminate(self        in  clobagg_type,
                                           returnvalue out clob,
                                           flags       in  number)
        return number is
        begin
            returnValue := self.text;
            return ODCIConst.Success;
        end;

    member function ODCIAggregateMerge(self in out clobagg_type,
                                       ctx2 in     clobagg_type)
        return number is
        begin
            self.text := self.text || ctx2.text;
            return ODCIConst.Success;
        end;

end;
