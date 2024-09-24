Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE180126C0D
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209587; cv=fail; b=NFsJyQNeTa6bRA/zeBcvi9b+PgL+uSjHnddNbuVifoI0XwWHYGFoI4lmz8ZD7hCYJrxhWlC7Qsmptl6+h9PDP4pHJQD04HQmxx36zPTHQAldARSFjrd57PWNzrNOnM6H732HSd2qmqyLLxsAyQegcR0czc2nCwB/KjBMeP5PVKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209587; c=relaxed/simple;
	bh=V+zAvc4imvjJJ+InW4X932xXwyKOGA/V8UEtIeiEvXA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=drAJYctVAlutt/uipz1p9YglaAyzsZXTFlI92rKdBnHS4oaSDnQ/VST/olhvFfwjxNtHpa9swqYt3Evip7Jir/zupDokGOPDqF0eUIGfZn5dtzG9EQ9SuKbT9a1rdMwdvDWaS0H29ml6kpzGhP3LecGnSMCFg0nFYl2WcJyjxhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LoL4+pmD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BECshCKi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LoL4+pmD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BECshCKi"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMXWf020452
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=V3HYxTwIBbE+dG
	DzpQz7tnxgJXLDoUQ18vi7shksn2o=; b=LoL4+pmDHTNu7VTX336OuQ/gRloLlC
	Qt06udNqu/EPLd1Pl2yHTfhQ3Mbol33Th5mF1nYaUuZcNceods1st7tkAQVkWaO/
	FlcfCsbO0JNON315apfEa5mH6oxwpj1zphtyqrzDYAWpQGJ0jOahszIeFEJqjqmt
	T50kIkcUsUoKJliN+1sFYrJ4hChmQLZw4Rn51ufRFci3Rs0NPMSw6ixfnirG/Fa4
	iDUM8ef0j8/WQByCua6pFWtFaxG+xqGgPajTMAumEOZpftKkp6fdnHdDNhjnEAbZ
	D+gL4vy7vwoXsu7WpmQ8+E3GiNeRn8VpXv/438XFu6Ym1IP8QFU/LWdw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41snrt615f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIphkt026012
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:23 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41smk9rnt8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYS3P6CLG3vNfVJa4K+osAZzR5valSRVCshvpU5F0NJ63KCHOrknrLmQHkQA250UXpjTa0ODeryeVowQjOSksoZ+pANWbimIBuWEEVvQJ76L/eXMzLMUz4ZeDwc6WBBZPAGayd7Jko6Eo+3BpX/+/J17uAyYQSNKTaMJJMuGrNIIH+xCAXT9WNxQsEFNQvGfk0aI/g1pob1UB3DHMTjCOAdYcAWuiFfhzcMFFsEx35cZn+NU4XSL0bwGKwRIkxOwyot0OLfAeeMRzwjoBh8PRVRKKCNVdC8vnGvpwHE7taXMz6Zr4oxCvINegCFQ8zb3ChcnQKpTKkuootZxz3BTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3HYxTwIBbE+dGDzpQz7tnxgJXLDoUQ18vi7shksn2o=;
 b=gVskaEB/2Y1Oo87JIayVuVjf/HosP+c+9gqrsN0RSwUMRP57HTTzFraQH29OR8AWYsKNPBnn7rBFBrCNmQqRN4FVx5MQmVftJoRtdLhrcgwt6y/8z7nET4vaXjoS4GAKxf1smTMZllnJOSDkcJ6UnmY0oeuqhYZioQwssot9JhqeAxTc44v8InMCzGaC+PiL077uZluw5AE4e3PMgGSUSH9LIB3eZhSDIMHlD6W9+SNctChYTxdMLm3ky+snhwz6fYospt6SWAF+1esKJpSye7wa2nLJBi1itfuMQt4fQURyEUOgC8ZSZBOkypHPlckibxDn2kYJTojlFQMekuZh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3HYxTwIBbE+dGDzpQz7tnxgJXLDoUQ18vi7shksn2o=;
 b=BECshCKi/yRU968qyp65Nx5YdagzPNxY51l9K1SxrYvXr2sLRhk7v3oMMihaU8aVsEgXASltWDwU8D7HtYXdH/anDT0mNZK84SS4mWwzaDNjpSbfo5bbGWCObcqT+/wf5PCOWNQDGoeHYDkwm6o7UTkbQlyWurZ1Di/zFToaLao=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 09/19] Use usdt_prids map to call clauses conditionally for USDT probes
Date: Tue, 24 Sep 2024 16:25:51 -0400
Message-Id: <20240924202554.7011-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 00879313-2c82-4806-ed3a-08dcdcd72453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Atytxxx4IcCbPzewDbismo4SNDW8rMtzxwVSISAMwByiC1E5T2Gk+Ajy9zNN?=
 =?us-ascii?Q?RmHjOR8UZJQrBZsB71uzomlcOh5oo0AIxcZ8qa5gQy9Pm/Tl/e9MJXeeNvJ9?=
 =?us-ascii?Q?5rRm3wAhT325nqVHHQf6UDcTibZ01Tg5rbpQn/aSw23nUcDO+OE3OHU1Lwf0?=
 =?us-ascii?Q?F8DZXpckdNvsIyWcjjFgZ8oayXUmdWw6ku/rYia2ExWo2bGwHWg+/G7KriCA?=
 =?us-ascii?Q?ZnwZqREmiYTfFIG/pv8mGvMXo3FMS49l3dYZYiFsal7uKLTbIR+/uWagz4oF?=
 =?us-ascii?Q?KwFjOohHB05gSALqGJFpIFQpEfUihHBdiL2z+n6fGL7MS/CHxaJIaSXfYOwt?=
 =?us-ascii?Q?3hxQ3gyH8eYpT32jcgt+snYeBlpNfqz/CoESdroO2WQ+kq4irS7O0NgD4Edo?=
 =?us-ascii?Q?2pPEQuWh4Wjx6dqLD39WuJa2iNpt/GchnqHdiDkFctX5B3ztc2ecwz779yNz?=
 =?us-ascii?Q?T8bG3rsGDHoRU5ylxrXm32SuX5aDfNrMT9aq294TvfdW4i+ET+EakGAO1+38?=
 =?us-ascii?Q?UN3aR2EmCqof6gezNS8VYG0gB8SDxO0nNrcq1pRah5lHq23V8UKTHmpyfy0+?=
 =?us-ascii?Q?vATA9St52TUNHwwLcROb9uVMrYvV3MO1LkagIRj1NouRt7c41h1mWZScex4i?=
 =?us-ascii?Q?1Kd2TPwnZfqXI8LYAnEoiCP7qqbuYVmBHDdxhtFDIUhOY/iYvEnq2Ese99Xh?=
 =?us-ascii?Q?GJrLyHJqFGb1iBq4mqAm0myy8JEHz6Qsei7dRCztl3WMCBPBWR2DFl0IHzOx?=
 =?us-ascii?Q?JQnZR44a6Qdxmfv5GUZJxErrCgBiHrFz1ood0kpzMF5fr+Rw08iJrCqR++eb?=
 =?us-ascii?Q?0ahvYYDXCG9dSSMmmuJbKXN445inG1S/RYZU7eeBKjn2afcGhPASWmVxb5lb?=
 =?us-ascii?Q?+iLQ+NUg2tKplWTpWshsmUf8E0bXwWx6hFuK0jDwnofKayPn7Sltmhg9TnyG?=
 =?us-ascii?Q?UD5mFtGoik2nbdr1cGzEy5IQIe0hmIYEIo4YwHmP2xo0/WR5wrGa9TgbCbq1?=
 =?us-ascii?Q?Ff6s+0tdr5j56spigVtWErJDh+Tu15+HwGDm/pdfRHMgPTw/yiZBEEnLP5oT?=
 =?us-ascii?Q?F99sdJxQl4C8sR04WunBYxlkLa1ocKHDYLbJwkH/tO7k2Lp3ddxpKLZaNmpg?=
 =?us-ascii?Q?/ksY8D3GuVFiSn+0OVFtllRJtchcqoK6EvIOuEt0QDDilXz3FeR5VyFDHv2X?=
 =?us-ascii?Q?5AV54yR60BKYIOeeiTtP4Exq31G041I/M5wvuzsCKjSSmDmWHcEy24uzI3bx?=
 =?us-ascii?Q?q1Hsb4PtGZSJxamgBcWh8BFgfOD1uXgoFvxEfSRG9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfsAOBZ6FsFBW/mHdFCXVQ9Lt/UeVas178/G/ASiIf0nZGNPe52cIMK2yj7l?=
 =?us-ascii?Q?cj+oMvBhz/nywrUNWGDIz4itohXnfJOcVW97wtV5poqg39NEFHZgR1PvjYzI?=
 =?us-ascii?Q?nw/79l2F/9ourKjCRBQ3zZ7TfhkvSLwSb8coC/xt7k8C7CRf14pq43jj7EkE?=
 =?us-ascii?Q?4L6c064dJMsA2axSe//efesJ51Nn+JM5uoCN6+kmaC/SvZ5pgU31iQ2Hrt8B?=
 =?us-ascii?Q?DCw8+8mEkb1txjPIzJhuSSC874RCjNKgargNOMdESxkVTnnLqiShvhyktYAo?=
 =?us-ascii?Q?Z4FP2VDf5qNxsyT6y50XMQA4DEsqaNb1ycbcLPHDpGvHqGXGDajhhpN/nJ8I?=
 =?us-ascii?Q?jRJjKXTi8j86Ji/vahLOJ8n+/OZNCe9WpDVgXA1QQT3/EZ7Ztd+13ewv3LUd?=
 =?us-ascii?Q?xhOs+JC24M7TNEsNIjtfmOeKJuKmFxHDUEQjxKRoEPgu+61X3/gdrUIJzuWB?=
 =?us-ascii?Q?Wj1gSEjSBrWzrFPXbNrSFNIU9UU8ZWyi0AC6azc/2RA/0OLXebuxAn6mqEjV?=
 =?us-ascii?Q?eAAptn9C6do0p62mL0oNyx56iGqj/QECFdr4TEj/q4ktNR9PJlpyTMMNT9Vp?=
 =?us-ascii?Q?Qg685wWImPOzyGlxsFZrv6bnKDf9J+2tPFI9CvusOJULyC2cAMK1b60cOWOi?=
 =?us-ascii?Q?FYC9xsPDsKIlMhw+ZhHhAL+G8En/gok7M8Xv9kYvZo0OGOvzvqVoA9OScKG1?=
 =?us-ascii?Q?DRwJ/QsIW7W9CyjgTs8ve+7Om2k13k7fvou1o9L3DaBqqQfEMe4iO8fYp+cR?=
 =?us-ascii?Q?MzjdyYnnb485wEtZnXc1UUNwpORh2Z54n12v+LVGUF58LQChAe6+Nt8S8fa+?=
 =?us-ascii?Q?fPO6GKPLYMORFT35VacjgTAglS3Q2MdGWfJUQS1KM2+pnQEIosuxmzlbL+ne?=
 =?us-ascii?Q?VKcAU/nqkh3dB6WkPtXTy5BABSAteBMPa73Ghuw+8V+/1x/8OlpJeO8s1SxS?=
 =?us-ascii?Q?JJjcjavCP+BT73CB3MC7A5DC7ILZ1FZejuAZEGa6YwNu5hLDn/ylO4EY4LyH?=
 =?us-ascii?Q?zngrwnMQKeH/p/E/aqhzGXGQxk1LGOyayS9wytFGH4fXpR1KhvuVzRmDWOKC?=
 =?us-ascii?Q?XSkBGqaJuovuLMqnmEqzXh77/F5MUdLS9d+ETitarCGCrpoRXlGdRLAo7Zj5?=
 =?us-ascii?Q?ajpkMZGEGB2RvGGRHyoGoTbmWRapqiTaZVGq0AbjxT58YzTyDrL6RQBpOnSU?=
 =?us-ascii?Q?76zBg0hd8BzqeJu3ZIiCU29vA1mTLVfgR6mbNfh/qZAzK3WITPRp5Iug1d3M?=
 =?us-ascii?Q?FyTSb5Vy7DIAJZaDCNtoL626jvJ+VCgxna1AJ1B2aD8o+YQZZM7LuWQswm5f?=
 =?us-ascii?Q?duPtZlUleY9OTaEmIHjhMZVTQT/2H2r9uXW1/kbKaOCbiULCHBmhJFAQ0IUn?=
 =?us-ascii?Q?7XMmK8Fs2rdK9Eyyr69B0zN86OYCVV6I61BeCH7gaK3/kYDRw+ssxNGyto2o?=
 =?us-ascii?Q?5i6BrayLJVF7s9JZEgPxFGjoomxtu//QqpdyXCsP845117mKxrrvqXP4WESx?=
 =?us-ascii?Q?NdhnvXsyF8cy0vcu0j6fSZI3aBKrhxmtpkFBQsEZFyKQVJv02Qi+oX/LrKEf?=
 =?us-ascii?Q?Ywa2NGh5Jtt6IJDGtrjWzbxPy8onknQCxqM2qk0a?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YbrFAaaCmoVOP199BX/b26sc1o9Q0ayMInocKl7axyeln2szNNMYFb9pO00QxzmFTyg/FUfQYtGSRM2huVcfBwd2M79MFboQ33VP+DrLo+L8Gxj+HKAIE4p5Jgb6T/nnC/Ufj0ftc8okXAtmuxkXelhLAu/p60HH7I+kiTbFslyd3NMdOJVPoVAAUBNknK4Xvp5nLQrQYHPuBl/xoziJ3gONnsZl8y04xtlW8qCjoy68q8CyaR/C4CLZh9DsofMMDaaMfc3uwYr15i3dTh3zL5/1lR2KDMU23TD73sPsMt9gUKZw3MsoQPrf8UOVYwWnNeRsuuE6MlBRy5/Jq4gKr2KuB16hM8ko7S3i7uCkqExqwZlYTtI2fbKCYhiJLp56UcM5/7CcQuwZI7GtEQ5jVyDD5jaFgK4zOHm1/redlBBXrMN/zrC3CQo/hDgxEOX4RGcBLv7r2bWimaC8HPWxr+a63XnRku2GZia8WtBFkjslaIr+R72cawjuVw7eHBzQJNhaiCxXQ+XcHJhbSHhLWyYFwPfjDBgSoHsW1U+aTmjf4ke+cCcqmh+26IjqITSpb0+XQl4CLlhe4lcsuTuyevwv69Zn0PLmcth5kJvmrgM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00879313-2c82-4806-ed3a-08dcdcd72453
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:16.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBHfRtpGHKOLFMKEKL6IRC43QxeV55m3W+KHWb7E1wmLq8vdTJOWuCLId1dEKgWsPcQo3kqzt89sHchJOUKkpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-GUID: vcQq03kWqhoqQLu8mF8H0fXbDGlg6ai0
X-Proofpoint-ORIG-GUID: vcQq03kWqhoqQLu8mF8H0fXbDGlg6ai0

From: Eugene Loh <eugene.loh@oracle.com>

This version supports only up to 64 clauses for an underlying
probe, but it can be extended to more clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 164 +++++++++++++++++++++++++++----------
 1 file changed, 121 insertions(+), 43 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 7559be09a..510e2dfa1 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -691,11 +691,16 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
+	int			n;
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
 
@@ -707,14 +712,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Loop over overlying probes, calling clauses for those that match:
+	 * pid probes.
+	 *
+	 * Loop over overlying pid probes, calling clauses for those that match:
 	 *
-	 *	for overlying probes (that match except possibly for pid)
+	 *	for overlying pid probes (that match except possibly for pid)
 	 *		if (pid matches) {
 	 *			dctx->mst->prid = PRID1;
 	 *			< any number of clause calls >
 	 *		}
 	 */
+
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
 		const dt_probe_t	*prp = pop->probe;
@@ -722,6 +730,9 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		pid_t			pid;
 		dt_ident_t		*idp;
 
+		if (prp->prov->impl != &dt_pid)
+			continue;
+
 		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
@@ -753,6 +764,91 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			   BPF_NOP());
 	}
 
+	/*
+	 * USDT
+	 */
+
+	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
+	if (upp->flags & PP_IS_RETURN)
+		goto out;
+
+	dt_cg_tramp_copy_args_from_regs(pcb, 0);
+
+	/*
+	 * Retrieve the PID of the process that caused the probe to fire.
+	 */
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+
+	/*
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
+	 *
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
+	 */
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+		dtrace_stmtdesc_t *stp;
+		dt_ident_t	*idp;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		stp = dtp->dt_stmts[n];
+		assert(stp != NULL);
+		idp = stp->dtsd_clause;
+
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
+
+		/*
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
+		 */
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
+		emitl(dlp, lbl_next,
+			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+	}
+
+out:
 	dt_cg_tramp_return(pcb);
 
 	return 0;
@@ -798,10 +894,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -810,7 +905,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 
 	/*
@@ -828,46 +922,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
+	 *     offset                                       value
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
-
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.43.5

