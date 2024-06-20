Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7DF1BA860
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718908141; cv=fail; b=afs7rv+NeJpzgvR5F9p+9ave+WPeblMtGcU4fpqtGK3msfiPCh1w1e6mf+dkBGdB3M3opf4tQ4GsC9v60U1kyWRij+wYi1/ox39pgeMlWZSaMdRRJKI03Qgf+/R3UzU+0H9vS3lr0SUCTHLVaCPTg+zU4YT97yDiKw+/dd1LWxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718908141; c=relaxed/simple;
	bh=PgB8HpXmtNc2Wq2CpX73YOXtwXsusQVX7dyzOuzJs/c=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hr0gEekZpJBN/STrYootY0xBrxDMuOXkk5pRXxnj3YotjIhnKwbDwVaSuL8qe2saSXYWhMHSZuBa5BSV+firm8WAtYWa7q0fb0RF8WSFuyQVhxC1SxKZrvE0OHsCC9eNqBKAqbu4QkVE4lxXq4+9x4lleyw23b578AcEW6RPZDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fk72D2k3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yO03Sj8U; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fk72D2k3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yO03Sj8U"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHAjbT001413
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=Syys9hwx3SHiU68d7+yy45i2DlRiUNANwApB5I+bB6o=; b=
	Fk72D2k3m5NH4Gv+fZY47QYIw0bhxNCSK3wgbsWHPHmwsxdNyy/dBGdyiif3xDmd
	5WmmQ8dBAZyJCXiz8K1wlQcLCOBMjNuV8le+dktDWKI9Vxrc2pI0M258CEk0NrQk
	UmD3CIvNl3faj9420kDpmhvDJ2f7UMaBo4P2pZNiZoMUY3VxYHxLoToL233v857K
	ipRpP+FWTMLqcx4Or3occawXDBr6RMXghENt3Vg7pIi7zfQigDzDdl5O8PAGYj08
	Y+q5u3DptvNNY5R3sSMyTDGWcdg6nP0pkLtUUFrCbnOt9vO1T0yv1/ARKb7bDqzo
	RaShzYxUPjU5Fk3w9TYLyw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkd052a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 18:28:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHEIH7019476
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 18:28:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn9asst-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 18:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT0MymBjCUHvand6s331s+/TT08IPdOxedjKUHCF+x3blBJL6C2A44z175TzSSVVIaeyxEi7EUI37SLv66mdvvN/7UQmAJ/dbEJuYuwO8loSmnIbMslBz9mReO18vzQjsp1XRw5AC5LASo4gwEmlpRFc0KnEUPzW9prdtv9JSU2o9SrgJ790CHzsJF8dBirSS/YZmz/uJ56RtGX1DMmoe982ldqtiaSM5Gu1c6+epOGIDt0HSds6utH9JXMa2OcFYWY2UJeQdBUhEoQCAN8ljMzl4Lp2zxUt6wqTJaD14sESPqRLhUmhTCzXDWM7H0UrlBiDfJGusMZPPqU/FpExHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syys9hwx3SHiU68d7+yy45i2DlRiUNANwApB5I+bB6o=;
 b=Fc+VLgMib+Q2xdISk6GLyIYI8HbA/gM8p07qwqH/JlEvHpS1CIkZZzgK9eRF1K9D+y2NU67CEiALbbkuwopBJr9mdbE1gC0BKEvU2eEhEAY0yt6KN4EDUzAXdCY7JqkOAtdtI9y3+QLgWVBSo/BMzEae4tlnAokssfTYVouKVsAL00dMdcj0Tu/fDbGX0y43uW2Glki/XfSeVYY9BpRXGICC7vA261iIW1W1ABjx3qinovVDMhm1S3BMjUjWVyMqApJ1MQ9Rj2o10e0fianPRuqaPiHoABfwQ5Af9B6N/I0+qP1wTFfsvzzNdA/i6VVMxY1h5apyVDl4B+uTbxbcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Syys9hwx3SHiU68d7+yy45i2DlRiUNANwApB5I+bB6o=;
 b=yO03Sj8UeXyyFp+U3tZSHiDL0hprosbvbPdqTc1tiesFdKdi05zAc8NugJ22MUHFver/60aIP1qSAMIjCPKhapz9t9ihjTTFPR62qcCxjxsDY/ALsEKWj36Wd6r6FkUUiDSPyoD+6c8I9S3aZJecHigT8rWxhtZEPJ3bK9vtJD0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB8130.namprd10.prod.outlook.com (2603:10b6:408:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 18:28:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 18:28:53 +0000
Date: Thu, 20 Jun 2024 14:28:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] dlibs: move x86_64 dlib directories to x.y names to match
 aarch64
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB628753BEAEB05A7B65F25569C2C82@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 564c4d71-395b-4433-fcf7-08dc9156d646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XL6SPSy/ok3fg02/vUdiw6lwMyhxcf2GLU+9+C/U7cYf3d/n50FGsd7JF4BJ?=
 =?us-ascii?Q?TyU9mkcdOuaxVA0ZSrct9+6gdjQWTq/lhx2k4vm8j0ONs9slAK153R9DHe5k?=
 =?us-ascii?Q?EP4GFPvSa6L5PV48ohoCRg0YPbTJvEVscnaU+/nmlz/f6mvltkt9pRBh3UUF?=
 =?us-ascii?Q?04NB8aOco6c6w3CgTPLxC5zl5eUtmLgp4Qssz6lX88cayJfskCH6T6bNoCpq?=
 =?us-ascii?Q?hm0/HZ1htm8rePUA3tOdY9dv4teH/wT095fiYBJTEcvdXwg53g804gX1ccDO?=
 =?us-ascii?Q?IVTXR/jn9LZ2FL26W0FHmReD85S3FjKZI/PYItVsmKC4QNiQSdfia9EnjLHl?=
 =?us-ascii?Q?fKEQxwtDhy2rkTTk7Jku0mk99ObYvWHFKpGLAPZ2q99oNW0pIqoxMZC9Zi8m?=
 =?us-ascii?Q?yoUXP0oQ0EZXI4BwONirxCgp+3guY059IS1L6lz1+Xq2StFPWPfAXu0X7E2w?=
 =?us-ascii?Q?peQ1M29IgfrAcJNzOJgnDYQigA+3UAKLeABmludRbgPpeZ4DdTDvYIOx8LuZ?=
 =?us-ascii?Q?m6bzpCn0W30YauCDZHZoI5ACf2reUSXkM82BRHPFJ3NrBQrRvi8bsknFxs0S?=
 =?us-ascii?Q?nC2anFJYRUTXOO1OCAqy7Zqm8XEma3G+W2oZa26WXQT1fUy2ul3gS5//2UNS?=
 =?us-ascii?Q?pQu1NqQZ0p4bb7KQTuSTPYaCs5Cur7h807PuuhhxTh7ANiQm9v9dnoF3aBbx?=
 =?us-ascii?Q?FIs464vtSaPwJp8fPUzGiSqMatq3pAw/+fcxT5d8RUqJScpyFS83MlhanbJN?=
 =?us-ascii?Q?kbHVBUDuNLWSuzhXRb09XvgUgI7gyGaaherqC5BiWWhr9yQiWrZac/dD20Il?=
 =?us-ascii?Q?k15dDRTGdL+iKMKLX81KOZfa3WrIs01WtcdTAc8ekwGPbAWjL6vuBd/EfE9c?=
 =?us-ascii?Q?VD7KkS2CSLx50oXIxeTA/tiKa0Vf0OLsA0gVCS8tAhME69m+2jl1Uc8EHeBn?=
 =?us-ascii?Q?FrcojpcK8EDAdt/bZETKCN/5UJfyhdTY5A7P+h5z+hShJv6zmVOIIEXcf5al?=
 =?us-ascii?Q?yru3q/UkMT+cPreC3IC1y0+YbezEN6J4T63xHBzWXUGMKjaY282AIA/yRPZy?=
 =?us-ascii?Q?LBp71IB2JADLmrFVTpY3V1ueh2pj5U6w5MShEDsU4ByhbxiyNg3fuXU91ltj?=
 =?us-ascii?Q?Uto4X4ojOhvfatc9vtDQvPbaGPkxVdRnD694HT0vIEbuZ0+7kf2m61GZreNj?=
 =?us-ascii?Q?i6tc4svBUv2NyoQDcbuwBF04pHw8Q7+Txm0KsNJTpevpxvOzW7zB9RpB9K6+?=
 =?us-ascii?Q?v0bXb/f/RlTNy1HcJo1/8/hoxNOuq9JkWNlXTk1rEK+yUCeoNo0ZoG5X6kRW?=
 =?us-ascii?Q?yzohwerQmJ/vG9kpgM+27iOq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FmjK0nOJQ+CbMn8w2Al8Uo17gUr/aPq75SGK46EEXaYcQPyrUL8tAs8VZbhW?=
 =?us-ascii?Q?N4r2pBJeEDLPOetg3D3qZ88H3jDbzCHR1tJxstTLf9yhQpmJKD8ZZ968UHSZ?=
 =?us-ascii?Q?omYV7W41R9WPhRkxGxY896x8tpXEtLWR6UGAx6YoEcXZX8MYKH/+XtB8ZPl0?=
 =?us-ascii?Q?+WNIzrzGMC0wFYu3RmO6fRSmMYBXkhxKd9M4nlUWSpSdW7BBnOxhQ5SG+T1C?=
 =?us-ascii?Q?py1LMsUMZbi6ixjEA1fAugCOW5j1UUOX70yITMnRVNp4jmLMxztQn6gedCTk?=
 =?us-ascii?Q?/j6OD1V2IjHzCCWZ6kFpAT7HknhFKr9c2X0geHk1SOqaDWEFBNI8n0p3h+e5?=
 =?us-ascii?Q?M1aNpGZ142/jtdCmhHc5t8zuLtpt9dzpL5eqSMrT7/lfE+z9vjAbjgenDiEz?=
 =?us-ascii?Q?CY9U8ZUXAn4wnmsPMbyYZ5xcIuf296Z5YjIYIXWVxmkGtD6pOFCA30MvXp3e?=
 =?us-ascii?Q?Ua24p1nNGXYTogw8xeAvl0a0jTAPz4HC9G6EecpOm9CGUdA1evBtlw7W7MT7?=
 =?us-ascii?Q?GV1P+hgX13fS+0IgTx9KY0/BFAFBoLK0vO4i/SlQthig92bhRxVmYk1KsKJT?=
 =?us-ascii?Q?+qLelG5S79NJ6/gqiltzLX/d5OqKtUI/WVq7n4lMry+6JTS6kHqAUkgPlyDp?=
 =?us-ascii?Q?OF/VzvnuLnEpLNV8JEPo864gsHZOCvL0PBGac5v6ZbebVi9Oq7lqedfZGNNc?=
 =?us-ascii?Q?aleldjFcwbupR6DDFM2PbbkNAD3cjtO+2O+4VaVaV9dRhUaFLX49unk4mBCg?=
 =?us-ascii?Q?I8rXQRIiIrWw5Kq82O3z7ffa2xLTBDQhf6OF7QSemUNeyscev8NGhuBSWXiA?=
 =?us-ascii?Q?gJMfSU+vqyzZadHSv4EIiyHXbD4TYxQ4uzp1ds5mne0qV38mnJWhorZjz6gs?=
 =?us-ascii?Q?GLCJAPeOWquN2Z9hXqo/2oCOw5JGkASUo/6DnhnBnd0St92A8XA+kQi8fNnN?=
 =?us-ascii?Q?888r0NzOoAfGSRIZH+fgHHkUm1oPR3A4oq117BBprlFekQB9w7S8O85kIs+2?=
 =?us-ascii?Q?it8k1Z/49uz3UyanAkfRazGG9/mBnogyuYBB3ObDe95RFJEaW6xrvVeiVPID?=
 =?us-ascii?Q?aMEQhcjS1CafVHSAx2+HC4N417foUU72fxtH16W03HpUboDiDMRkkv8+FZwg?=
 =?us-ascii?Q?DlQ9ApzQ59+Pe30p2q/mR2HAeHodfMQ2GqbeVblgdhxCGC30btLNkGhVnDSr?=
 =?us-ascii?Q?afVA4vCgmR9OYRy3p238TpXApQPJk4GVnrM65gmhrZSweVJKLZM6rwDOiYu5?=
 =?us-ascii?Q?RH98MNg5XQJPl5OXvT4OTJDW4EhXEBsF5VYoUynjpD9LwjjjIRshhRw1bD7J?=
 =?us-ascii?Q?5tfVTP00Ym/0BHM7MQMkobjgPM/7xc1yJRlU6R8+XWDljb7gt6Y9cqAF7yEl?=
 =?us-ascii?Q?mbr3XmevJTqcTs4RB58uXid71yXM/pFpI4QEP5XdTQh83VlFJkYhH7l0ysAW?=
 =?us-ascii?Q?nggxN+Q9Y4IIeH/fIdVyNZWXA8anKPsAnbJRhrSw7adv53JcMDVUZ2Jq9RIj?=
 =?us-ascii?Q?zzskEpa4jL/mgNv5pNKaSxxgVaINtvSPx2HrUIw/kOurSPIhBqiIvdJDcLCt?=
 =?us-ascii?Q?8HQgVyPfbQH+pXhQnWQqq83pyiizJRf+ueuE+Q8a3Rszw8/6uM4hKJIAEftD?=
 =?us-ascii?Q?x5F+aHT0J3UvsTiJ5faDw7M=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+SCaljf7O1dXKX6exVkzz/z3kJT6OSxQymorW0v8JDTBXIyjSaStJ3QHUJKFNXpRdDUEp+jYIz6+G755IyY9mVuRmImlhvj1SDP+/PFV/fCBIBoESU01LsuGjV8qmnP6gSo0PY7KFSasaRiR2ws4UghNcfNszRcHOaOMF+vuQj4cYFz2k8Oj6oRRUpCacPcgyhrkknugzxmKhpMo7g+JzcEXZRtSCmJFg8HzguXg1eeCAyp/GoToEPDLdWs19LwXhTPBkdyV9X6o73CzB0gEMkP7SNhqL1c+OPJK9zP2XZ6qBEL7y9/iGBJjHEAlxICsji4CRaNh781vsmjGKsVDLF7IHkPUOL8+c+OZDDs1q+B3+xUw8Gy4IWYf5XagoFEnXNTtRIlHp4EEA6wk8HXAhvyhZt5qso4lSXWhP3X3T6sqzrv0HiBYTUlMU6JbFOTTrJ3I5YUeTgPR+/LItM0FYcSGz0lGjMRsPsWniMF+jcuBhSMyHAKTBMhzgOVHtsjaKPGcUxuU4eLTjc08JnHXRb83fmhHZWrF0Y3AH1u47FBtGPVdgyJdrK1gcOQLhGhzII2uIqMkYw5L7q55en409eR8+kEw9HPIEDe1BOZLllQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564c4d71-395b-4433-fcf7-08dc9156d646
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 18:28:53.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4vdcWG3W7ixuy5bomIq9FcLkX0xIYVWJzZS1JfCWMRfvpCvoh8Pzql7+07HjB4b3RcafIVqUX6anB6tr6Y3inNRLMUptlgu33362dusnWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=943 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406200134
X-Proofpoint-GUID: AU2e0nFZu-2nLXXkd89U1xqIYdJKrL_R
X-Proofpoint-ORIG-GUID: AU2e0nFZu-2nLXXkd89U1xqIYdJKrL_R

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/x86_64/{5.11.0 => 5.11}/errno.d    | 0
 dlibs/x86_64/{5.11.0 => 5.11}/io.d       | 0
 dlibs/x86_64/{5.11.0 => 5.11}/ip.d       | 0
 dlibs/x86_64/{5.11.0 => 5.11}/lockstat.d | 0
 dlibs/x86_64/{5.11.0 => 5.11}/net.d      | 0
 dlibs/x86_64/{5.11.0 => 5.11}/pcap.d     | 0
 dlibs/x86_64/{5.11.0 => 5.11}/procfs.d   | 0
 dlibs/x86_64/{5.11.0 => 5.11}/regs.d     | 0
 dlibs/x86_64/{5.11.0 => 5.11}/sched.d    | 0
 dlibs/x86_64/{5.11.0 => 5.11}/signal.d   | 0
 dlibs/x86_64/{5.11.0 => 5.11}/tcp.d      | 0
 dlibs/x86_64/{5.11.0 => 5.11}/udp.d      | 0
 dlibs/x86_64/{5.11.0 => 5.11}/unistd.d   | 0
 dlibs/x86_64/{5.12.0 => 5.12}/errno.d    | 0
 dlibs/x86_64/{5.12.0 => 5.12}/io.d       | 0
 dlibs/x86_64/{5.12.0 => 5.12}/ip.d       | 0
 dlibs/x86_64/{5.12.0 => 5.12}/lockstat.d | 0
 dlibs/x86_64/{5.12.0 => 5.12}/net.d      | 0
 dlibs/x86_64/{5.12.0 => 5.12}/pcap.d     | 0
 dlibs/x86_64/{5.12.0 => 5.12}/procfs.d   | 0
 dlibs/x86_64/{5.12.0 => 5.12}/regs.d     | 0
 dlibs/x86_64/{5.12.0 => 5.12}/sched.d    | 0
 dlibs/x86_64/{5.12.0 => 5.12}/signal.d   | 0
 dlibs/x86_64/{5.12.0 => 5.12}/tcp.d      | 0
 dlibs/x86_64/{5.12.0 => 5.12}/udp.d      | 0
 dlibs/x86_64/{5.12.0 => 5.12}/unistd.d   | 0
 dlibs/x86_64/{5.14.0 => 5.14}/errno.d    | 0
 dlibs/x86_64/{5.14.0 => 5.14}/io.d       | 0
 dlibs/x86_64/{5.14.0 => 5.14}/ip.d       | 0
 dlibs/x86_64/{5.14.0 => 5.14}/lockstat.d | 0
 dlibs/x86_64/{5.14.0 => 5.14}/net.d      | 0
 dlibs/x86_64/{5.14.0 => 5.14}/pcap.d     | 0
 dlibs/x86_64/{5.14.0 => 5.14}/procfs.d   | 0
 dlibs/x86_64/{5.14.0 => 5.14}/regs.d     | 0
 dlibs/x86_64/{5.14.0 => 5.14}/sched.d    | 0
 dlibs/x86_64/{5.14.0 => 5.14}/signal.d   | 0
 dlibs/x86_64/{5.14.0 => 5.14}/tcp.d      | 0
 dlibs/x86_64/{5.14.0 => 5.14}/udp.d      | 0
 dlibs/x86_64/{5.14.0 => 5.14}/unistd.d   | 0
 dlibs/x86_64/{5.16.0 => 5.16}/errno.d    | 0
 dlibs/x86_64/{5.16.0 => 5.16}/io.d       | 0
 dlibs/x86_64/{5.16.0 => 5.16}/ip.d       | 0
 dlibs/x86_64/{5.16.0 => 5.16}/lockstat.d | 0
 dlibs/x86_64/{5.16.0 => 5.16}/net.d      | 0
 dlibs/x86_64/{5.16.0 => 5.16}/pcap.d     | 0
 dlibs/x86_64/{5.16.0 => 5.16}/procfs.d   | 0
 dlibs/x86_64/{5.16.0 => 5.16}/regs.d     | 0
 dlibs/x86_64/{5.16.0 => 5.16}/sched.d    | 0
 dlibs/x86_64/{5.16.0 => 5.16}/signal.d   | 0
 dlibs/x86_64/{5.16.0 => 5.16}/tcp.d      | 0
 dlibs/x86_64/{5.16.0 => 5.16}/udp.d      | 0
 dlibs/x86_64/{5.16.0 => 5.16}/unistd.d   | 0
 dlibs/x86_64/{5.2.0 => 5.2}/errno.d      | 0
 dlibs/x86_64/{5.2.0 => 5.2}/io.d         | 0
 dlibs/x86_64/{5.2.0 => 5.2}/ip.d         | 0
 dlibs/x86_64/{5.2.0 => 5.2}/lockstat.d   | 0
 dlibs/x86_64/{5.2.0 => 5.2}/net.d        | 0
 dlibs/x86_64/{5.2.0 => 5.2}/pcap.d       | 0
 dlibs/x86_64/{5.2.0 => 5.2}/procfs.d     | 0
 dlibs/x86_64/{5.2.0 => 5.2}/regs.d       | 0
 dlibs/x86_64/{5.2.0 => 5.2}/sched.d      | 0
 dlibs/x86_64/{5.2.0 => 5.2}/signal.d     | 0
 dlibs/x86_64/{5.2.0 => 5.2}/tcp.d        | 0
 dlibs/x86_64/{5.2.0 => 5.2}/udp.d        | 0
 dlibs/x86_64/{5.2.0 => 5.2}/unistd.d     | 0
 dlibs/x86_64/{5.6.0 => 5.6}/errno.d      | 0
 dlibs/x86_64/{5.6.0 => 5.6}/io.d         | 0
 dlibs/x86_64/{5.6.0 => 5.6}/ip.d         | 0
 dlibs/x86_64/{5.6.0 => 5.6}/lockstat.d   | 0
 dlibs/x86_64/{5.6.0 => 5.6}/net.d        | 0
 dlibs/x86_64/{5.6.0 => 5.6}/pcap.d       | 0
 dlibs/x86_64/{5.6.0 => 5.6}/procfs.d     | 0
 dlibs/x86_64/{5.6.0 => 5.6}/regs.d       | 0
 dlibs/x86_64/{5.6.0 => 5.6}/sched.d      | 0
 dlibs/x86_64/{5.6.0 => 5.6}/signal.d     | 0
 dlibs/x86_64/{5.6.0 => 5.6}/tcp.d        | 0
 dlibs/x86_64/{5.6.0 => 5.6}/udp.d        | 0
 dlibs/x86_64/{5.6.0 => 5.6}/unistd.d     | 0
 dlibs/x86_64/{6.1.0 => 6.1}/errno.d      | 0
 dlibs/x86_64/{6.1.0 => 6.1}/io.d         | 0
 dlibs/x86_64/{6.1.0 => 6.1}/ip.d         | 0
 dlibs/x86_64/{6.1.0 => 6.1}/lockstat.d   | 0
 dlibs/x86_64/{6.1.0 => 6.1}/net.d        | 0
 dlibs/x86_64/{6.1.0 => 6.1}/pcap.d       | 0
 dlibs/x86_64/{6.1.0 => 6.1}/procfs.d     | 0
 dlibs/x86_64/{6.1.0 => 6.1}/regs.d       | 0
 dlibs/x86_64/{6.1.0 => 6.1}/sched.d      | 0
 dlibs/x86_64/{6.1.0 => 6.1}/signal.d     | 0
 dlibs/x86_64/{6.1.0 => 6.1}/tcp.d        | 0
 dlibs/x86_64/{6.1.0 => 6.1}/udp.d        | 0
 dlibs/x86_64/{6.1.0 => 6.1}/unistd.d     | 0
 dlibs/x86_64/{6.10.0 => 6.10}/errno.d    | 0
 dlibs/x86_64/{6.10.0 => 6.10}/io.d       | 0
 dlibs/x86_64/{6.10.0 => 6.10}/ip.d       | 0
 dlibs/x86_64/{6.10.0 => 6.10}/lockstat.d | 0
 dlibs/x86_64/{6.10.0 => 6.10}/net.d      | 0
 dlibs/x86_64/{6.10.0 => 6.10}/pcap.d     | 0
 dlibs/x86_64/{6.10.0 => 6.10}/procfs.d   | 0
 dlibs/x86_64/{6.10.0 => 6.10}/regs.d     | 0
 dlibs/x86_64/{6.10.0 => 6.10}/sched.d    | 0
 dlibs/x86_64/{6.10.0 => 6.10}/signal.d   | 0
 dlibs/x86_64/{6.10.0 => 6.10}/tcp.d      | 0
 dlibs/x86_64/{6.10.0 => 6.10}/udp.d      | 0
 dlibs/x86_64/{6.10.0 => 6.10}/unistd.d   | 0
 104 files changed, 0 insertions(+), 0 deletions(-)
 rename dlibs/x86_64/{5.11.0 => 5.11}/errno.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/io.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/ip.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/lockstat.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/net.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/pcap.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/procfs.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/regs.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/sched.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/signal.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/tcp.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/udp.d (100%)
 rename dlibs/x86_64/{5.11.0 => 5.11}/unistd.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/errno.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/io.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/ip.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/lockstat.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/net.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/pcap.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/procfs.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/regs.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/sched.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/signal.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/tcp.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/udp.d (100%)
 rename dlibs/x86_64/{5.12.0 => 5.12}/unistd.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/errno.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/io.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/ip.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/lockstat.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/net.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/pcap.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/procfs.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/regs.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/sched.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/signal.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/tcp.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/udp.d (100%)
 rename dlibs/x86_64/{5.14.0 => 5.14}/unistd.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/errno.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/io.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/ip.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/lockstat.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/net.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/pcap.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/procfs.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/regs.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/sched.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/signal.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/tcp.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/udp.d (100%)
 rename dlibs/x86_64/{5.16.0 => 5.16}/unistd.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/errno.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/io.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/ip.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/lockstat.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/net.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/pcap.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/procfs.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/regs.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/sched.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/signal.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/tcp.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/udp.d (100%)
 rename dlibs/x86_64/{5.2.0 => 5.2}/unistd.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/errno.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/io.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/ip.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/lockstat.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/net.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/pcap.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/procfs.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/regs.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/sched.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/signal.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/tcp.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/udp.d (100%)
 rename dlibs/x86_64/{5.6.0 => 5.6}/unistd.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/errno.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/io.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/ip.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/lockstat.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/net.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/pcap.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/procfs.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/regs.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/sched.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/signal.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/tcp.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/udp.d (100%)
 rename dlibs/x86_64/{6.1.0 => 6.1}/unistd.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/errno.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/io.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/ip.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/lockstat.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/net.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/pcap.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/procfs.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/regs.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/sched.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/signal.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/tcp.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/udp.d (100%)
 rename dlibs/x86_64/{6.10.0 => 6.10}/unistd.d (100%)

diff --git a/dlibs/x86_64/5.11.0/errno.d b/dlibs/x86_64/5.11/errno.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/errno.d
rename to dlibs/x86_64/5.11/errno.d
diff --git a/dlibs/x86_64/5.11.0/io.d b/dlibs/x86_64/5.11/io.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/io.d
rename to dlibs/x86_64/5.11/io.d
diff --git a/dlibs/x86_64/5.11.0/ip.d b/dlibs/x86_64/5.11/ip.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/ip.d
rename to dlibs/x86_64/5.11/ip.d
diff --git a/dlibs/x86_64/5.11.0/lockstat.d b/dlibs/x86_64/5.11/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/lockstat.d
rename to dlibs/x86_64/5.11/lockstat.d
diff --git a/dlibs/x86_64/5.11.0/net.d b/dlibs/x86_64/5.11/net.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/net.d
rename to dlibs/x86_64/5.11/net.d
diff --git a/dlibs/x86_64/5.11.0/pcap.d b/dlibs/x86_64/5.11/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/pcap.d
rename to dlibs/x86_64/5.11/pcap.d
diff --git a/dlibs/x86_64/5.11.0/procfs.d b/dlibs/x86_64/5.11/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/procfs.d
rename to dlibs/x86_64/5.11/procfs.d
diff --git a/dlibs/x86_64/5.11.0/regs.d b/dlibs/x86_64/5.11/regs.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/regs.d
rename to dlibs/x86_64/5.11/regs.d
diff --git a/dlibs/x86_64/5.11.0/sched.d b/dlibs/x86_64/5.11/sched.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/sched.d
rename to dlibs/x86_64/5.11/sched.d
diff --git a/dlibs/x86_64/5.11.0/signal.d b/dlibs/x86_64/5.11/signal.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/signal.d
rename to dlibs/x86_64/5.11/signal.d
diff --git a/dlibs/x86_64/5.11.0/tcp.d b/dlibs/x86_64/5.11/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/tcp.d
rename to dlibs/x86_64/5.11/tcp.d
diff --git a/dlibs/x86_64/5.11.0/udp.d b/dlibs/x86_64/5.11/udp.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/udp.d
rename to dlibs/x86_64/5.11/udp.d
diff --git a/dlibs/x86_64/5.11.0/unistd.d b/dlibs/x86_64/5.11/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.11.0/unistd.d
rename to dlibs/x86_64/5.11/unistd.d
diff --git a/dlibs/x86_64/5.12.0/errno.d b/dlibs/x86_64/5.12/errno.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/errno.d
rename to dlibs/x86_64/5.12/errno.d
diff --git a/dlibs/x86_64/5.12.0/io.d b/dlibs/x86_64/5.12/io.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/io.d
rename to dlibs/x86_64/5.12/io.d
diff --git a/dlibs/x86_64/5.12.0/ip.d b/dlibs/x86_64/5.12/ip.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/ip.d
rename to dlibs/x86_64/5.12/ip.d
diff --git a/dlibs/x86_64/5.12.0/lockstat.d b/dlibs/x86_64/5.12/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/lockstat.d
rename to dlibs/x86_64/5.12/lockstat.d
diff --git a/dlibs/x86_64/5.12.0/net.d b/dlibs/x86_64/5.12/net.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/net.d
rename to dlibs/x86_64/5.12/net.d
diff --git a/dlibs/x86_64/5.12.0/pcap.d b/dlibs/x86_64/5.12/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/pcap.d
rename to dlibs/x86_64/5.12/pcap.d
diff --git a/dlibs/x86_64/5.12.0/procfs.d b/dlibs/x86_64/5.12/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/procfs.d
rename to dlibs/x86_64/5.12/procfs.d
diff --git a/dlibs/x86_64/5.12.0/regs.d b/dlibs/x86_64/5.12/regs.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/regs.d
rename to dlibs/x86_64/5.12/regs.d
diff --git a/dlibs/x86_64/5.12.0/sched.d b/dlibs/x86_64/5.12/sched.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/sched.d
rename to dlibs/x86_64/5.12/sched.d
diff --git a/dlibs/x86_64/5.12.0/signal.d b/dlibs/x86_64/5.12/signal.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/signal.d
rename to dlibs/x86_64/5.12/signal.d
diff --git a/dlibs/x86_64/5.12.0/tcp.d b/dlibs/x86_64/5.12/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/tcp.d
rename to dlibs/x86_64/5.12/tcp.d
diff --git a/dlibs/x86_64/5.12.0/udp.d b/dlibs/x86_64/5.12/udp.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/udp.d
rename to dlibs/x86_64/5.12/udp.d
diff --git a/dlibs/x86_64/5.12.0/unistd.d b/dlibs/x86_64/5.12/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.12.0/unistd.d
rename to dlibs/x86_64/5.12/unistd.d
diff --git a/dlibs/x86_64/5.14.0/errno.d b/dlibs/x86_64/5.14/errno.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/errno.d
rename to dlibs/x86_64/5.14/errno.d
diff --git a/dlibs/x86_64/5.14.0/io.d b/dlibs/x86_64/5.14/io.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/io.d
rename to dlibs/x86_64/5.14/io.d
diff --git a/dlibs/x86_64/5.14.0/ip.d b/dlibs/x86_64/5.14/ip.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/ip.d
rename to dlibs/x86_64/5.14/ip.d
diff --git a/dlibs/x86_64/5.14.0/lockstat.d b/dlibs/x86_64/5.14/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/lockstat.d
rename to dlibs/x86_64/5.14/lockstat.d
diff --git a/dlibs/x86_64/5.14.0/net.d b/dlibs/x86_64/5.14/net.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/net.d
rename to dlibs/x86_64/5.14/net.d
diff --git a/dlibs/x86_64/5.14.0/pcap.d b/dlibs/x86_64/5.14/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/pcap.d
rename to dlibs/x86_64/5.14/pcap.d
diff --git a/dlibs/x86_64/5.14.0/procfs.d b/dlibs/x86_64/5.14/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/procfs.d
rename to dlibs/x86_64/5.14/procfs.d
diff --git a/dlibs/x86_64/5.14.0/regs.d b/dlibs/x86_64/5.14/regs.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/regs.d
rename to dlibs/x86_64/5.14/regs.d
diff --git a/dlibs/x86_64/5.14.0/sched.d b/dlibs/x86_64/5.14/sched.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/sched.d
rename to dlibs/x86_64/5.14/sched.d
diff --git a/dlibs/x86_64/5.14.0/signal.d b/dlibs/x86_64/5.14/signal.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/signal.d
rename to dlibs/x86_64/5.14/signal.d
diff --git a/dlibs/x86_64/5.14.0/tcp.d b/dlibs/x86_64/5.14/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/tcp.d
rename to dlibs/x86_64/5.14/tcp.d
diff --git a/dlibs/x86_64/5.14.0/udp.d b/dlibs/x86_64/5.14/udp.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/udp.d
rename to dlibs/x86_64/5.14/udp.d
diff --git a/dlibs/x86_64/5.14.0/unistd.d b/dlibs/x86_64/5.14/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.14.0/unistd.d
rename to dlibs/x86_64/5.14/unistd.d
diff --git a/dlibs/x86_64/5.16.0/errno.d b/dlibs/x86_64/5.16/errno.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/errno.d
rename to dlibs/x86_64/5.16/errno.d
diff --git a/dlibs/x86_64/5.16.0/io.d b/dlibs/x86_64/5.16/io.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/io.d
rename to dlibs/x86_64/5.16/io.d
diff --git a/dlibs/x86_64/5.16.0/ip.d b/dlibs/x86_64/5.16/ip.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/ip.d
rename to dlibs/x86_64/5.16/ip.d
diff --git a/dlibs/x86_64/5.16.0/lockstat.d b/dlibs/x86_64/5.16/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/lockstat.d
rename to dlibs/x86_64/5.16/lockstat.d
diff --git a/dlibs/x86_64/5.16.0/net.d b/dlibs/x86_64/5.16/net.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/net.d
rename to dlibs/x86_64/5.16/net.d
diff --git a/dlibs/x86_64/5.16.0/pcap.d b/dlibs/x86_64/5.16/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/pcap.d
rename to dlibs/x86_64/5.16/pcap.d
diff --git a/dlibs/x86_64/5.16.0/procfs.d b/dlibs/x86_64/5.16/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/procfs.d
rename to dlibs/x86_64/5.16/procfs.d
diff --git a/dlibs/x86_64/5.16.0/regs.d b/dlibs/x86_64/5.16/regs.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/regs.d
rename to dlibs/x86_64/5.16/regs.d
diff --git a/dlibs/x86_64/5.16.0/sched.d b/dlibs/x86_64/5.16/sched.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/sched.d
rename to dlibs/x86_64/5.16/sched.d
diff --git a/dlibs/x86_64/5.16.0/signal.d b/dlibs/x86_64/5.16/signal.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/signal.d
rename to dlibs/x86_64/5.16/signal.d
diff --git a/dlibs/x86_64/5.16.0/tcp.d b/dlibs/x86_64/5.16/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/tcp.d
rename to dlibs/x86_64/5.16/tcp.d
diff --git a/dlibs/x86_64/5.16.0/udp.d b/dlibs/x86_64/5.16/udp.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/udp.d
rename to dlibs/x86_64/5.16/udp.d
diff --git a/dlibs/x86_64/5.16.0/unistd.d b/dlibs/x86_64/5.16/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.16.0/unistd.d
rename to dlibs/x86_64/5.16/unistd.d
diff --git a/dlibs/x86_64/5.2.0/errno.d b/dlibs/x86_64/5.2/errno.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/errno.d
rename to dlibs/x86_64/5.2/errno.d
diff --git a/dlibs/x86_64/5.2.0/io.d b/dlibs/x86_64/5.2/io.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/io.d
rename to dlibs/x86_64/5.2/io.d
diff --git a/dlibs/x86_64/5.2.0/ip.d b/dlibs/x86_64/5.2/ip.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/ip.d
rename to dlibs/x86_64/5.2/ip.d
diff --git a/dlibs/x86_64/5.2.0/lockstat.d b/dlibs/x86_64/5.2/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/lockstat.d
rename to dlibs/x86_64/5.2/lockstat.d
diff --git a/dlibs/x86_64/5.2.0/net.d b/dlibs/x86_64/5.2/net.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/net.d
rename to dlibs/x86_64/5.2/net.d
diff --git a/dlibs/x86_64/5.2.0/pcap.d b/dlibs/x86_64/5.2/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/pcap.d
rename to dlibs/x86_64/5.2/pcap.d
diff --git a/dlibs/x86_64/5.2.0/procfs.d b/dlibs/x86_64/5.2/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/procfs.d
rename to dlibs/x86_64/5.2/procfs.d
diff --git a/dlibs/x86_64/5.2.0/regs.d b/dlibs/x86_64/5.2/regs.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/regs.d
rename to dlibs/x86_64/5.2/regs.d
diff --git a/dlibs/x86_64/5.2.0/sched.d b/dlibs/x86_64/5.2/sched.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/sched.d
rename to dlibs/x86_64/5.2/sched.d
diff --git a/dlibs/x86_64/5.2.0/signal.d b/dlibs/x86_64/5.2/signal.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/signal.d
rename to dlibs/x86_64/5.2/signal.d
diff --git a/dlibs/x86_64/5.2.0/tcp.d b/dlibs/x86_64/5.2/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/tcp.d
rename to dlibs/x86_64/5.2/tcp.d
diff --git a/dlibs/x86_64/5.2.0/udp.d b/dlibs/x86_64/5.2/udp.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/udp.d
rename to dlibs/x86_64/5.2/udp.d
diff --git a/dlibs/x86_64/5.2.0/unistd.d b/dlibs/x86_64/5.2/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.2.0/unistd.d
rename to dlibs/x86_64/5.2/unistd.d
diff --git a/dlibs/x86_64/5.6.0/errno.d b/dlibs/x86_64/5.6/errno.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/errno.d
rename to dlibs/x86_64/5.6/errno.d
diff --git a/dlibs/x86_64/5.6.0/io.d b/dlibs/x86_64/5.6/io.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/io.d
rename to dlibs/x86_64/5.6/io.d
diff --git a/dlibs/x86_64/5.6.0/ip.d b/dlibs/x86_64/5.6/ip.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/ip.d
rename to dlibs/x86_64/5.6/ip.d
diff --git a/dlibs/x86_64/5.6.0/lockstat.d b/dlibs/x86_64/5.6/lockstat.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/lockstat.d
rename to dlibs/x86_64/5.6/lockstat.d
diff --git a/dlibs/x86_64/5.6.0/net.d b/dlibs/x86_64/5.6/net.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/net.d
rename to dlibs/x86_64/5.6/net.d
diff --git a/dlibs/x86_64/5.6.0/pcap.d b/dlibs/x86_64/5.6/pcap.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/pcap.d
rename to dlibs/x86_64/5.6/pcap.d
diff --git a/dlibs/x86_64/5.6.0/procfs.d b/dlibs/x86_64/5.6/procfs.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/procfs.d
rename to dlibs/x86_64/5.6/procfs.d
diff --git a/dlibs/x86_64/5.6.0/regs.d b/dlibs/x86_64/5.6/regs.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/regs.d
rename to dlibs/x86_64/5.6/regs.d
diff --git a/dlibs/x86_64/5.6.0/sched.d b/dlibs/x86_64/5.6/sched.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/sched.d
rename to dlibs/x86_64/5.6/sched.d
diff --git a/dlibs/x86_64/5.6.0/signal.d b/dlibs/x86_64/5.6/signal.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/signal.d
rename to dlibs/x86_64/5.6/signal.d
diff --git a/dlibs/x86_64/5.6.0/tcp.d b/dlibs/x86_64/5.6/tcp.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/tcp.d
rename to dlibs/x86_64/5.6/tcp.d
diff --git a/dlibs/x86_64/5.6.0/udp.d b/dlibs/x86_64/5.6/udp.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/udp.d
rename to dlibs/x86_64/5.6/udp.d
diff --git a/dlibs/x86_64/5.6.0/unistd.d b/dlibs/x86_64/5.6/unistd.d
similarity index 100%
rename from dlibs/x86_64/5.6.0/unistd.d
rename to dlibs/x86_64/5.6/unistd.d
diff --git a/dlibs/x86_64/6.1.0/errno.d b/dlibs/x86_64/6.1/errno.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/errno.d
rename to dlibs/x86_64/6.1/errno.d
diff --git a/dlibs/x86_64/6.1.0/io.d b/dlibs/x86_64/6.1/io.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/io.d
rename to dlibs/x86_64/6.1/io.d
diff --git a/dlibs/x86_64/6.1.0/ip.d b/dlibs/x86_64/6.1/ip.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/ip.d
rename to dlibs/x86_64/6.1/ip.d
diff --git a/dlibs/x86_64/6.1.0/lockstat.d b/dlibs/x86_64/6.1/lockstat.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/lockstat.d
rename to dlibs/x86_64/6.1/lockstat.d
diff --git a/dlibs/x86_64/6.1.0/net.d b/dlibs/x86_64/6.1/net.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/net.d
rename to dlibs/x86_64/6.1/net.d
diff --git a/dlibs/x86_64/6.1.0/pcap.d b/dlibs/x86_64/6.1/pcap.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/pcap.d
rename to dlibs/x86_64/6.1/pcap.d
diff --git a/dlibs/x86_64/6.1.0/procfs.d b/dlibs/x86_64/6.1/procfs.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/procfs.d
rename to dlibs/x86_64/6.1/procfs.d
diff --git a/dlibs/x86_64/6.1.0/regs.d b/dlibs/x86_64/6.1/regs.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/regs.d
rename to dlibs/x86_64/6.1/regs.d
diff --git a/dlibs/x86_64/6.1.0/sched.d b/dlibs/x86_64/6.1/sched.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/sched.d
rename to dlibs/x86_64/6.1/sched.d
diff --git a/dlibs/x86_64/6.1.0/signal.d b/dlibs/x86_64/6.1/signal.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/signal.d
rename to dlibs/x86_64/6.1/signal.d
diff --git a/dlibs/x86_64/6.1.0/tcp.d b/dlibs/x86_64/6.1/tcp.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/tcp.d
rename to dlibs/x86_64/6.1/tcp.d
diff --git a/dlibs/x86_64/6.1.0/udp.d b/dlibs/x86_64/6.1/udp.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/udp.d
rename to dlibs/x86_64/6.1/udp.d
diff --git a/dlibs/x86_64/6.1.0/unistd.d b/dlibs/x86_64/6.1/unistd.d
similarity index 100%
rename from dlibs/x86_64/6.1.0/unistd.d
rename to dlibs/x86_64/6.1/unistd.d
diff --git a/dlibs/x86_64/6.10.0/errno.d b/dlibs/x86_64/6.10/errno.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/errno.d
rename to dlibs/x86_64/6.10/errno.d
diff --git a/dlibs/x86_64/6.10.0/io.d b/dlibs/x86_64/6.10/io.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/io.d
rename to dlibs/x86_64/6.10/io.d
diff --git a/dlibs/x86_64/6.10.0/ip.d b/dlibs/x86_64/6.10/ip.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/ip.d
rename to dlibs/x86_64/6.10/ip.d
diff --git a/dlibs/x86_64/6.10.0/lockstat.d b/dlibs/x86_64/6.10/lockstat.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/lockstat.d
rename to dlibs/x86_64/6.10/lockstat.d
diff --git a/dlibs/x86_64/6.10.0/net.d b/dlibs/x86_64/6.10/net.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/net.d
rename to dlibs/x86_64/6.10/net.d
diff --git a/dlibs/x86_64/6.10.0/pcap.d b/dlibs/x86_64/6.10/pcap.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/pcap.d
rename to dlibs/x86_64/6.10/pcap.d
diff --git a/dlibs/x86_64/6.10.0/procfs.d b/dlibs/x86_64/6.10/procfs.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/procfs.d
rename to dlibs/x86_64/6.10/procfs.d
diff --git a/dlibs/x86_64/6.10.0/regs.d b/dlibs/x86_64/6.10/regs.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/regs.d
rename to dlibs/x86_64/6.10/regs.d
diff --git a/dlibs/x86_64/6.10.0/sched.d b/dlibs/x86_64/6.10/sched.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/sched.d
rename to dlibs/x86_64/6.10/sched.d
diff --git a/dlibs/x86_64/6.10.0/signal.d b/dlibs/x86_64/6.10/signal.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/signal.d
rename to dlibs/x86_64/6.10/signal.d
diff --git a/dlibs/x86_64/6.10.0/tcp.d b/dlibs/x86_64/6.10/tcp.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/tcp.d
rename to dlibs/x86_64/6.10/tcp.d
diff --git a/dlibs/x86_64/6.10.0/udp.d b/dlibs/x86_64/6.10/udp.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/udp.d
rename to dlibs/x86_64/6.10/udp.d
diff --git a/dlibs/x86_64/6.10.0/unistd.d b/dlibs/x86_64/6.10/unistd.d
similarity index 100%
rename from dlibs/x86_64/6.10.0/unistd.d
rename to dlibs/x86_64/6.10/unistd.d
-- 
2.42.0

