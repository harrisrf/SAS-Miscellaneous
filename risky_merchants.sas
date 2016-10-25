libname fraud '' access=readonly;
libname merch '' access=readonly;

proc sql;
	create table chargebacks as
	select co as co_cde, merch_no as mrch_acct_no, count(*) as volume, sum(amount) as value
	from fraud.chargeback_txn 
	where merch_no ne .
	group by co, merch_no
	having volume >= 4 or value >= 2500;
quit;

proc sql;
	create table fraud as 
	select 15 as co_cde, mrch_acct_no, count(*) as volume, sum(fraud_amnt) as value
	from fraud.CONFIRMED_FRAUD 
	where mrch_acct_no ne .
	group by co_cde, mrch_acct_no
	having volume >= 4 or value >= 8000;
quit;

proc sql;
	create table risky as 
	select distinct co_cde, mrch_acct_no from chargebacks union 
	select distinct co_cde, mrch_acct_no from fraud;
quit;

proc sql;
	create table full_data as 
	select 
		a.co_cde, a.mrch_acct_no,
		case when a.mcc = 5541 then 1 else 0 end as mcc_5541,
		case when a.mcc = 5499 then 1 else 0 end as mcc_5499,
		case when a.mcc = 5651 then 1 else 0 end as mcc_5651,
		case when a.mcc = 5411 then 1 else 0 end as mcc_5411,
		case when a.mcc = 5812 then 1 else 0 end as mcc_5812,
		case when a.mcc = 5921 then 1 else 0 end as mcc_5921,
		case when a.mcc = 5814 then 1 else 0 end as mcc_5814,
		case when a.mcc = 5311 then 1 else 0 end as mcc_5311,
		case when a.mcc = 7011 then 1 else 0 end as mcc_7011,
		case when a.mcc = 5691 then 1 else 0 end as mcc_5691,
		case when a.mcc = 5712 then 1 else 0 end as mcc_5712,
		case when a.mcc = 5912 then 1 else 0 end as mcc_5912,
		case when a.mcc = 5813 then 1 else 0 end as mcc_5813,
		case when a.mcc = 5661 then 1 else 0 end as mcc_5661,
		case when a.mcc = 5944 then 1 else 0 end as mcc_5944,
		case when a.mcc = 5941 then 1 else 0 end as mcc_5941,
		case when a.mcc = 5533 then 1 else 0 end as mcc_5533,
		case when a.mcc = 5111 then 1 else 0 end as mcc_5111,
		case when a.mcc = 4812 then 1 else 0 end as mcc_4812,
		case when a.mcc = 5511 then 1 else 0 end as mcc_5511,
		case when a.mcc = 5621 then 1 else 0 end as mcc_5621,
		case when a.mcc = 5422 then 1 else 0 end as mcc_5422,
		case when a.mcc = 4722 then 1 else 0 end as mcc_4722,
		case when a.mcc = 5611 then 1 else 0 end as mcc_5611,
		case when a.mcc = 5251 then 1 else 0 end as mcc_5251,
		case when a.mcc = 4784 then 1 else 0 end as mcc_4784,
		case when a.mcc = 5977 then 1 else 0 end as mcc_5977,
		case when a.mcc = 5732 then 1 else 0 end as mcc_5732,
		case when a.mcc = 7512 then 1 else 0 end as mcc_7512,
		case when a.mcc = 5045 then 1 else 0 end as mcc_5045,
		case when a.mcc = 7230 then 1 else 0 end as mcc_7230,
		case when a.mcc = 5631 then 1 else 0 end as mcc_5631,
		case when a.mcc = 5722 then 1 else 0 end as mcc_5722,
		case when a.mcc = 5945 then 1 else 0 end as mcc_5945,
		case when a.mcc = 5735 then 1 else 0 end as mcc_5735,
		case when a.mcc = 5211 then 1 else 0 end as mcc_5211,
		case when a.mcc = 7832 then 1 else 0 end as mcc_7832,
		case when a.mcc = 5947 then 1 else 0 end as mcc_5947,
		case when a.mcc = 3719 then 1 else 0 end as mcc_3719,
		case when a.mcc = 5970 then 1 else 0 end as mcc_5970,
		case when a.mcc = 5948 then 1 else 0 end as mcc_5948,
		case when a.mcc = 8042 then 1 else 0 end as mcc_8042,
		case when a.mcc = 5399 then 1 else 0 end as mcc_5399,
		case when a.mcc = 7538 then 1 else 0 end as mcc_7538,
		case when a.mcc = 5532 then 1 else 0 end as mcc_5532,
		case when a.mcc = 7298 then 1 else 0 end as mcc_7298,
		case when a.mcc = 5641 then 1 else 0 end as mcc_5641,
		case when a.mcc = 5719 then 1 else 0 end as mcc_5719,
		case when a.mcc = 7012 then 1 else 0 end as mcc_7012,
		case when a.mcc = 763 then 1 else 0 end as mcc_763,
		case when a.mcc = 7997 then 1 else 0 end as mcc_7997,
		case when a.mcc = 5999 then 1 else 0 end as mcc_5999,
		case when a.mcc = 4511 then 1 else 0 end as mcc_4511,
		case when a.mcc = 5942 then 1 else 0 end as mcc_5942,
		case when a.mcc = 5013 then 1 else 0 end as mcc_5013,
		case when a.mcc = 5949 then 1 else 0 end as mcc_5949,
		case when a.mcc = 5441 then 1 else 0 end as mcc_5441,
		case when a.mcc = 5655 then 1 else 0 end as mcc_5655,
		case when a.mcc = 5733 then 1 else 0 end as mcc_5733,
		case when a.mcc = 8099 then 1 else 0 end as mcc_8099,
		case when a.mcc = 5065 then 1 else 0 end as mcc_5065,
		case when a.mcc = 5699 then 1 else 0 end as mcc_5699,
		case when a.mcc = 3381 then 1 else 0 end as mcc_3381,
		case when a.mcc = 5969 then 1 else 0 end as mcc_5969,
		case when a.mcc = 5462 then 1 else 0 end as mcc_5462,
		case when a.mcc = 5713 then 1 else 0 end as mcc_5713,
		case when a.mcc = 8398 then 1 else 0 end as mcc_8398,
		case when a.mcc = 5992 then 1 else 0 end as mcc_5992,
		case when a.mcc = 5811 then 1 else 0 end as mcc_5811,
		case when a.mcc = 5993 then 1 else 0 end as mcc_5993,
		case when a.mcc = 4131 then 1 else 0 end as mcc_4131,
		case when a.mcc = 5995 then 1 else 0 end as mcc_5995,
		case when a.mcc = 5072 then 1 else 0 end as mcc_5072,
		case when a.mcc = 4900 then 1 else 0 end as mcc_4900,
		case when a.mcc = 7991 then 1 else 0 end as mcc_7991,
		case when a.mcc = 3717 then 1 else 0 end as mcc_3717,
		case when a.mcc = 8062 then 1 else 0 end as mcc_8062,
		case when a.mcc = 5931 then 1 else 0 end as mcc_5931,
		case when a.mcc = 7311 then 1 else 0 end as mcc_7311,
		case when a.mcc = 5734 then 1 else 0 end as mcc_5734,
		case when a.mcc = 5971 then 1 else 0 end as mcc_5971,
		case when a.mcc = 5965 then 1 else 0 end as mcc_5965,
		case when a.mcc = 8011 then 1 else 0 end as mcc_8011,
		case when a.mcc = 7399 then 1 else 0 end as mcc_7399,
		case when a.mcc = 7531 then 1 else 0 end as mcc_7531,
		case when a.mcc = 3395 then 1 else 0 end as mcc_3395,
		case when a.mcc = 5943 then 1 else 0 end as mcc_5943,
		case when a.mcc = 5521 then 1 else 0 end as mcc_5521,
		case when a.mcc = 5261 then 1 else 0 end as mcc_5261,
		case when a.mcc = 742 then 1 else 0 end as mcc_742,
		case when a.mcc = 8299 then 1 else 0 end as mcc_8299,
		case when a.mcc = 4214 then 1 else 0 end as mcc_4214,
		case when a.mcc = 7995 then 1 else 0 end as mcc_7995,
		case when a.mcc = 5451 then 1 else 0 end as mcc_5451,
		case when a.mcc = 9399 then 1 else 0 end as mcc_9399,
		case when a.mcc = 6300 then 1 else 0 end as mcc_6300,
		case when a.mcc = 5231 then 1 else 0 end as mcc_5231,
		case when a.mcc = 5983 then 1 else 0 end as mcc_5983,
		case when a.mcc = 7372 then 1 else 0 end as mcc_7372,
		case when a.mcc = 5940 then 1 else 0 end as mcc_5940,
		case when a.platform = 'STD_POS' then 1 else 0 end as platform_std,
		case when a.platform = 'INT_POS' then 1 else 0 end as platform_int,
		case when a.platform = 'ECOMM' then 1 else 0 end as platform_ecom,
		case when a.frch_tag ne 'Independent' then 1 else 0 end as franchise,
		case when a.bank_name = 'FIRSTRAND BANK' then 1 else 0 end as fnb_banked,
		case when length(co_reg_no) in (13, 14) then 1 else 0 end as valid_company,
		case when substr(vat_reg_no, 1, 1) = '4' and length(vat_reg_no) = 10 then 1 else 0 end as valid_vat,
		case when b.co_cde is not null then 1 else 0 end as risky
	from 
		merch.reg_conf as a
		left join risky as b on a.co_cde=b.co_cde and a.mrch_acct_no=b.mrch_acct_no
	where a.co_cde = 15 and a.stat_cde ne 'CLO';
quit;

data full_data;
	set full_data;

	random = rand('uniform');
	if random < 0.1 then sample_group = 1;
	else if random < 0.2 then sample_group = 2;
	else if random < 0.3 then sample_group = 3;
	else if random < 0.4 then sample_group = 4;
	else if random < 0.5 then sample_group = 5;
	else if random < 0.6 then sample_group = 6;
	else if random < 0.7 then sample_group = 7;
	else if random < 0.8 then sample_group = 8;
	else if random < 0.9 then sample_group = 9;
	else sample_group = 10;
	drop random;
run;

/* Create a data set to store all the model scores */
proc sql;
	create table f1_scores (threshold num, score_id num, accuracy num, f1_score num, precision num, recall num);
quit;

/* Big macro loop to do the k-fold cross validation as well as tune the threshold parameter */
/* K in this case is 10 because we split the training data set into 10 blocks */
%macro randomforest_cv();
%do k = 1 %to 10; /* Train with 10 different models */

/* Random Forest Model which trains on all the data except k */
	proc hpforest
		data=full_data(where=(sample_group ne &k.)) 
		maxtrees=151
	/*	leafsize = 100*/
	/*	maxdepth = 7 */
	;
	target risky /level=binary;
	input 
		mcc_5541 mcc_5499 mcc_5651 mcc_5411 mcc_5812 mcc_5921 mcc_5814 mcc_5311 mcc_7011 mcc_5691 mcc_5712 mcc_5912 mcc_5813 mcc_5661
		mcc_5944 mcc_5941 mcc_5533 mcc_5111 mcc_4812 mcc_5511 mcc_5621 mcc_5422 mcc_4722 mcc_5611 mcc_5251 mcc_4784 mcc_5977 mcc_5732
		mcc_7512 mcc_5045 mcc_7230 mcc_5631 mcc_5722 mcc_5945 mcc_5735 mcc_5211 mcc_7832 mcc_5947 mcc_3719 mcc_5970 mcc_5948 mcc_8042
		mcc_5399 mcc_7538 mcc_5532 mcc_7298 mcc_5641 mcc_5719 mcc_7012 mcc_763 mcc_7997 mcc_5999 mcc_4511 mcc_5942 mcc_5013 mcc_5949 mcc_5441	mcc_5655	mcc_5733	mcc_8099	mcc_5065	mcc_5699	mcc_3381	mcc_5969	
		mcc_5462 mcc_5713 mcc_8398 mcc_5992 mcc_5811 mcc_5993 mcc_4131 mcc_5995 mcc_5072 mcc_4900 mcc_7991 mcc_3717 mcc_8062 mcc_5931 mcc_7311	mcc_5734	mcc_5971	mcc_5965	mcc_8011	mcc_7399	mcc_7531	mcc_3395	
		mcc_5943 mcc_5521 mcc_5261 mcc_742 mcc_8299 mcc_4214 mcc_7995 mcc_5451 mcc_9399 mcc_6300 mcc_5231 mcc_5983 mcc_7372 mcc_5940
		platform_std platform_int platform_ecom
		franchise fnb_banked	
		valid_company valid_vat
		/level=binary;
	save file="/grid/nfsshare/department21fs/Users/f3879852/risk_rf_cv_&k..bin"; 
	run;

/* Score the model on data set k that we left out */
	proc hp4score data=full_data;
		id risky;
		score file="/grid/nfsshare/department21fs/Users/f3879852/risk_rf_cv_&k..bin" out=score_rf;
	run;

/* Support Vector Machine */
proc hpsvm data=full_data(where=(sample_group ne &k.));
target risky;
	input
		mcc_5541 mcc_5499 mcc_5651 mcc_5411 mcc_5812 mcc_5921 mcc_5814 mcc_5311 mcc_7011 mcc_5691 mcc_5712 mcc_5912 mcc_5813 mcc_5661
		mcc_5944 mcc_5941 mcc_5533 mcc_5111 mcc_4812 mcc_5511 mcc_5621 mcc_5422 mcc_4722 mcc_5611 mcc_5251 mcc_4784 mcc_5977 mcc_5732
		mcc_7512 mcc_5045 mcc_7230 mcc_5631 mcc_5722 mcc_5945 mcc_5735 mcc_5211 mcc_7832 mcc_5947 mcc_3719 mcc_5970 mcc_5948 mcc_8042
		mcc_5399 mcc_7538 mcc_5532 mcc_7298 mcc_5641 mcc_5719 mcc_7012 mcc_763 mcc_7997 mcc_5999 mcc_4511 mcc_5942 mcc_5013 mcc_5949 mcc_5441	mcc_5655	mcc_5733	mcc_8099	mcc_5065	mcc_5699	mcc_3381	mcc_5969	
		mcc_5462 mcc_5713 mcc_8398 mcc_5992 mcc_5811 mcc_5993 mcc_4131 mcc_5995 mcc_5072 mcc_4900 mcc_7991 mcc_3717 mcc_8062 mcc_5931 mcc_7311	mcc_5734	mcc_5971	mcc_5965	mcc_8011	mcc_7399	mcc_7531	mcc_3395	
		mcc_5943 mcc_5521 mcc_5261 mcc_742 mcc_8299 mcc_4214 mcc_7995 mcc_5451 mcc_9399 mcc_6300 mcc_5231 mcc_5983 mcc_7372 mcc_5940
		platform_std platform_int platform_ecom
		franchise fnb_banked	
		valid_company valid_vat
 		/level=binary;
	code file="/grid/nfsshare/department21fs/Users/f3879852/risk_svm_cv_&k..sas";
run;

/* Score Support Vector Machine */
data score_svm;
	set full_data;
	%include "/grid/nfsshare/department21fs/Users/f3879852/risk_svm_cv_&k..sas";
	svm = p_risky1;
	keep risky svm;
run;

/* Train Neural Network */
	proc hpneural data=full_data(where=(sample_group ne &k.)) ;
		target risky /level = nom;
		input
			mcc_5541 mcc_5499 mcc_5651 mcc_5411 mcc_5812 mcc_5921 mcc_5814 mcc_5311 mcc_7011 mcc_5691 mcc_5712 mcc_5912 mcc_5813 mcc_5661
			mcc_5944 mcc_5941 mcc_5533 mcc_5111 mcc_4812 mcc_5511 mcc_5621 mcc_5422 mcc_4722 mcc_5611 mcc_5251 mcc_4784 mcc_5977 mcc_5732
			mcc_7512 mcc_5045 mcc_7230 mcc_5631 mcc_5722 mcc_5945 mcc_5735 mcc_5211 mcc_7832 mcc_5947 mcc_3719 mcc_5970 mcc_5948 mcc_8042
			mcc_5399 mcc_7538 mcc_5532 mcc_7298 mcc_5641 mcc_5719 mcc_7012 mcc_763 mcc_7997 mcc_5999 mcc_4511 mcc_5942 mcc_5013 mcc_5949 mcc_5441	mcc_5655	mcc_5733	mcc_8099	mcc_5065	mcc_5699	mcc_3381	mcc_5969	
			mcc_5462 mcc_5713 mcc_8398 mcc_5992 mcc_5811 mcc_5993 mcc_4131 mcc_5995 mcc_5072 mcc_4900 mcc_7991 mcc_3717 mcc_8062 mcc_5931 mcc_7311	mcc_5734	mcc_5971	mcc_5965	mcc_8011	mcc_7399	mcc_7531	mcc_3395	
			mcc_5943 mcc_5521 mcc_5261 mcc_742 mcc_8299 mcc_4214 mcc_7995 mcc_5451 mcc_9399 mcc_6300 mcc_5231 mcc_5983 mcc_7372 mcc_5940
			platform_std platform_int platform_ecom
			franchise fnb_banked	
			valid_company valid_vat
		/level=nom;
		hidden 2;
		train outmodel=model_neural maxiter=1000;
		code file="/grid/nfsshare/department21fs/Users/f3879852/risk_neural_cv_&k..sas";
	run;

/* Score Neural Network */
	data score_neural;
		set full_data;
		%include "/grid/nfsshare/department21fs/Users/f3879852/risk_neural_cv_&k..sas";
		neural = p_risky1;
		keep risky neural;
	run;

data ensemble;
	merge full_data score_neural(drop=risky) score_svm(drop=risky) score_rf(drop=risky);
	rf = p_risky1;
	drop p_risky0 p_risky1 I_risky _warn_;
run;

proc hpforest
	data=ensemble(where=(sample_group ne &k.)) 
	maxtrees=151;
	target risky /level=binary;
	input neural svm rf /level=interval;
	save file="/grid/nfsshare/department21fs/Users/f3879852/risk_rf_ensemble.bin"; 
run;

/* Score the model on data set k that we left out */
proc hp4score data=ensemble(where=(sample_group = &k.)) ;
	id risky;
	score file="/grid/nfsshare/department21fs/Users/f3879852/risk_rf_ensemble.bin" out=rfscored;
run;

	%do i = 1 %to 10; /* Test paramaters between 0.1 and 1 */
	
	/* Initialise variables so if something breaks scores will be zero */
	%let tp = 0;
	%let tn = 0;
	%let accuracy = 0;
	%let precision = 0;
	%let recall = 0;
		
	/* Create a confusion matrix to calculate the scores */
	proc sql;
	create table confusion_rf as
	select 
		case when risky > 0 then -1 else 0 end as actual,
		case when p_risky1 >= (&i. / 10) then -1 else 0 end as predicted,
		count(*) as entries
	from rfscored
	group by calculated actual, calculated predicted
	order by actual;
	quit;

	/* Flip the data set around */
	proc transpose data=confusion_rf out=t_confusion_rf;
		id predicted;
		by actual;
		var entries;
	run;

	/* Calculate the scores */
	proc sql;
		select '-1'n into: tp from t_confusion_rf where actual = -1;
		select '0'n into: tn from t_confusion_rf where actual = 0;
		select (&tp. + &tn.) / (sum('-1'n) + sum('0'n)) into: accuracy from t_confusion_rf;
		select &tp./ sum('-1'n) into: precision from t_confusion_rf;
		select &tp. / sum('-1'n, '0'n) into: recall from  t_confusion_rf where actual = -1;
	quit;

	/* Save the scores */
	proc sql;
		insert into f1_scores
			set 
				threshold = (&i. / 10), 
				score_id = &k., 
				accuracy = &accuracy.,
				f1_score = 2 * (&precision. * &recall.) / (&precision. + &recall.),
				precision = &precision.,
				recall = &recall.;
	quit;
	%end;
%end;
%mend;

%randomforest_cv;
