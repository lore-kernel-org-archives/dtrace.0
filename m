Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBF11D86F6
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662009; cv=fail; b=MSLfW3zkpOxqJKKk+CGb2F1hhaw1uB3xpfj4F30jrSZUIbPb1Ku0DApqIskgw+FghnbXEO2jB0A69sXfhzgXGQf/VQRjWqASAJSXn0ygJiXysjFmlIOAgr5TfQZM8+PxmEIRDxubo+t/K4pM5DeftUNzk8S+Y87lJm5wuSvC4Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662009; c=relaxed/simple;
	bh=ICmVATIyN9LaDJ0UPj0O3N9pmOjrSLP4wbgr5bVx+DY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j+OLGHEgebW4/DmbJZff2+Nou2jzCw+q2lCnKrQybyyODT1WeOoFbo17AVyUSIhBbmKrLjHz+BSyOa2FyLXWz8TEvznEBriGc2IeBrq4Ud4bujo2yPtgCMOzlM6SvGJRxUyPkv2ELwTF5L3lmykiIfFng/u6uXNZrRqIdg7RUok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOdfnmwJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fslHs7cz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOdfnmwJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fslHs7cz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EIpwMq019789
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=XwP9Ya/InKPLXmDAUCjKJSYhOvm2pZ8W/VOwR1tNzmQ=; b=
	VOdfnmwJU6fcxP07N9jGYLOyM9p+/QD/RPi52QbEVX4elcDQvSvIelqYxe2hsCVJ
	idpxy4UdNAB/qbrIK9HCfqaP8rhUATilwkeZ1RQcGM8kp86FyOrz6hzOmbzToSoI
	KJ5Ci7krakJYB9nMb7ksXkcQfiE24Y7yo3SL3bGhGtb/EUyjZt7J67X/SleGw2m4
	d5SIn154sChObymhgsAMcQQPA7JYRn5b2qWWJJMHlfTlj1PeCy4yTajKpYG9lbdA
	wTY9p/z/tCsE+Ftr5bDQoEd3427BJG3qbaAuoVGp7DFchdQPzv4tZ2iQBGZDpqTY
	Plm843I3HK9MgKw9isTxBQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w865f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJNWds031033
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:04 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012036.outbound.protection.outlook.com [40.93.6.36])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460db9gycc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 20:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feI3QRtMY0zHrerSDNKl1VDY+76E/mwwITp3xK65kfxizTZbYEd2fh8j8yaj9Y1BjIu74+dUkMPDNkkrYxBMndQ0vTTFlzTP3w2yFV9BJK1pqSt7lnTevYi9hAmhMCibash+vXfOnwJpTYiH3lQYXwCSU2uujNO6i59fBcF2VAAYfOypEf1qBt/GhM1r1gqqRHxlkKNwHlYpXH1iGkuC2SO9xXkoeQt0BC9iGIt1UI1etLfYy6sw78U40WYIu2gZEUnLjx3o6sbdpasFzDGiSkfjyG6FYdigiuvYtA2Mn7OabTt74PVoSmrD9R+m7xOkn8Qbkq92lxazgClcPW54/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwP9Ya/InKPLXmDAUCjKJSYhOvm2pZ8W/VOwR1tNzmQ=;
 b=EbecfjGaGvvYe8IYTm478iwuo1fuxQMBEOqQeCPyHu6/b6cD3eokrTR5rkZIz6PuOi4g2StuUT+lXHDnmWKAfNJkGOdKsOEDK2K4TkRewwp/6Ux49Rphtd1IfsgMmpVC1h/Bnjdu6LSq7p10qXnYgNj6mtQXFBS9T0zDd+yPdXBJfZvovhR0ASzMxtq9BxuumFcFtcAdltRNYVE9Uh+NZtaW9aSH4U5vE4O11oJUxHNrJfBnn7gQ/IaPbM2Fd1cfjNx3UMg7aLA32wK75tQh3YxlPz35P9iZD3imjk2zDgMZn7j02Cd0QkLBNgZLRP5YxYzF5g5BJga2P6xpSaWLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwP9Ya/InKPLXmDAUCjKJSYhOvm2pZ8W/VOwR1tNzmQ=;
 b=fslHs7czQ+YyEC4rPsnusfReQFZ9k9JPUJOHNZD7FT5JUnb4YAeFMuJnLfuEBiyDBwT7cDp8JcNviVTZK20/57T9FV5RDjCp3p/qW/Fs08OKRohk8d0jSsEw2LH7dN7H/e+STfz+MfBzaATvHTfB4m8qDwDiFrJiXHETVz2biBs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7535.namprd10.prod.outlook.com (2603:10b6:610:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 20:20:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Mon, 14 Apr 2025
 20:20:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] test: Remove orphaned tst.lockstat.r
Date: Mon, 14 Apr 2025 16:19:58 -0400
Message-Id: <20250414201959.31327-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: aba12c09-f25e-45e1-4090-08dd7b91bbf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VSdtOHHVBXDWZyuqikLOQC+AqEHagi4LLX2o5S46E+hAPAEphKMIoOpipoUK?=
 =?us-ascii?Q?SuIowaEMiiawQrnd/lWGbVewBw0J20kw6eBC51uwqOd18yHX5xmwt3cRDpgg?=
 =?us-ascii?Q?5hlP4LwxpSkqkGaOUNnvAyLTzgxJOG9JEMLRi+WUq4HhABW4KXD4xjuujnI3?=
 =?us-ascii?Q?jNXpPb7Uza3vtWQ0SOPOeofSwqJS6PX5Q/VcbFmsh3ZHJX66CyFGTzr4crex?=
 =?us-ascii?Q?s1SPP8P5GmCT8NLd61PSV5/0a7KTmEz1H8zT+5iKNeI0RpPQaPb280Q2ZbMj?=
 =?us-ascii?Q?pB2HezLdb6Wz5m7xBKNP/8psxsLkR9szw7Ue7iGHXQyPR6ZzxaEckOdE4dfX?=
 =?us-ascii?Q?b18Biw3zPuo3yvQmNPHtjGnrayiEiXAu1tTn3Sdl3BAoT0gHsoAsZCbc2bDM?=
 =?us-ascii?Q?F6tK0i+pJs0G5YpisOVcHRqiMS6f5a1uzdWjrzKSav9icwDHKq/Ap27KbLQL?=
 =?us-ascii?Q?otE1Yprpzh0w7yGbEH2iflz5H49YZk9eeD9ZOmmYghgqnS0VJkKI3PUlQtGB?=
 =?us-ascii?Q?obr1QkyV/xuvjuUocemf3Ijc/6jlfYJzeLAGG2YJhGn3Ur1jlaISqRC5PkZ7?=
 =?us-ascii?Q?evY9O6F17S4ppl2n/jgLqffJ1U/Ko198Yg9ibhK1pAhCFT3Y0WDlyVYhf1ZA?=
 =?us-ascii?Q?mgWJdQMLdtnQ45Ik1EIbvLAw9BkAb1tCwfGR4dhuh15IQoTETzqM0r9G4Q7m?=
 =?us-ascii?Q?lL9siNQK/zBzw4RKguKaLNAOk9J+Mv8VfNFS7LkYaXZvUAznD+i77KMEtJ9C?=
 =?us-ascii?Q?mLZPpH75Bkt2HgCyg2CMw1TvHPWy/hdW/L/cOzOGbVUGpTMX6yu2QhsbbP4n?=
 =?us-ascii?Q?IJQ7EhS2tZR981b2dmHnyrK/1D9t+tm/MOEErtij1DqbKqqmJ8Dh2f2ZCunV?=
 =?us-ascii?Q?iVELMoM74ebhxDVdUenATi6PlapSRQ8rS/HqZfPPcunr9EPxxWVdfht1/s/B?=
 =?us-ascii?Q?LZd2Sqptdpia+Rc/Ilu0BxFbEeDr4uX88hpXzrgz0rT1AtuK0Omb9lt5dLD4?=
 =?us-ascii?Q?T1tcAel71PMxPoJHPg76bLMN+4uUI0KmEcuPTgbrLRWM+HlEhYAA3W3VActh?=
 =?us-ascii?Q?kDRC88m67swLhjAXVwcliEVkw/xcDMAm/dHXyLym7ebm5zE5sN+jBiog/mVQ?=
 =?us-ascii?Q?/QL6dOnh0agswgohHo0e6mi4UCgpwwDyspL5H7A1kfwErGPCAy0nzEL1vIKQ?=
 =?us-ascii?Q?mjuxiyKOQFJL8U6z7OU80rZhk1C53VKfeZDREqZFhxLFxReK7stCuB3raIET?=
 =?us-ascii?Q?wjAwyLcj9tF/pS16DDvBOc+vC6QixYG69T+PdOA+Ma09qQ8xEzLu+jdEPsVD?=
 =?us-ascii?Q?/N0ytk2jKt7rGaUxNtKicFei2N1m/hbGuB+5W94ECAII1nXoBggOmeNpxXdx?=
 =?us-ascii?Q?/2cKtZcKcftRM8G0rbyJGVMRg+XeEiMEFWsJmj0FsvyhASLHW8IuqtRsPHhj?=
 =?us-ascii?Q?BRdQO65MwWk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ctI5IEZLpEgHQ/vNthl2IKhRVabtf6pouTIbNbAPWBWHpeC6GpK5qrYwEUMF?=
 =?us-ascii?Q?pk0AmuYZMCleRu7jq0teiACkBd1+GWWA08eZrgQMRGdwR3LPV9xALngL/Ldt?=
 =?us-ascii?Q?JE5FqdLzhP7/754wegaGpSxaRvzQpfI+wA03zAuQZPC/G1R9RCaApKapx8Xk?=
 =?us-ascii?Q?C/UVoGXnlAPCCDBM+TkF/0LJEaOK9b0J7eniaMcSpnhdxjunnTVU26ncB0lE?=
 =?us-ascii?Q?J2QP6FISf+9AwoULFbGMkU/Z0jvgOSVC4lYJe8Xxj4go3FkSJUGVlb7CUJko?=
 =?us-ascii?Q?yGvvFAPE/zR+OS1OFvP0ypVEHelVqa3V1LgEgq2h43YdyFkyCYXskcnbN7Vd?=
 =?us-ascii?Q?giscfbMKF/p37OCBG7Bpjx+wHKegpVVy24nWvwdW7QiEqBohVVUQpNXUsyNE?=
 =?us-ascii?Q?4zmqBpavXElKftRiB5Hh5y9/T/L4R45K/Z1v1Sxp8eALzJ0hZ7Qrx5utIpDj?=
 =?us-ascii?Q?mpG1s+D3ZxiF5eoHuJoOx2ITK9tFh+7cscv/WshEefTzxdSDvnQ6nqPhGwYE?=
 =?us-ascii?Q?J/D1UFUM9HRRHldI06pAI9GxNbNN8O5Qav+GDjN/nIK6eXnrD1iNUE9Gv3Lx?=
 =?us-ascii?Q?HZJoLQiPQA3D9prYkNFyvCh/iiS38ROC/C51NHbyX3uWOSAXVeyhDp3wyENl?=
 =?us-ascii?Q?orRg4YSzUJjg6PmmX4nFxA/7TqHVHAsUKI0AqLha1gNW5BbObS0SKqezmLA4?=
 =?us-ascii?Q?2HdpN3XMNsLBms5PTikVU5BKSNZadW7rBho7KfQ2Bh9gtAI/TwjkoMVAqZ7k?=
 =?us-ascii?Q?CGWhqKwP6ZwbDX7/Hz95xd3kkqGOs+K2vZxz68g45xUE5/LFOCna0H9It5HV?=
 =?us-ascii?Q?m35NpswtY3KdB/4Cq+NNKgXG5oxysj5J6tSd2rwnTwdJyVBGI8FfYFZAby4M?=
 =?us-ascii?Q?Eiv7sF7UtQ8LpTYeiXwYOVBA0mlPhNI1zl4dScHhQrzJtT6SBmP8sf5y1X23?=
 =?us-ascii?Q?3aJev0pO4zRC0KX6+gHlPBdXbtTFJdsLQ4ZJdj9Kn/QckDM1nc2kFXbVCQX2?=
 =?us-ascii?Q?NX8fKcs7mch+au5+NetBde30sNf30dZnUIHfRb6+NeKu8em38611rNK86HMo?=
 =?us-ascii?Q?cMyZ+GEJRJ1qGF8n0+XZXEahpK4IhYxaTsvxBKtpgagIt8iZCahq1xUjBf0E?=
 =?us-ascii?Q?ZEfqtTt23eAYvHe8PmyhOugL550mDNHHorzdHuqXlxMev3Vrg4VlMfiiONIo?=
 =?us-ascii?Q?CajtBvP63HYMJLcsSyQ3blyA39/zy4oJYMloLit9D2pjXpzb2YKARVMIe/Aa?=
 =?us-ascii?Q?GLixZyD5kfsLwL6h9Lq22BbtdR7B91rCpgfiWM/na7P5lHbgcOOdBsGyKNnV?=
 =?us-ascii?Q?9lOZdYOaGNo1MaeExHZPLu7x6I/1lBd2B2//ddbr7FkhtXEpF95s88kupYkG?=
 =?us-ascii?Q?S6PhEvKmiARd15VDdH9QrIlDN01LKdpy3otbaiAtE1BSHzn9rDez1mqq3Kcm?=
 =?us-ascii?Q?I+J/4yTnzteSwidpwn2x8hydH3ninnFPU1PAs8kfzGKw4rwl3EHXCY7vd6BV?=
 =?us-ascii?Q?1tlGxJnBNFW5u7rcGfNaJ/UkkH38yojE8IH9VN9U9j7OXIfSqMZRb74p2NNd?=
 =?us-ascii?Q?Fh3iG4rmqsAfMNo+jW13T0Dc5uJW+Mlpg5bcfSYE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jx+YnivPTC2nneLiMhQT1lpqOZO9DsRjUmAwwnCqUGprgA+LVv3OQYdO0dijG2YSDf3kYg/88hGSW/A/ihBAIF0+jCRd8Gvt1mUl/if/YRXtbzYv2tCgXWbttVIcPXd03BXEiTug0HUTttkm/SaYGnV3pbCNrjlNrttJLTLb3+/9H1FHEHR1P562yLSYo/TkuLwhnOIPDRL9shKi2Byhps2ImVsaEy7TyF1WBkN40+CmGokkQbcHfIcJMl9YqPNiCmFF8gCgN7WQItBqbfYDINH6SEiZ3bBwGTnKCvttYRFL50Cw4afe0ZA70/TGjXmbmLdvvYws++oKIRVKe1SWFmLfVhu6KDtTAjaRp5u7zTTK+tDxfbZ0/jGbJTV9/wbhL9/g0L5LQ12ZnURPsVHcMaYn868b5iq/jH28h9v99hW7ydJzLiAjV++Tlz+xtuxekaWFp9waoq03jvNIIzUjlw9XuX8GmK0eOSbvWsnAeVHCiOPZ70vAcx53TH3DGs17d84bSIIyuTWBAF83YPbGYuT57jijs3ikf7l83fd8EKx4pXRcxKiA1shwLrxqBBXbyXWqsKTmVJQYKPFw3LMntvR6I9rBsld44ZBvD0/E3f0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba12c09-f25e-45e1-4090-08dd7b91bbf3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 20:20:01.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vwSZIngRcq1or07epYl3oRsHu0AAsBfln679knyX/YRSf1BZrdJAYDht5Af2WrcIRARffjJc5pAUEuuQc9ekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7535
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140148
X-Proofpoint-ORIG-GUID: rHctDkf88gFZc3B1AvnV4QmKqT6T2ZSE
X-Proofpoint-GUID: rHctDkf88gFZc3B1AvnV4QmKqT6T2ZSE

From: Eugene Loh <eugene.loh@oracle.com>

In commit ded09d05a ("test: rework main lockstat test"), a lockstat
test was renamed.  Its .r results file was thereby orphaned.  Remove
the orphaned copy.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/lockstat/tst.lockstat.r | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 test/unittest/lockstat/tst.lockstat.r

diff --git a/test/unittest/lockstat/tst.lockstat.r b/test/unittest/lockstat/tst.lockstat.r
deleted file mode 100644
index 5bdc40c67..000000000
--- a/test/unittest/lockstat/tst.lockstat.r
+++ /dev/null
@@ -1,13 +0,0 @@
-Minimum lockstat events seen
-
-lockstat:::adaptive-spin - yes
-lockstat:::adaptive-block - yes
-lockstat:::adaptive-acquire - yes
-lockstat:::adaptive-release - yes
-lockstat:::rw-spin - yes
-lockstat:::rw-acquire - yes
-lockstat:::rw-release - yes
-lockstat:::spin-spin - yes
-lockstat:::spin-acquire - yes
-lockstat:::spin-release - yes
-
-- 
2.43.5

