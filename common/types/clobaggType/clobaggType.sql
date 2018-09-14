create or replace type clobagg_type as object(
    text clob,

    static function ODCIAggregateInitialize(sctx in out clobagg_type)
        return number,

    member function ODCIAggregateIterate(self  in out clobagg_type,
                                         value in     clob)
        return number,

    member function ODCIAggregateTerminate(self        in  clobagg_type,
                                           returnvalue out clob,
                                           flags in number)
        return number,

    member function ODCIAggregateMerge(self in out clobagg_type,
                                       ctx2 in     clobagg_type)
        return number
);
