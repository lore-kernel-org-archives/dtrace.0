Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DB51CEAAA
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331883; cv=fail; b=YA6dga9FVhpkjV9ACTj7sCEPHgBhby/ngrUP3GJz16WR9miONsOz0JfpyPq/sEVRXphfqACph5lXwEDiqKdsCmSwLGZRw3mwsKzxU+12QohJmGdBiyxuWv/W81FNbNxsc1hDoupO4QN0mm0JhkZUYBC/7g+xEu+xHwmaRxG4KLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331883; c=relaxed/simple;
	bh=BpAu4+swd/PhCAFcAIwAf4SWqAzOSUIO6gszf7qZYzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F+MJj70xXAP+pPZsPMgn7IP3VmdlUe2Bg0wdvQi/gO5fpFQAkiT7ne8sCTByoCuOReKfB70d0tE2rU2TSC+RuSc6ZGVsrlYnr47Mr0t+sbLPxC1/XkLPsLevXpUhWn4D78P2N30zqkMN/yvCcesaakCHxCrUuPmq4zoDIF2Rceg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hX349UAX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hoYqiGIP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hX349UAX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hoYqiGIP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABbKx002134
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=BMgapRlHzThk3mT
	m1pknddb4tgz3HYi5IJ2KFZHhXl4=; b=hX349UAXDX1i4+ucXYOHJ6XG23Kyp/u
	HBv88lxTWmDO2TJlPyQqdRoSa49EVWIdnMuDtTb4hmT2EOx3OlrPc7/nNVFFjFKR
	uzjGMrgm5PdWxgeBSwkNx1PLrkO7CT1K5b6N64JJeeJdjwE5Lwd854XEAIvmQ5/a
	gd5KaqKjGhM3SLIDNQWOsYZTomsq29xwz1/SdootIqN9MUKezXrAbDcvH8vKGemC
	R847gKmBehIHfT4Eg3kbqNxy6w511LTDLUy5fX/pnCEJlmx26/LqAxJlPYUXSs/5
	81YW9gZdt2LVm55VdyqIY0Vyz0wQ5BQaGoTtCSNfMQ+pGNOzCUJtY7w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scrkqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:38:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EDr8Lh012271
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:37:50 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6mtew-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:37:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANIRRH6bU87phwVuhhQUrfqk66Qr8Nq/5K+FZp48SCD8gRZ4vnn2HJoWNz66WNeSGxvh+vrfuvwSl1KyI88AkMWu4fHJJInVP8aDCQ/juzO5Imvo3G9Q6i5AD2TRHTEgCYjCmBPLxnsnlpfVFJhl95Nj/4W4YBU8JYr0z0n2HH2NrmdcjQNFeQhWGqBOea0ggLH6Kuy/xaMq6WTLpFoUjvaKLY1Kt3Pz37TVbliroKeCy/rIVU22mrYfn0vji2rxZeXoLUCdZ0ipRGWAsegRV2O5Z4VudYupfd+Y0qDjEsfl2DTzO4lndcQAXamxhl/df7iCnmWupWcdMxd9ZFzEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMgapRlHzThk3mTm1pknddb4tgz3HYi5IJ2KFZHhXl4=;
 b=IpmeJnimYv1/8uxR56IsSjhh3+xGQBnVybBJjZAh6eUqlJJAXUJJN2UJHu0XCWFnmYMRvsgKOyk+cHkY0sXTWyV698Uo5KMHfnXpSjWSmmOdZlS310hnenQLkV0Jh2zDUS4sAnQEFCB//HE9haeR1xiVWqmFYXl6JmcdConKckwCuneOF1fUlq1K1pihlOjoaDnwp2VjYX5N4jLWfUWYQuAYGiJRXUXAsCfqgeUTiNmKFGqGxl58H2jPAI/xgF9UqT5XqkyJyYnvTc8WSjQ67I5BDM49L0hvZ1KiDLEex87iUwY6uu8ZNtUSUKG9wAl1Uvs2xR4YotV+OOXT2zoLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMgapRlHzThk3mTm1pknddb4tgz3HYi5IJ2KFZHhXl4=;
 b=hoYqiGIP1awOCnsdHK3oa8HwbZuW5H8Fkcq7eS4xvdITNYvMICN5LtGHFbuZbGw6BYPg3I26yt8hgmS5Vp5Od6Vo64VPcLL23OXqnuEfoXrlQ18TT1smShdVLwlC6a374d6ood+YcNQXkGA/PaOdUZD1xNqXP7+E/381ZPfqOlw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7527.namprd10.prod.outlook.com (2603:10b6:8:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Sat, 14 Sep
 2024 16:37:47 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 16:37:47 +0000
Date: Sat, 14 Sep 2024 12:37:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 12/22] Remove apparently redundant assignment
Message-ID: <ZuW72E9WTU36HIK8@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-12-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-12-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:208:160::41) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 229a69eb-6820-4192-9b5f-08dcd4db90c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+ERkA0E71it9dXAY2GrB85daw1qtqToQtgtEwvMQ3yuB6jbmEPe0SArRxmV?=
 =?us-ascii?Q?DUCgq5gIZFYgu2lei9dVv5oADwxXfu212kxVZLlDyvqHqvhJBhxhS+ASYqPr?=
 =?us-ascii?Q?caRBx1SQGSpnBQaZbE8EnbyU2SEo9UAQXZPDjK8w7UAXsd+Vcuq1QeEphIQP?=
 =?us-ascii?Q?ETL2iYKjifwmlEeT4Lt5vAxtLjDls/qS+6nA2kipL9Sl9O1wxg+d4J6h88xc?=
 =?us-ascii?Q?hCtcOLCIU9Hbap6JVLhAxe2mJ1oy7GZWXhie45adGmMjCCj4FCu/5FtL88lF?=
 =?us-ascii?Q?VOeJoIIZxOZlnJ1YvVwhk/LqP0gKnG+ZNTYfDSdJvmJCY3m+HjdrW7MNy+OR?=
 =?us-ascii?Q?FxpcjCHLWFPMEWjH9kZogVRi1kcqCbxQrNv7zHB5oxgaaHS8MFIR0GGDbOep?=
 =?us-ascii?Q?LgkzeVasglBxHlyizUyKocEDZwBNEoJ8sr15B4mw4mJyvSHmfJ2kZOLizYy8?=
 =?us-ascii?Q?NvUblP4bZVzRt5hsblJp9GjbQJjNAFQiTiMtmlGMWqvwYhqUpUrh+wc8dTYO?=
 =?us-ascii?Q?B8eG99NM/+qlAXmslPSr0rzDATh4pMpTIIGTc2678G8TnVGQBvEf+RW7Vh7K?=
 =?us-ascii?Q?GvbLb4WjJCM+YdJNdyQ05jtbnS5JM98EEThaDKsn2anP6RvX6swJdG+bxCi1?=
 =?us-ascii?Q?wqx7uUoQS/P8NnFaVix/ei3hvM+3JMwbodvE+7mzzW9nBQGPQE9RsAxNxT44?=
 =?us-ascii?Q?45qKN380LMuiHW2IB9eqKjI2zvrB52euN5jZKvO9xEjbM3ho+ChRWgdyHpzl?=
 =?us-ascii?Q?0Ds2ugV9lyc9fp7/cvikGsS/CCXNoodM0RBV8cBEgetTXsy+PmA3WgG6g+7t?=
 =?us-ascii?Q?P6xZKxKXT79B1fSkX0zp//PIxHM1zzgG7Vw3e2OyF6v0M5IMpmQsXLXReDkp?=
 =?us-ascii?Q?R3hro9rYh1awV3jPMm7Gr3KwwHkQv0UvewaAB4s8owb2AacI3FIJ0NwJ5Ofq?=
 =?us-ascii?Q?gBODuaBHxNJXOWvg8wKisaw4R/PYQXC6etQbT84jHlE1QtGrBk77o9dSKr7t?=
 =?us-ascii?Q?uZ6OzV3PYIFPeQCXEsp8J4jLSV7yNeEk3Tl5mkk6dVEhT79vK+afdSMHHuoO?=
 =?us-ascii?Q?tOIiR+7HuL3cYcbFq6X8mxSxLa2TYWwra5bhJ/P8RGMOwlYvy6cVjZpz6vt0?=
 =?us-ascii?Q?EKlaCvSx0zsfK5uwTbK3Hg19eSSnrAJQ3ZzRKlLGCTLXkdp4mEordGXix1ke?=
 =?us-ascii?Q?0uYD6gz8ghc9sRfA4xa4apAU1LWPhRye/eIPHU58Lg7iEz9qjWdLf2I3J2cb?=
 =?us-ascii?Q?ZegsicmIA/BIgAFo+ByeNXBAew/z2R/2fztGRPetCBLiD3mKJFf3a4irp8qf?=
 =?us-ascii?Q?iyqW1jtDo9w4KuvXVhuSFRoQHYyz2aF4++ON/UT1pCD/CQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qjNxlByhwjvHaEU9tNdITQRW8/LQmDtxM7z/MCqScwvotXSCS+HzkKyRAFoZ?=
 =?us-ascii?Q?Va7W34l59iuoEX0chDwKaml2DZJzDD1Lfthahq91xkw4zSEc+9XIht3Dg3/3?=
 =?us-ascii?Q?Q2eDLJxHC666kBAaU+bX/Gu7iFt4yEL9IybOvciFnbA6KLrF2TB20q/c5ptl?=
 =?us-ascii?Q?jh3TykoeD21H2AIhl59C84/3h7SjrX+g5tUmhRzuF+otdSVU+Zq2QLGLfFhc?=
 =?us-ascii?Q?Big5ZcyEV9wdQ9aChWX3bpkI702kxwW0z87guthc6GBpYXfodmwFPuc8iYU6?=
 =?us-ascii?Q?cOjBkLKZcN6FyBYFlPgoLpd2SEsmbjTu+HZx9wf57mHpmzWoKyJW6uRTR63X?=
 =?us-ascii?Q?C3rTTc7vZfOh00YCG/43w2NnVr9UEr2/DjPQbj8IBGhxrfnSLENtTMMn5dRs?=
 =?us-ascii?Q?9wYwqGEEYM4uQPcnKgIZZaSR7MYYMSSnTOiFfdhB5otIQNHE7t7AObUs8HVs?=
 =?us-ascii?Q?RiEfnLrFe6FSLGKrAZqWZzOgS6QsLVmXm6ZKzlY6lSPE+2cTDegSVcVu7Xgj?=
 =?us-ascii?Q?/61kst4zyIgsHUI6C4lTc7w1LriivG5cUJno1mr97Pihm+kK3lc5zqSL37QQ?=
 =?us-ascii?Q?m5DdhHfRp+6ZuYGrqGQ8g8AhOLrO4E1Mhqlk0kgaZnWuL+h4arP+//xMdvo5?=
 =?us-ascii?Q?K1ruWkC0AcVMcqdRvD8XgowMc50DhM1utxEhA/cKwwqFiyL4IgRgy2+3ZrWL?=
 =?us-ascii?Q?vXei/sVCar+FaPQpT/Ks44q4b8ZDsGRStFa0uFdUX3kMxgmJYtYscokL8qFD?=
 =?us-ascii?Q?AK+56WGYhxhFNswds4VF+FUUcLwgXqyeFLNqykUeqX9xVGK72xZk7l6o6lCv?=
 =?us-ascii?Q?PLdhrx5PzestmtwzJUBFcjal7PDLTARo2Pe7gfOkDQI7pT5JJoreL+pGP3nF?=
 =?us-ascii?Q?golRu1ewQOGjaFHvHfKH3Ot//hKfD8OXvhoQqxbNHp5B4aVORt6WxkoGlaO0?=
 =?us-ascii?Q?LFVDUDQnfKpLmLWgN+TPjVH+tSCVfgIC7Or997i9jJ/hlmW9dE62qyQhDzii?=
 =?us-ascii?Q?w3GMSb26Rd9ia8em2stopVGMmX08Ev1khw9Au8ETGTHelyfW1mm+sKv/5qkQ?=
 =?us-ascii?Q?/NhFCSBEs2dO7U4pcww9yVGvVyaM3q2e0h/nwgxjZDUgrh22HmydrBb1F3nD?=
 =?us-ascii?Q?ZNbzeDPcFP3grLMscec3QDEnq8NtswwLSeIoXM04hVZYxBVXc+2KBdy5MuY0?=
 =?us-ascii?Q?7HYszAGGpXqqf+c8FFKD5tYoL6xgHnidfViIo3+SBmfw6jOuJwmnrnwSOvw3?=
 =?us-ascii?Q?0Yj6Plsh9DwEp9FfSiL49Hbplo26ulB9itUfZQK12UOZgzWLQpJSHkmOSUce?=
 =?us-ascii?Q?mJqQvKSjSgIF+rfN9dUVZnGacG+EHNuXj3HWuiWUwbmDbw/aENsoj8bie5pj?=
 =?us-ascii?Q?QKBbxE8RCdAFPl1Ei0g9K5MjtBXJNkmMCH2w7Cf3xQ4+VLnM2PiH2s4chBms?=
 =?us-ascii?Q?TDMlXXlTjMcEtqdiJm3WjRqt0nGmXqTseqJyzxjGn3nM6jdrl3Bzf0NfzPbS?=
 =?us-ascii?Q?+vC76LKxwHVNZyubUMlyHq/IQ/2GosNqc8CzZHSel/7rOkhZ+suhEmOP4Ksq?=
 =?us-ascii?Q?ckTIpj1XR7w7iaCB9jR789Xgr2P1aev/fS579MeGFgRXCjv3WBaJO26mFTGv?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uc5mF3BFLSMl74OzduLqnJmuSNjXBon7oD0XvJuUFtU6n1EWOA9YIJAlx6MJIE160ETNdcJU8cFJ5m8Jn9YkXbmzTWUtkxFddFZRGgW7EJJunMGPcG2npzufOnb8PlfzIiRtYopREtIEt4hvj1QNZm+6yWmWzJcZeIS+H32LyDiyNZT8Btgdbg+UasZsUlcap9DSFHCS7K5SxlFK4/ZbXMpAgZ3qt7FNUXRAMqPH22Up/efGdomugoNppzBpR3LA3vjmdetVHH9McBInQTSsNRIH0f0DI2WqEFe/tDWND+vYmsI4gGEOimejbFdaEsS8+/mV1JhynasOXge9zoodQZ6NQK+PDFJ/ddk20oSrdkTXZ0WNKI2pTOAsNAIfxrPTXSBwdPUm1Z7IiRn0/LoyVC4BhkuvjEGOztIE1XXWU9pvsbuw8vzla60scJgEylHOqfExkASTEd6Lbtf4hOv15WSmAAL8INfcZCYYBxGMScugkr3rRoiQEza5SKV2WnazXdcJyYmvHwTFO+isqobrcYIg+WCn7sU5ZhYpo1fB20l0totezCPNBmpU/BgRd12HraMTL0lE+Rx4CwzkAJ2W7zywtp+SNYWUJcYeI2JCFhk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229a69eb-6820-4192-9b5f-08dcd4db90c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:37:47.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44QP5+8GbFeq3ZeesNHEtYerftYNM4ta6EaKm4TMC4DGcl/nkdmKvvbbA4Njj3CBxSCZq0MluwR7V/YAUnv6J2djXhVv+9FKSFt188tp4b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7527
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140116
X-Proofpoint-ORIG-GUID: Khq3HhbvuHE_4oD2D1TC-ReYwe3qleHz
X-Proofpoint-GUID: Khq3HhbvuHE_4oD2D1TC-ReYwe3qleHz

On Thu, Aug 29, 2024 at 01:22:09AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_aggregate.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 8825739c..d87d49e8 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -621,7 +621,6 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
>  		}
>  
>  		/* Skip if data gen is older than hash gen.  */
> -		hgen = *(int64_t *)agd->dtada_data;
>  		if (dgen < hgen)
>  			return 0;
>  
> -- 
> 2.43.5
> 
