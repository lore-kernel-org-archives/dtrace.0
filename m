Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F941F3FE3
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 22:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744670470; cv=fail; b=RBvkZD5mfrDa6nrF3ZmthG3ExzmmpJCuyuCFLPI/Vm8RS6j3Ob5MAn4Jca+YLerEEVS/UT70hqOK+HPokoWP4ibem/a9tdWYzXHIGFCyQPoVQN43uKuCdMgWLSzwpjFtEYxS+/rUYAj+kA5UjuFiVk9X5sxJsf8bThKim4/h74M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744670470; c=relaxed/simple;
	bh=jYdMwFksrHhQHWm45EvzclKTHF3BYPXRbKGFFDtUQa8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ynner7ZrA8QBQvNjPXtLwTIrYruJpmy24Boj7Qe4rfpsS4yAfeNbrpCKlC9pyxtApQDzyvBzuFRlk8qIWQ2TaBSnz5r+AjT+gh/dHZmjdT2OW+Jqx9jh9vUlbW15TBL6bBNwMLpvZt21WtNJfrC2pXZ4ytRyvu3kP39Zv0f8RNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ks4s6Gck; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FwEJN3eI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ks4s6Gck";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FwEJN3eI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELBp62013062
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 22:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=ui9iiiXrikOxWcws5usDHzN/FwuXZUqEyhkpXbgMNMY=; b=
	ks4s6GckEo2eHYEnilm3+DHpJ0GkjBIHi9sWt/Fr7Fw/INH43PcANhhrYDnTxWvd
	NZUQ0L3F1lHL59ir673y2lYLO2g5LqduTHyS9OVGOUwcO/nyY0rZaFc/dOsPSHM8
	ktKpfjaxl8H4iCILwpC8UjCiQPE0notz59UZZvetnfo0dx9C1BBdqv2mwAtDYSZS
	2CCVAhZRFzVF+mKAfXFWMSMd/4SoGNrjsW6yVDiGJqrKVGuj9cmnw9JTiVmNH4jo
	u3f3lr4BsiUnIY/ss2FgNPfd+xLNLqEr+wK6qezadcTPXq+qfMBwOfpG4BYDcfkC
	ZgVeKqI7HUBYwbjDSR4R6w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf0jw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 22:41:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ELe1Kg008534
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 22:41:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2p5a3f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 22:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQ+7oBSbTFldsmt+McJlqMJLvLm89UJJ8ML3jUk0NbCAoLRv3W2MAOzvTUl/QjPUFmBv3LFZpQNJrrzm5a0UFXr3Pu5dyB62qz+ArAiY4vaGBxEoYS1qEbG8zceORyp5xEB79iApHeQVIADI0FUH6TMpbsL79hML6s6Z8pzfK0r5gx7mA3/7jPBlkGwC0qdshcHTXo0sJuqBvyLwSrFEwHrGSSjVeCrvJ9D+Sd82wDSeCRkGN+YdzF+fGjUSmCspPAoH2pS91TwPbNyt3bMJ9xm04QcZbJ1znRxPYNkInJIEKbEofMKdct7PDmHBrJFmHxugal568ahvpJH2Zp24Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui9iiiXrikOxWcws5usDHzN/FwuXZUqEyhkpXbgMNMY=;
 b=vwnSsDOUusJr1enAqFZ+oQMAubwW/HXmmFCuIRJBkPh/bwxFCA4RB31RlSHql4KKs/xNv8qdxxDqcF0VmpGhIq25gU9v08G8BZuyw+1jN81bZXMhw7jDIileRmA/z5IB2cl/LehjH8HaOZZPH/d8oHLiq/bqhrmg6X7ca8mckVRyh5qYYUMlXUFvw4IvxiUXYoOdlEVgDB+U5L8GQBfHZ7mk6m4sepS8rBAzPbU98bAdwqi8INTUucQposvT3P6NkaO+uVRz6uuChTNEOxFM19yiRYrKDQT6exeADfFZlX3UQpmYNFwsLrf1ToSUQ7kKFjSj6T7VzzOsh590HOGiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui9iiiXrikOxWcws5usDHzN/FwuXZUqEyhkpXbgMNMY=;
 b=FwEJN3eIgQ0zjGNQmiXUakNkCFLMTjhjbtpcKMcfg419zP+2x6GjIeuEgr+FxboK2uNTnT5kWql0Op1YvKYvEJVrMxnA6GfWCKLPovaQlGl2GKTY+sL+LEEt0sNB3938AguThl9XictFc3r86CkbsA7sxI2gNRBVcN7D8Espdjo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6475.namprd10.prod.outlook.com (2603:10b6:806:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 22:41:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Mon, 14 Apr 2025
 22:41:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Test fds[] member fi_fs
Date: Mon, 14 Apr 2025 18:40:57 -0400
Message-Id: <20250414224057.3287-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 237e2962-2f0d-421f-c124-08dd7ba56ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3zZ8elOK7faqGhIL5c1QVknpffwhRfuGJmXV7WjANtdBNQy1FDZFxI7ZdIMa?=
 =?us-ascii?Q?4jHlnNPfrn0damCxiVzyDmAXzrNWk8N+pDCkg9OdPwL4ZkgY1pCfAzWwRLlm?=
 =?us-ascii?Q?FyRmPTdLk2Nt1lB92hkIrDikcIJPwDOujLKK8DPQWTZYqfYlEQsMi/N0MU4E?=
 =?us-ascii?Q?ESo8VgweXpayoobclSyOezhan9ToPfpPQXOFVhOVyKtTR4t62oaCcIzY1SsF?=
 =?us-ascii?Q?FpRHa/7jmxnS1n4uzqA819j4MkDHxXfp3vvg0HRG6jaGaDBesNfTMTFHYDr0?=
 =?us-ascii?Q?5dOhuLnSzRe1Dz2TXUcnHjtHXbPM+qnR5E8JMqcn4g+8AwjgS3Pnifyauh2l?=
 =?us-ascii?Q?FPZ+QEbpDbx2okN84rsqGQfx7hdDBk+VMU4yTCKgAEcYCtNG/UmKYUsj9lq+?=
 =?us-ascii?Q?XaZ0OnnouAT3sCClu/C6RhPirkKBMZaL11Ns+Gj5PN2CC1E3lUFM/lQBwchh?=
 =?us-ascii?Q?xumvMg2bQ8K/bPvZeeEpZmjxCVI+TG6yTX5TwoMs5d0aeunQRLYQJKckEeqJ?=
 =?us-ascii?Q?lqt6vft4JBqYmvr3r3D7/RHu1vQI0JifGaeCuCTytPM0aoccUnkgIJDtQVA8?=
 =?us-ascii?Q?fgbcLlJS9VkRL+BveADrK3ANvLTn4IKZ1fLydEEoZHrG4CeVb42Ei5q9Ka9U?=
 =?us-ascii?Q?cb1tk34pgwS+ux8HIz3DUY06o3UlYh54E4A4h+abhXNDUJfBOdDWkgC2YWV8?=
 =?us-ascii?Q?Anzi+9QeBx2umYXTPtGRQncK3GPpXj9cckSOwPPK2Zm+8huVoeX8J4o4gtYy?=
 =?us-ascii?Q?CchMquWCE2ryxwnKssabNkv46wI0g29B9tb5Emq6bAGQSb530yp4u00G35xr?=
 =?us-ascii?Q?oakckZycox1uh0o+Le3tuGGN+y3tNhG8p6xVn4mibYxl3umBD8gN2IJSyE3M?=
 =?us-ascii?Q?LwGE5JFotL7CmJ89ImTAI4Jz36bTC12GLba9W2950XerkA9YKeGSkSGHAOSJ?=
 =?us-ascii?Q?HaP3IQiNIzk4BAjjLVCX0tAJ+gQJETS7wton0NDQXoFXQ4atsR/3mJ8cqras?=
 =?us-ascii?Q?f1CbA26tCZVFFlQdfwz880Ksw1Q5jaD4FQjAQ1pIgSG9X0+LXw0wocF3aQ/F?=
 =?us-ascii?Q?td70Y1DLwAvZcie/P0vP+vyHbG/nPw2MHzr1kXSZm5dv5eKI/2n/4YATLxG1?=
 =?us-ascii?Q?H2a4R2+IgYvnMpzkmaRBijKRmCD/4TRPUCD5Ua33PTz02C5b5uElF94RZIRE?=
 =?us-ascii?Q?1mfQOxZSjM8WBRFrHkmbdnAGa2qLwCkXoSlqo6EwEgjKlG4afjvKP2VtEQ4N?=
 =?us-ascii?Q?ylKCIicxvKhDfJ9JtXzDcExYMuoYg5o5cuyJ0HvV4hdMSWJlqBEr0BH7NHF3?=
 =?us-ascii?Q?6Y+S2qzQwqKfUPSBI91CR0vj3NDKWTNy/uQh5MG8wMh377w2AKQNfRNECwW/?=
 =?us-ascii?Q?QXHpNo3cYAF2XrsAJJrL9jXQQ2rLekyhzKr9sDhbNg1ftgHxRT0XRgkhjc6C?=
 =?us-ascii?Q?IxbSXn6DWFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6n+6mO30nrFB3Zu0UnzLQsZFGmnEurU4J9oTIT2ptVXw69tyCOynkacZA2HV?=
 =?us-ascii?Q?bSrw8dMSRiolNK9jhEOwzBtGTRiK3V63ccSJU+h2D25YuQ6Dm23mwm8f9M0Q?=
 =?us-ascii?Q?IO7g/D/v5C4qBK5a9nOwW/tb5gJnJ2E7TQD8IK8LU4CgOz9Xz0LEnNJi0sD8?=
 =?us-ascii?Q?+MEJqr5FBdO5UaCEo4mX71IOzR+gvsa0Z18jf/SY1lQXBdP2pNXkftETWPW6?=
 =?us-ascii?Q?dWyBywhJlQlU13+5CtE7Xgb35f8JobRjlvmYXJctG27nezAp5OtOj7II0zly?=
 =?us-ascii?Q?HNFXU/hRuPOcSDyKxth874F4gk0E0ogrEnFR3vnW1j4Xqu0f4+L9MTIi7AWq?=
 =?us-ascii?Q?gA+BrgBWZUr8+SktyjtPbNbf2xWlIS2GsKE7TZ5+bAxAdFeBC6j/WU5t98Rg?=
 =?us-ascii?Q?kFeCCDyCKru+aeJMe3X9zoPpy18B88/GauEqH12WbQcahkv2vBgpTEq7FSO8?=
 =?us-ascii?Q?GnrYrL6WNmUpN2+pa/WINwLPoUF/xUkeDXk/7MMwSXkdqLbvGWpdwHdIFC8b?=
 =?us-ascii?Q?prPD71uTfbOzTuGjuV9YdYKNOde2OoFJwSRpm0yT1eNZ2eWhrDOpft5jT6HL?=
 =?us-ascii?Q?nzJpL7JVWbJho5V0b606h/qSLQjtSi3ggWoetvVc9rOM3M9igS/pLxAQXwFM?=
 =?us-ascii?Q?wyc9Q8Mn140cl+CK2upPn43IA0xVi/CiO8z3RrgdoUWCXucph48W9DF2uqzM?=
 =?us-ascii?Q?wghMYJrz6ce1T5bCiwo+zkEPMELB2eyGEAfcENktZzu+6kuASdNTLDlXHcir?=
 =?us-ascii?Q?S4FmDdXRtA74zuNqNzXnWoJ1+O2AixvLMbtQQk6g412xexBGAgkf0S3XK4JJ?=
 =?us-ascii?Q?nPp1/Qr9gBsZIC8N7TWhhtqZphL/G5pmDmEya1D4lR/Waf0h3BBPYoNkOV9C?=
 =?us-ascii?Q?TyQCOHCxd2fdY7j3VYJEqM1g+bHnuJZiHhHaB74a+RT4PCycPbuQnfz8bEQV?=
 =?us-ascii?Q?x3/bSYOuf8qEKQ/gNJY/q08lrNHFEsLWNhTXxrGucKCrWinW0/ER3ptgphTt?=
 =?us-ascii?Q?7UAnpNe4LV+me0Pm4rzgDt1e2T+rrGfh9VQNwO4B4GHfdtgAU0sZYTrfitYC?=
 =?us-ascii?Q?8uTJzOTY6MwhQyWNKL92JKvI+jBqYa11SI7E1C4oOp8hdIQqJkZF+avJihLD?=
 =?us-ascii?Q?g41vgnLGWe/2s8EoDlBJcCaidvBhzEzcMLYmdJeZszB2tb2Ghxg7QX0E2r4M?=
 =?us-ascii?Q?so1lZnn3ReBTC78a6ZuZQO3xxL2AqhgFj4tk/HCZ2OxpQ2cYaUyFuRNo04h5?=
 =?us-ascii?Q?Qsm+5CY4IKp/35TcN/yobvIAugpdni910oOz8EOg4YwB/AKr9IQHdyq2JB7i?=
 =?us-ascii?Q?ZHb/anRRJjrXDw4NyGVmmekBpxwrTOW2PZZBZsmT0ARVslVtLR/NCNJim2W2?=
 =?us-ascii?Q?EUfLHsoBwF2loRtvxWeQ4iADnylj/gXxwYBkTZnVI3HwDSXzFqxTVMncSIwN?=
 =?us-ascii?Q?TirCJyyJzJDu5aUZ0529Mx/9Fug5vVm2o2l0tHa73OBH+A9xosi2LMVTQ7BY?=
 =?us-ascii?Q?oCryV631d2SjHw3ODGoGh8CpeoAppQsEY5pKyO5KPr/6KxsahQ07whSYH+0G?=
 =?us-ascii?Q?7jyz67uPqZNxSACfKzM2Hjrgy0vc75fcyt6ViEz+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZdbZ4SAPe6lbrH6d+S3xAZasIOuXZnYIAGFCTHGv8RoF9IxI8ABL7KMmPPvKF+1azTRj6t0LZxewACHVAXEqbSSxNJ99qD7HW3hcILKO5zKq9Ebnuo034V9ktYyU5RC7OASLurSkuwrrBOBEIGDM83Bdl2Ct5IDqs6ErhJBl3nYR9iyxdcOibMfft5JnSJqeVYPAFyyCFOtDCMv3VXHq1rYdWEXU+guY6NzKuDWEvl1Z+Pv6SllfyU3VrkzziRspT0ap1WjdayrbVbaEdVZAkfPbVQw/YH8itUE3PBPXuvkYWOK4b4i/BJRx8cuaU7PMVgJ9ugUPNYSyy571MLBDaNClAXE4fzgu0lxMuyoRUnjmDv83AYpKndVyXfUzkqwyygcB3/aioXYhw1JuT+Rh0eiDFrelZSmjJ01lq6LnqNdPz9DM3S6nG32Pvs6Zxvj9v4UlxDNMZxgeo62It9hYlyQMR4MVMnSy5HLxHodQN0EYPyr4+5/H2p4r8BePvi9kitjV8IsNmCh/uQNItKZTvsMzyG/sqFjNIWGgrmr02S/HjuSerd6h3fC9FNIzqqnwKyNggbgINYbd8vV+DRDaOb7nHlfJV5AuW13l/gU2F/g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237e2962-2f0d-421f-c124-08dd7ba56ef4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:41:02.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VIA9TgFCcQFjy2TtdC9YWLLvjtBBrWzk0K8OxAX5Hv0rbkD0qGA+vR43FCdsksLj4WFz3vaYEdChwqRGKSnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140163
X-Proofpoint-GUID: iUS1HqZb_x2GizsPX9AIlvhVumj7xWUe
X-Proofpoint-ORIG-GUID: iUS1HqZb_x2GizsPX9AIlvhVumj7xWUe

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/io/tst.fds.aarch64.r | 5 +++++
 test/unittest/io/tst.fds.d         | 1 +
 test/unittest/io/tst.fds.r         | 5 +++++
 test/unittest/io/tst.fds.sparc64.r | 5 +++++
 test/unittest/io/tst.fds.x86_64.r  | 5 +++++
 5 files changed, 21 insertions(+)

diff --git a/test/unittest/io/tst.fds.aarch64.r b/test/unittest/io/tst.fds.aarch64.r
index e1160e5df..762f122e2 100644
--- a/test/unittest/io/tst.fds.aarch64.r
+++ b/test/unittest/io/tst.fds.aarch64.r
@@ -1,29 +1,34 @@
 
 fds[0] fi_dirname = .
+fds[0] fi_fs = proc
 fds[0] fi_mount = <unknown>
 fds[0] fi_name = mem
 fds[0] fi_offset = 0
 fds[0] fi_oflags = 20000
 fds[0] fi_pathname = <unknown>
 fds[1] fi_dirname = .
+fds[1] fi_fs = proc
 fds[1] fi_mount = <unknown>
 fds[1] fi_name = mem
 fds[1] fi_offset = 0
 fds[1] fi_oflags = 20001
 fds[1] fi_pathname = <unknown>
 fds[2] fi_dirname = .
+fds[2] fi_fs = proc
 fds[2] fi_mount = <unknown>
 fds[2] fi_name = mem
 fds[2] fi_offset = 0
 fds[2] fi_oflags = 20002
 fds[2] fi_pathname = <unknown>
 fds[3] fi_dirname = .
+fds[3] fi_fs = proc
 fds[3] fi_mount = <unknown>
 fds[3] fi_name = mem
 fds[3] fi_offset = 0
 fds[3] fi_oflags = 121c02
 fds[3] fi_pathname = <unknown>
 fds[4] fi_dirname = .
+fds[4] fi_fs = proc
 fds[4] fi_mount = <unknown>
 fds[4] fi_name = mem
 fds[4] fi_offset = 123
diff --git a/test/unittest/io/tst.fds.d b/test/unittest/io/tst.fds.d
index 06caefe4d..2ae2a33b2 100644
--- a/test/unittest/io/tst.fds.d
+++ b/test/unittest/io/tst.fds.d
@@ -32,6 +32,7 @@ syscall::ioctl:entry
 	printf("fds[%d] fi_name = %s\n", arg0, fds[arg0].fi_name);
 	printf("fds[%d] fi_dirname = %s\n", arg0, fds[arg0].fi_dirname);
 	printf("fds[%d] fi_pathname = %s\n", arg0, fds[arg0].fi_pathname);
+	printf("fds[%d] fi_fs = %s\n", arg0, fds[arg0].fi_fs);
 	printf("fds[%d] fi_mount = %s\n", arg0, fds[arg0].fi_mount);
 	printf("fds[%d] fi_offset = %d\n", arg0, fds[arg0].fi_offset);
 	printf("fds[%d] fi_oflags = %x\n", arg0, fds[arg0].fi_oflags);
diff --git a/test/unittest/io/tst.fds.r b/test/unittest/io/tst.fds.r
index d7c12b86a..b5fa2df95 100644
--- a/test/unittest/io/tst.fds.r
+++ b/test/unittest/io/tst.fds.r
@@ -1,29 +1,34 @@
 
 fds[0] fi_dirname = /proc/#
+fds[0] fi_fs = proc
 fds[0] fi_mount = <unknown>
 fds[0] fi_name = mem
 fds[0] fi_offset = 0
 fds[0] fi_oflags = Please customize for arch
 fds[0] fi_pathname = /proc/#/mem
 fds[1] fi_dirname = /proc/#
+fds[1] fi_fs = proc
 fds[1] fi_mount = <unknown>
 fds[1] fi_name = mem
 fds[1] fi_offset = 0
 fds[1] fi_oflags = Please customize for arch
 fds[1] fi_pathname = /proc/#/mem
 fds[2] fi_dirname = /proc/#
+fds[2] fi_fs = proc
 fds[2] fi_mount = <unknown>
 fds[2] fi_name = mem
 fds[2] fi_offset = 0
 fds[2] fi_oflags = Please customize for arch
 fds[2] fi_pathname = /proc/#/mem
 fds[3] fi_dirname = /proc/#
+fds[3] fi_fs = proc
 fds[3] fi_mount = <unknown>
 fds[3] fi_name = mem
 fds[3] fi_offset = 0
 fds[3] fi_oflags = Please customize for arch
 fds[3] fi_pathname = /proc/#/mem
 fds[4] fi_dirname = /proc/#
+fds[4] fi_fs = proc
 fds[4] fi_mount = <unknown>
 fds[4] fi_name = mem
 fds[4] fi_offset = 123
diff --git a/test/unittest/io/tst.fds.sparc64.r b/test/unittest/io/tst.fds.sparc64.r
index 71cc83095..89579e176 100644
--- a/test/unittest/io/tst.fds.sparc64.r
+++ b/test/unittest/io/tst.fds.sparc64.r
@@ -1,29 +1,34 @@
 
 fds[0] fi_dirname = .
+fds[0] fi_fs = proc
 fds[0] fi_mount = <unknown>
 fds[0] fi_name = mem
 fds[0] fi_offset = 0
 fds[0] fi_oflags = 40000
 fds[0] fi_pathname = <unknown>
 fds[1] fi_dirname = .
+fds[1] fi_fs = proc
 fds[1] fi_mount = <unknown>
 fds[1] fi_name = mem
 fds[1] fi_offset = 0
 fds[1] fi_oflags = 40001
 fds[1] fi_pathname = <unknown>
 fds[2] fi_dirname = .
+fds[2] fi_fs = proc
 fds[2] fi_mount = <unknown>
 fds[2] fi_name = mem
 fds[2] fi_offset = 0
 fds[2] fi_oflags = 40002
 fds[2] fi_pathname = <unknown>
 fds[3] fi_dirname = .
+fds[3] fi_fs = proc
 fds[3] fi_mount = <unknown>
 fds[3] fi_name = mem
 fds[3] fi_offset = 0
 fds[3] fi_oflags = 84600e
 fds[3] fi_pathname = <unknown>
 fds[4] fi_dirname = .
+fds[4] fi_fs = proc
 fds[4] fi_mount = <unknown>
 fds[4] fi_name = mem
 fds[4] fi_offset = 123
diff --git a/test/unittest/io/tst.fds.x86_64.r b/test/unittest/io/tst.fds.x86_64.r
index 799e85623..34172b2a2 100644
--- a/test/unittest/io/tst.fds.x86_64.r
+++ b/test/unittest/io/tst.fds.x86_64.r
@@ -1,29 +1,34 @@
 
 fds[0] fi_dirname = .
+fds[0] fi_fs = proc
 fds[0] fi_mount = <unknown>
 fds[0] fi_name = mem
 fds[0] fi_offset = 0
 fds[0] fi_oflags = 8000
 fds[0] fi_pathname = <unknown>
 fds[1] fi_dirname = .
+fds[1] fi_fs = proc
 fds[1] fi_mount = <unknown>
 fds[1] fi_name = mem
 fds[1] fi_offset = 0
 fds[1] fi_oflags = 8001
 fds[1] fi_pathname = <unknown>
 fds[2] fi_dirname = .
+fds[2] fi_fs = proc
 fds[2] fi_mount = <unknown>
 fds[2] fi_name = mem
 fds[2] fi_offset = 0
 fds[2] fi_oflags = 8002
 fds[2] fi_pathname = <unknown>
 fds[3] fi_dirname = .
+fds[3] fi_fs = proc
 fds[3] fi_mount = <unknown>
 fds[3] fi_name = mem
 fds[3] fi_offset = 0
 fds[3] fi_oflags = 109c02
 fds[3] fi_pathname = <unknown>
 fds[4] fi_dirname = .
+fds[4] fi_fs = proc
 fds[4] fi_mount = <unknown>
 fds[4] fi_name = mem
 fds[4] fi_offset = 123
-- 
2.43.5

