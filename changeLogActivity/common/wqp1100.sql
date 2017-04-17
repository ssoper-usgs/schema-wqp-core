--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:alter-activity-subpartition-template-2019-2020
alter table activity
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    );
--rollback alter table activity
--rollback   set subpartition template
--rollback       (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_maxx values less than (maxvalue) tablespace result2
--rollback       );

--changeset drsteini:alter-activity-split-stewards-2019-2020
alter table activity split subpartition activity_stewards_y_maxx into 
(subpartition activity_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_stewards_y_maxx);
--rollback alter table activity merge subpartitions activity_stewards_y_2019, activity_stewards_y_2020, activity_stewards_y_maxx into subpartition activity_stewards_y_maxx;

--changeset drsteini:alter-activity-split-nwis-2019-2020
alter table activity split subpartition activity_nwis_y_maxx into 
(subpartition activity_nwis_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_nwis_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_nwis_y_maxx);
--rollback alter table activity merge subpartitions activity_nwis_y_2019, activity_nwis_y_2020, activity_nwis_y_maxx into subpartition activity_nwis_y_maxx;

--changeset drsteini:alter-activity-split-storet-2019-2020
alter table activity split subpartition activity_storet_y_maxx into 
(subpartition activity_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_storet_y_maxx);
--rollback alter table activity merge subpartitions activity_storet_y_2019, activity_storet_y_2020, activity_storet_y_maxx into subpartition activity_storet_y_maxx;

--changeset drsteini:alter-activity-split-biodata-2019-2020
alter table activity split subpartition activity_biodata_y_maxx into 
(subpartition activity_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_biodata_y_maxx);
--rollback alter table activity merge subpartitions activity_biodata_y_2019, activity_biodata_y_2020, activity_biodata_y_maxx into subpartition activity_biodata_y_maxx;

--changeset drsteini:alter-activity-split-garbage-2019-2020
alter table activity split subpartition activity_garbage_y_maxx into 
(subpartition activity_garbage_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_garbage_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_garbage_y_maxx);
--rollback alter table activity merge subpartitions activity_garbage_y_2019, activity_garbage_y_2020, activity_garbage_y_maxx into subpartition activity_garbage_y_maxx;
 
--changeset drsteini:alter-activity_sum-subpartition-template-2019-2020
alter table activity_sum
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    );
--rollback alter table activity_sum
--rollback   set subpartition template
--rollback       (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
--rollback        subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
--rollback        subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
--rollback        subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
--rollback        subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
--rollback        subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
--rollback        subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
--rollback        subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
--rollback        subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
--rollback        subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
--rollback        subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
--rollback        subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
--rollback        subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
--rollback        subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
--rollback        subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
--rollback        subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
--rollback        subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
--rollback        subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
--rollback        subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
--rollback        subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
--rollback        subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
--rollback        subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
--rollback        subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
--rollback        subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
--rollback        subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
--rollback        subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
--rollback        subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
--rollback        subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
--rollback        subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')),
--rollback        subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')),
--rollback        subpartition y_maxx values less than (maxvalue)
--rollback       );

--changeset drsteini:alter-activity_sum-split-stewards-2019-2020
alter table activity_sum split subpartition activity_sum_stewards_y_maxx into 
(subpartition activity_sum_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_sum_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_sum_stewards_y_maxx tablespace result2);
--rollback alter table activity_sum merge subpartitions activity_sum_stewards_y_2019, activity_sum_stewards_y_2020, activity_sum_stewards_y_maxx into subpartition activity_sum_stewards_y_maxx;

--changeset drsteini:alter-activity_sum-split-nwis-2019-2020
alter table activity_sum split subpartition activity_sum_nwis_y_maxx into 
(subpartition activity_sum_nwis_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_sum_nwis_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_sum_nwis_y_maxx tablespace result2);
--rollback alter table activity_sum merge subpartitions activity_sum_nwis_y_2019, activity_sum_nwis_y_2020, activity_sum_nwis_y_maxx into subpartition activity_sum_nwis_y_maxx;

--changeset drsteini:alter-activity_sum-split-storet-2019-2020
alter table activity_sum split subpartition activity_sum_storet_y_maxx into 
(subpartition activity_sum_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_sum_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_sum_storet_y_maxx tablespace result2);
--rollback alter table activity_sum merge subpartitions activity_sum_storet_y_2019, activity_sum_storet_y_2020, activity_sum_storet_y_maxx into subpartition activity_sum_storet_y_maxx;

--changeset drsteini:alter-activity_sum-split-biodata-2019-2020
alter table activity_sum split subpartition activity_sum_biodata_y_maxx into 
(subpartition activity_sum_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_sum_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_sum_biodata_y_maxx tablespace result2);
--rollback alter table activity_sum merge subpartitions activity_sum_biodata_y_2019, activity_sum_biodata_y_2020, activity_sum_biodata_y_maxx into subpartition activity_sum_biodata_y_maxx;

--changeset drsteini:alter-activity_sum-split-garbage-2019-2020
alter table activity_sum split subpartition activity_sum_garbage_y_maxx into 
(subpartition activity_sum_garbage_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition activity_sum_garbage_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition activity_sum_garbage_y_maxx tablespace result2);
--rollback alter table activity_sum merge subpartitions activity_sum_garbage_y_2019, activity_sum_garbage_y_2020, activity_sum_garbage_y_maxx into subpartition activity_sum_garbage_y_maxx;
 
--changeset drsteini:alter-act_metric-subpartition-template-2019-2020
alter table act_metric
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    );
--rollback alter table act_metric
--rollback   set subpartition template
--rollback       (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_maxx values less than (maxvalue) tablespace result2
--rollback       );

--changeset drsteini:alter-act_metric-split-stewards-2019-2020
alter table act_metric split subpartition act_metric_stewards_y_maxx into 
(subpartition act_metric_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition act_metric_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition act_metric_stewards_y_maxx);
--rollback alter table act_metric merge subpartitions act_metric_stewards_y_2019, act_metric_stewards_y_2020, act_metric_stewards_y_maxx into subpartition act_metric_stewards_y_maxx;

--changeset drsteini:alter-act_metric-split-nwis-2019-2020
alter table act_metric split subpartition act_metric_nwis_y_maxx into 
(subpartition act_metric_nwis_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition act_metric_nwis_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition act_metric_nwis_y_maxx);
--rollback alter table act_metric merge subpartitions act_metric_nwis_y_2019, act_metric_nwis_y_2020, act_metric_nwis_y_maxx into subpartition act_metric_nwis_y_maxx;

--changeset drsteini:alter-act_metric-split-storet-2019-2020
alter table act_metric split subpartition act_metric_storet_y_maxx into 
(subpartition act_metric_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition act_metric_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition act_metric_storet_y_maxx);
--rollback alter table act_metric merge subpartitions act_metric_storet_y_2019, act_metric_storet_y_2020, act_metric_storet_y_maxx into subpartition act_metric_storet_y_maxx;

--changeset drsteini:alter-act_metric-split-biodata-2019-2020
alter table act_metric split subpartition act_metric_biodata_y_maxx into 
(subpartition act_metric_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition act_metric_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition act_metric_biodata_y_maxx);
--rollback alter table act_metric merge subpartitions act_metric_biodata_y_2019, act_metric_biodata_y_2020, act_metric_biodata_y_maxx into subpartition act_metric_biodata_y_maxx;

--changeset drsteini:alter-act_metric-split-garbage-2019-2020
alter table act_metric split subpartition act_metric_garbage_y_maxx into 
(subpartition act_metric_garbage_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition act_metric_garbage_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition act_metric_garbage_y_maxx);
--rollback alter table act_metric merge subpartitions act_metric_garbage_y_2019, act_metric_garbage_y_2020, act_metric_garbage_y_maxx into subpartition act_metric_garbage_y_maxx;
 
--changeset drsteini:alter-result-subpartition-template-2019-2020
alter table result
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    );
--rollback alter table result
--rollback   set subpartition template
--rollback       (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
--rollback        subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
--rollback        subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
--rollback        subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
--rollback        subpartition y_maxx values less than (maxvalue) tablespace result2
--rollback       );

--changeset drsteini:alter-result-split-stewards-2019-2020
alter table result split subpartition result_stewards_y_maxx into 
(subpartition result_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_stewards_y_maxx);
--rollback alter table result merge subpartitions result_stewards_y_2019, result_stewards_y_2020, result_stewards_y_maxx into subpartition result_stewards_y_maxx;

--changeset drsteini:alter-result-split-nwis-2019-2020
alter table result split subpartition result_nwis_y_maxx into 
(subpartition result_nwis_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_nwis_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_nwis_y_maxx);
--rollback alter table result merge subpartitions result_nwis_y_2019, result_nwis_y_2020, result_nwis_y_maxx into subpartition result_nwis_y_maxx;

--changeset drsteini:alter-result-split-storet-2019-2020
alter table result split subpartition result_storet_y_maxx into 
(subpartition result_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_storet_y_maxx);
--rollback alter table result merge subpartitions result_storet_y_2019, result_storet_y_2020, result_storet_y_maxx into subpartition result_storet_y_maxx;

--changeset drsteini:alter-result-split-biodata-2019-2020
alter table result split subpartition result_biodata_y_maxx into 
(subpartition result_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_biodata_y_maxx);
--rollback alter table result merge subpartitions result_biodata_y_2019, result_biodata_y_2020, result_biodata_y_maxx into subpartition result_biodata_y_maxx;

--changeset drsteini:alter-result-split-garbage-2019-2020
alter table result split subpartition result_garbage_y_maxx into 
(subpartition result_garbage_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_garbage_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_garbage_y_maxx);
--rollback alter table result merge subpartitions result_garbage_y_2019, result_garbage_y_2020, result_garbage_y_maxx into subpartition result_garbage_y_maxx;

--changeset drsteini:alter-result_sum-subpartition-template-2019-2020
alter table result_sum
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    );
--rollback alter table result_sum
--rollback   set subpartition template
--rollback       (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
--rollback        subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
--rollback        subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
--rollback        subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
--rollback        subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
--rollback        subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
--rollback        subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
--rollback        subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
--rollback        subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
--rollback        subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
--rollback        subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
--rollback        subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
--rollback        subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
--rollback        subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
--rollback        subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
--rollback        subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
--rollback        subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
--rollback        subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
--rollback        subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
--rollback        subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
--rollback        subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
--rollback        subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
--rollback        subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
--rollback        subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
--rollback        subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
--rollback        subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
--rollback        subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
--rollback        subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
--rollback        subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')),
--rollback        subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')),
--rollback        subpartition y_maxx values less than (maxvalue)
--rollback       );

--changeset drsteini:alter-result_sum-split-stewards-2019-2020
alter table result_sum split subpartition result_sum_stewards_y_maxx into 
(subpartition result_sum_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_sum_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_sum_stewards_y_maxx tablespace result2);
--rollback alter table result_sum merge subpartitions result_sum_stewards_y_2019, result_sum_stewards_y_2020, result_sum_stewards_y_maxx into subpartition result_sum_stewards_y_maxx;

--changeset drsteini:alter-result_sum-split-nwis-2019-2020
alter table result_sum split subpartition result_sum_nwis_y_maxx into 
(subpartition result_sum_nwis_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_sum_nwis_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_sum_nwis_y_maxx tablespace result2);
--rollback alter table result_sum merge subpartitions result_sum_nwis_y_2019, result_sum_nwis_y_2020, result_sum_nwis_y_maxx into subpartition result_sum_nwis_y_maxx;

--changeset drsteini:alter-result_sum-split-storet-2019-2020
alter table result_sum split subpartition result_sum_storet_y_maxx into 
(subpartition result_sum_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_sum_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_sum_storet_y_maxx tablespace result2);
--rollback alter table result_sum merge subpartitions result_sum_storet_y_2019, result_sum_storet_y_2020, result_sum_storet_y_maxx into subpartition result_sum_storet_y_maxx;

--changeset drsteini:alter-result_sum-split-biodata-2019-2020
alter table result_sum split subpartition result_sum_biodata_y_maxx into 
(subpartition result_sum_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_sum_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_sum_biodata_y_maxx tablespace result2);
--rollback alter table result_sum merge subpartitions result_sum_biodata_y_2019, result_sum_biodata_y_2020, result_sum_biodata_y_maxx into subpartition result_sum_biodata_y_maxx;

--changeset drsteini:alter-result_sum-split-garbage-2019-2020
alter table result_sum split subpartition result_sum_garbage_y_maxx into 
(subpartition result_sum_garbage_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,subpartition result_sum_garbage_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,subpartition result_sum_garbage_y_maxx tablespace result2);
--rollback alter table result_sum merge subpartitions result_sum_garbage_y_2019, result_sum_garbage_y_2020, result_sum_garbage_y_maxx into subpartition result_sum_garbage_y_maxx;

--changeset drsteini:alter-data_source-text-column-length
alter table data_source modify text varchar2(8 char);
--rollback alter table data_source modify text varchar2(8);

--changeset drsteini:alter-project_dim-cache-parallel
alter table project_dim parallel 4 cache;
--rollback alter table project_dim noparallel nocache;

--changeset drsteini:alter-public_srsnames_00000-cache-parallel
alter table public_srsnames_00000 parallel 4 cache;
--rollback alter table public_srsnames_00000 noparallel nocache;

--changeset drsteini:alter-qwportal_summary-partition-biodata
alter table qwportal_summary split partition summary_garbage into
(partition summary_biodata values less than (5)
,partition summary_garbage
);
--rollback alter table qwportal_summary merge partitions summary_biodata, summary_garbage into partition summary_garbage;

--changeset drsteini:alter-activity_sum-stewards-subpartitions
alter table activity_sum move subpartition activity_sum_stewards_p_1990 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_1990 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_1991 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_1992 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_1993 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_1994 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_1995 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_1996 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_1997 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_1998 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_1999 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_2000 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_2001 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_2002 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_2003 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_2004 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_2005 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_2006 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_2007 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_2008 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_2009 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_2010 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_2011 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_2012 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_2013 tablespace result1;
alter table activity_sum move subpartition activity_sum_stewards_y_2014 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_2015 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_2016 tablespace result4;
alter table activity_sum move subpartition activity_sum_stewards_y_2017 tablespace result2;
alter table activity_sum move subpartition activity_sum_stewards_y_2018 tablespace result3;
alter table activity_sum move subpartition activity_sum_stewards_y_maxx tablespace result2;
--rollback alter table activity_sum move subpartition activity_sum_stewards_p_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1991 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1992 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1993 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1994 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1995 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1996 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1997 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1998 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_1999 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2000 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2001 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2002 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2003 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2004 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2005 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2006 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2007 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2008 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2009 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2010 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2011 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2012 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2013 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2014 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2015 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2016 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2017 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_2018 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_stewards_y_maxx tablespace wqp;

--changeset drsteini:alter-activity_sum-nwis-subpartitions
alter table activity_sum move subpartition activity_sum_nwis_p_1990 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_1990 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_1991 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_1992 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_1993 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_1994 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_1995 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_1996 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_1997 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_1998 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_1999 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_2000 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_2001 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_2002 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_2003 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_2004 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_2005 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_2006 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_2007 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_2008 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_2009 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_2010 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_2011 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_2012 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_2013 tablespace result1;
alter table activity_sum move subpartition activity_sum_nwis_y_2014 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_2015 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_2016 tablespace result4;
alter table activity_sum move subpartition activity_sum_nwis_y_2017 tablespace result2;
alter table activity_sum move subpartition activity_sum_nwis_y_2018 tablespace result3;
alter table activity_sum move subpartition activity_sum_nwis_y_maxx tablespace result2;
--rollback alter table activity_sum move subpartition activity_sum_nwis_p_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1991 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1992 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1993 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1994 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1995 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1996 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1997 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1998 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_1999 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2000 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2001 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2002 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2003 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2004 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2005 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2006 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2007 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2008 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2009 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2010 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2011 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2012 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2013 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2014 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2015 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2016 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2017 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_2018 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_nwis_y_maxx tablespace wqp;

--changeset drsteini:alter-activity_sum-storet-subpartitions
alter table activity_sum move subpartition activity_sum_storet_p_1990 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_1990 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_1991 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_1992 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_1993 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_1994 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_1995 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_1996 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_1997 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_1998 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_1999 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_2000 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_2001 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_2002 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_2003 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_2004 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_2005 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_2006 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_2007 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_2008 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_2009 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_2010 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_2011 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_2012 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_2013 tablespace result1;
alter table activity_sum move subpartition activity_sum_storet_y_2014 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_2015 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_2016 tablespace result4;
alter table activity_sum move subpartition activity_sum_storet_y_2017 tablespace result2;
alter table activity_sum move subpartition activity_sum_storet_y_2018 tablespace result3;
alter table activity_sum move subpartition activity_sum_storet_y_maxx tablespace result2;
--rollback alter table activity_sum move subpartition activity_sum_storet_p_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1991 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1992 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1993 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1994 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1995 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1996 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1997 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1998 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_1999 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2000 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2001 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2002 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2003 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2004 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2005 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2006 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2007 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2008 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2009 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2010 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2011 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2012 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2013 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2014 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2015 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2016 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2017 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_2018 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_storet_y_maxx tablespace wqp;

--changeset drsteini:alter-activity_sum-biodata-subpartitions
alter table activity_sum move subpartition activity_sum_biodata_p_1990 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_1990 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_1991 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_1992 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_1993 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_1994 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_1995 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_1996 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_1997 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_1998 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_1999 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_2000 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_2001 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_2002 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_2003 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_2004 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_2005 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_2006 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_2007 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_2008 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_2009 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_2010 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_2011 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_2012 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_2013 tablespace result1;
alter table activity_sum move subpartition activity_sum_biodata_y_2014 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_2015 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_2016 tablespace result4;
alter table activity_sum move subpartition activity_sum_biodata_y_2017 tablespace result2;
alter table activity_sum move subpartition activity_sum_biodata_y_2018 tablespace result3;
alter table activity_sum move subpartition activity_sum_biodata_y_maxx tablespace result2;
--rollback alter table activity_sum move subpartition activity_sum_biodata_p_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1991 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1992 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1993 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1994 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1995 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1996 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1997 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1998 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_1999 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2000 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2001 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2002 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2003 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2004 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2005 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2006 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2007 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2008 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2009 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2010 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2011 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2012 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2013 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2014 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2015 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2016 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2017 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_2018 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_biodata_y_maxx tablespace wqp;

--changeset drsteini:alter-activity_sum-garbage-subpartitions
alter table activity_sum move subpartition activity_sum_garbage_p_1990 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_1990 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_1991 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_1992 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_1993 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_1994 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_1995 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_1996 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_1997 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_1998 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_1999 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_2000 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_2001 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_2002 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_2003 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_2004 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_2005 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_2006 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_2007 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_2008 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_2009 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_2010 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_2011 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_2012 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_2013 tablespace result1;
alter table activity_sum move subpartition activity_sum_garbage_y_2014 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_2015 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_2016 tablespace result4;
alter table activity_sum move subpartition activity_sum_garbage_y_2017 tablespace result2;
alter table activity_sum move subpartition activity_sum_garbage_y_2018 tablespace result3;
alter table activity_sum move subpartition activity_sum_garbage_y_maxx tablespace result2;
--rollback alter table activity_sum move subpartition activity_sum_garbage_p_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1990 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1991 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1992 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1993 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1994 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1995 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1996 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1997 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1998 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_1999 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2000 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2001 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2002 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2003 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2004 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2005 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2006 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2007 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2008 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2009 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2010 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2011 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2012 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2013 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2014 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2015 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2016 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2017 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_2018 tablespace wqp;
--rollback alter table activity_sum move subpartition activity_sum_garbage_y_maxx tablespace wqp;

--changeset drsteini:alter-result_sum-stewards-subpartitions
alter table result_sum move subpartition result_sum_stewards_p_1990 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_1990 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_1991 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_1992 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_1993 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_1994 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_1995 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_1996 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_1997 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_1998 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_1999 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_2000 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_2001 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_2002 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_2003 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_2004 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_2005 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_2006 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_2007 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_2008 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_2009 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_2010 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_2011 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_2012 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_2013 tablespace result1;
alter table result_sum move subpartition result_sum_stewards_y_2014 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_2015 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_2016 tablespace result4;
alter table result_sum move subpartition result_sum_stewards_y_2017 tablespace result2;
alter table result_sum move subpartition result_sum_stewards_y_2018 tablespace result3;
alter table result_sum move subpartition result_sum_stewards_y_maxx tablespace result2;
--rollback alter table result_sum move subpartition result_sum_stewards_p_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1991 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1992 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1993 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1994 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1995 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1996 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1997 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1998 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_1999 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2000 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2001 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2002 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2003 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2004 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2005 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2006 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2007 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2008 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2009 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2010 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2011 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2012 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2013 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2014 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2015 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2016 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2017 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_2018 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_stewards_y_maxx tablespace wqp;

--changeset drsteini:alter-result_sum-nwis-subpartitions
alter table result_sum move subpartition result_sum_nwis_p_1990 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_1990 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_1991 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_1992 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_1993 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_1994 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_1995 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_1996 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_1997 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_1998 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_1999 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_2000 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_2001 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_2002 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_2003 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_2004 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_2005 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_2006 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_2007 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_2008 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_2009 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_2010 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_2011 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_2012 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_2013 tablespace result1;
alter table result_sum move subpartition result_sum_nwis_y_2014 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_2015 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_2016 tablespace result4;
alter table result_sum move subpartition result_sum_nwis_y_2017 tablespace result2;
alter table result_sum move subpartition result_sum_nwis_y_2018 tablespace result3;
alter table result_sum move subpartition result_sum_nwis_y_maxx tablespace result2;
--rollback alter table result_sum move subpartition result_sum_nwis_p_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1991 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1992 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1993 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1994 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1995 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1996 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1997 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1998 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_1999 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2000 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2001 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2002 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2003 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2004 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2005 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2006 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2007 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2008 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2009 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2010 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2011 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2012 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2013 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2014 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2015 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2016 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2017 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_2018 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_nwis_y_maxx tablespace wqp;

--changeset drsteini:alter-result_sum-storet-subpartitions
alter table result_sum move subpartition result_sum_storet_p_1990 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_1990 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_1991 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_1992 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_1993 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_1994 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_1995 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_1996 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_1997 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_1998 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_1999 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_2000 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_2001 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_2002 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_2003 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_2004 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_2005 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_2006 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_2007 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_2008 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_2009 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_2010 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_2011 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_2012 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_2013 tablespace result1;
alter table result_sum move subpartition result_sum_storet_y_2014 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_2015 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_2016 tablespace result4;
alter table result_sum move subpartition result_sum_storet_y_2017 tablespace result2;
alter table result_sum move subpartition result_sum_storet_y_2018 tablespace result3;
alter table result_sum move subpartition result_sum_storet_y_maxx tablespace result2;
--rollback alter table result_sum move subpartition result_sum_storet_p_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1991 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1992 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1993 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1994 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1995 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1996 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1997 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1998 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_1999 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2000 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2001 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2002 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2003 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2004 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2005 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2006 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2007 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2008 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2009 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2010 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2011 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2012 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2013 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2014 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2015 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2016 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2017 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_2018 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_storet_y_maxx tablespace wqp;

--changeset drsteini:alter-result_sum-biodata-subpartitions
alter table result_sum move subpartition result_sum_biodata_p_1990 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_1990 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_1991 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_1992 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_1993 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_1994 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_1995 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_1996 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_1997 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_1998 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_1999 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_2000 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_2001 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_2002 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_2003 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_2004 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_2005 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_2006 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_2007 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_2008 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_2009 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_2010 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_2011 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_2012 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_2013 tablespace result1;
alter table result_sum move subpartition result_sum_biodata_y_2014 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_2015 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_2016 tablespace result4;
alter table result_sum move subpartition result_sum_biodata_y_2017 tablespace result2;
alter table result_sum move subpartition result_sum_biodata_y_2018 tablespace result3;
alter table result_sum move subpartition result_sum_biodata_y_maxx tablespace result2;
--rollback alter table result_sum move subpartition result_sum_biodata_p_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1991 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1992 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1993 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1994 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1995 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1996 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1997 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1998 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_1999 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2000 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2001 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2002 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2003 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2004 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2005 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2006 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2007 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2008 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2009 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2010 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2011 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2012 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2013 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2014 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2015 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2016 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2017 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_2018 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_biodata_y_maxx tablespace wqp;

--changeset drsteini:alter-result_sum-garbage-subpartitions
alter table result_sum move subpartition result_sum_garbage_p_1990 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_1990 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_1991 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_1992 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_1993 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_1994 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_1995 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_1996 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_1997 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_1998 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_1999 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_2000 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_2001 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_2002 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_2003 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_2004 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_2005 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_2006 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_2007 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_2008 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_2009 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_2010 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_2011 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_2012 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_2013 tablespace result1;
alter table result_sum move subpartition result_sum_garbage_y_2014 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_2015 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_2016 tablespace result4;
alter table result_sum move subpartition result_sum_garbage_y_2017 tablespace result2;
alter table result_sum move subpartition result_sum_garbage_y_2018 tablespace result3;
alter table result_sum move subpartition result_sum_garbage_y_maxx tablespace result2;
--rollback alter table result_sum move subpartition result_sum_garbage_p_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1990 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1991 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1992 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1993 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1994 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1995 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1996 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1997 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1998 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_1999 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2000 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2001 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2002 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2003 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2004 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2005 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2006 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2007 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2008 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2009 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2010 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2011 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2012 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2013 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2014 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2015 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2016 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2017 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_2018 tablespace wqp;
--rollback alter table result_sum move subpartition result_sum_garbage_y_maxx tablespace wqp;

--changeset drsteini:create-index-station_sum_country
create bitmap index station_sum_country on station_sum(country_code) local;
--rollback drop index station_sum_country;


