Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D832ED28
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662110; cv=fail; b=Gb8NnecnnxiytcfQ8it1XSRYyoXktPZ4J0KYXHNvtnx3YGp8Ai3pvkcpiK5ygN3x9Jd9yXCY8Y2nrr0b4ze/E0KJChXkWj/1tZUJNZBewB4aLras4cgZZqf20QSV9kZUjBfSlYjkcjaVHGmUZ5VKGzrMQUKC+FEdCtjtZDKbrak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662110; c=relaxed/simple;
	bh=iEgrF2+PrccNseIz/i2LpXC1JB5q+JetZvuuWRICe/8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=l3/0M4Q5neyaaNqgvCUf+EsFJkqs+kC+WlUIYugf+N53oMpfK2k0l8LHvdc8fAnN1H58eQ8pr+70nd5/AxoutfwkWujSJjSz99NOrABJxYOyvAqybW+ZlVEdjj705+RijtnhS1GKfyCBebd2tSConOlfYMIv69Eiw2HjCzkRZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FS1Vattr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UKPV0e2k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FS1Vattr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UKPV0e2k"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECWZ62924601
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rcZtatRCZ4RnQEGQn+9Xom4znT6hgNbU+1FNbTWld5I=; b=
	FS1VattrX4yvzmfUb7Pjp1z6H4Mr4/TatdhBL1265F7anPvwv+uNZQSFSntXNYXt
	nxxqkaaJW8dLYLO9vxEP2JgpNy8EcFgIx6oBcYXkr8/aN+3AeXVDMZVRHPg7luaA
	24wTF9Nm7ZymjicvOgjZRdVAyaBGoXzqtcgTYOrS+bpFDCrTo7S7Md5vikKi3AGa
	pG4bSnnxW0kIOt8cDBXv2W4Gm5a+gqaYyXQkhucDCCUHxMurR1sJ8laRsJjOCK9j
	8Yqv8aRYCSD49rOdbdMM3yeyCLWYH9rYhh91350I68heVbAO22iFOMQXU8aLfZf8
	QG+TaRrjNT03eZu9S0d73Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xf3th04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:35:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619HiN8m033706
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:35:08 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c7ctxtwfa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDaeS8CESbCZomRt6/eijTY0g1/4cFThsqtx4HSC51kPsabSvLW+tirGD4p8cKhpWkc/uf4mc8NJOaqUsJYNnNtCKuMxywswL4VsUmpKfShxTMRl0nHWO1cW77RH1DHcJ4IAo0iZLHchYXLvDVH3Q6VVXM5aPbYxT761VPuR17ZmkDHyA3L8/D+g5xaZ5z/FTrUEnwHqRONSSsNm+BSHZsmd9v/4eW0iXMmP1is4+e8lEBGd5JuW0vebIKGDJRYYnmjjoVN4lAARXJ07yVy8XXqA9S543ilsHgSF5Sudf3/Zx5pv1fcWR1Ow7g6a5bBvGALzGFcMf+wFdKo65cL5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcZtatRCZ4RnQEGQn+9Xom4znT6hgNbU+1FNbTWld5I=;
 b=jaRpoXpfZ1BXQRLik8i7jhXRTZaXaSCFMH8XNuQ2xen53bUiBaXKnSVJ9LrXT5y3nUv2YAD6k0ymeSV/ISpYAphNs4eW6Mf+9XHQ2JOGplSPczSe+BrwlovHGBxuCmZdX9Gg0j6UJf75LtzQmLaH9J1A3Sp/jE8GcveBfB6x+RIpbRZF2KVpYaj+eGUKJOc/PGNDHoRlOZawOSU1M+Ae0NWffySzva8az1eimZywP6kPB519Z745H6RNwBZe1OLE5qDPLP+Ema0MP2iqBHVO+CUnzhT6sUzTOyQZpBn7+wWxI2HC7E2PtUD5BOg2N3O2H55HWHnZK6bMV+KOBFH9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcZtatRCZ4RnQEGQn+9Xom4znT6hgNbU+1FNbTWld5I=;
 b=UKPV0e2kViCurDyfrP/Vge1THOcUqLZuFbIQ0x7L6jcGOywi6GkEBxNl2YoYsQkNzQcsIOIlPQiGkYWFG39A+MF8t+CHvoHYJaqnNTAajVU9PfcBy1b6f2rlWX1ndwq2zbDjc9JHDYcZ5qZ0NEQK6YOOwUNkRGG4nLGq5IpEXfM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB5645.namprd10.prod.outlook.com (2603:10b6:a03:3e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:35:05 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:35:02 +0000
Date: Mon, 09 Feb 2026 13:35:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] pid: USDT probes cannot have "-" as function name
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522231ADA11F5C6C606FC8EC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d33840-1f55-4cee-a443-08de6809efbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K+aX+s10HqiOxTj6P+da5Cmhmz0RNrnszqqkEQHpSGjxanTIJFu2kfZVmJLH?=
 =?us-ascii?Q?MHyAIJAyr187YbuSzq29Urap3BxB+WsMZuywrAcDOkVf7b5Zzti2E/sepvy9?=
 =?us-ascii?Q?yjDk2+1Hn3E17hqMYLI4kMrpa8U6XPQxP/+5HANweL//hFIUW9qOqztmEZcZ?=
 =?us-ascii?Q?vsrbJVSBwbDSn3iu+X0xdfX022kmVePG5PI0hERkJ+Hv11SEF3JNsX6/Whn+?=
 =?us-ascii?Q?ubdIFXNRGwwwfuAHi4daRMYTde280sQttkbLl6kAH+QYFwbQ2McpYEcZ14dw?=
 =?us-ascii?Q?C6zCvAtQm5Hgv7lysF4554iNHZ81VUoYysEzMM0mEwxrmzUXwDXER2TTMn2J?=
 =?us-ascii?Q?I4au6HNNzolh8MjJEMEdD9p8Q9k6l/Njnv5uaBRh/TI6U8AhYVsJMTRr72Yc?=
 =?us-ascii?Q?XFUH8VymuSxXQYxfjEvgTTSUmai+OGxaSFhShLeMESjdG1NjWeOsNYs/fC6s?=
 =?us-ascii?Q?JSfhCKIjs2p+PP2W8wOMWQ4d8SU7CIgZjkdSKcoJ2tAZo+xq8OVY34EUB/7Y?=
 =?us-ascii?Q?SCtKtCjWxPJjiDgPETq5Ht601c5w7KDBj4QAne1LM7/73h323IfOvs6BltLb?=
 =?us-ascii?Q?EbzcXuWlsUuCaUtAUu3QSSHULSh/emT+vz+dozFDJkbkVTVo37P3ZS6L8Ffu?=
 =?us-ascii?Q?MP8qMiJX+WMnEo2/RQtHaHQCOVNZF16u5cviN1RtHevrXN/pXoB2nyoNt7MX?=
 =?us-ascii?Q?2Wv+Acj2ATcUqzWQONqC5lrPghhZjp813MGJOUsXJzn/1F9I46WBl1OxVO7V?=
 =?us-ascii?Q?HTgLHm1thu6p5kyxnIZX4GgPbaL49pcaIGCX8eVgpm4BqPTWBc69K66h9PU/?=
 =?us-ascii?Q?WU3M8YJBVc7uYPbqjGA+nwFVVAFZmXPPgY+pRXodqVeOTStTyS2Kv4yETqrv?=
 =?us-ascii?Q?XlKNIywErLm25CzGHvYE5BU5NadQhquagLkRPDwQlwdSi0Gvccz4pxr1h3rs?=
 =?us-ascii?Q?YaPiivQO2sbAtE2OYjf+LHnUVyKRZ3cnuHuxATAIOTmsVNcKilLlPgKImDqi?=
 =?us-ascii?Q?n+lICA1N/EIaI87fsLUV5A77cYHb6H3/6L4HA9rze4GTSYllJmFph+TNZmuc?=
 =?us-ascii?Q?+AXrSdzfNPZR+cwrlA0Zu27GTsKO7M2rW0zqc40WK2xen3J9bDuuABWX9eM1?=
 =?us-ascii?Q?de45YqQQ4CWO4PefdB58yqWy1i9nzppHgHJPsRMFCDAmO8igXncYHyk2s/Hs?=
 =?us-ascii?Q?L0Hl5wP75cbs8eMFaWsloQbEdvCCejjGryNRUSY90aq+FjdM2A6fIEfIFAcP?=
 =?us-ascii?Q?oboQR8/wRPS0UWvnzDuTfpB46d5fzis/NIPodNcjbKrAH2lwAJj3Zbmhp0et?=
 =?us-ascii?Q?KrXiQcN8QeT03QenQVA6y7atL9o4kZ757LK3/TD+vInZIgQpBNOk5sfSYo0h?=
 =?us-ascii?Q?pCiMIv3C12NosuRwJ9bO5AwRWaSHtnIsVD7qNz4ntmbvGEHlXKupfnocnBbN?=
 =?us-ascii?Q?VYaS/3Z8uuB9u1V2ilZVcHVEkGzN2GQGUO9ez7z03abK8lZkxnnerUApX7kb?=
 =?us-ascii?Q?x2kjXrI6KpkhmUIISEc2lgy1R6rTcxhBwdfLmCst2StImuSG0PxJhAwhzG0X?=
 =?us-ascii?Q?71wAH/i+uMDNTSSkDfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZdiJukQdcDhDE+9eG6/SChqffMfQG59kwP5xgHejlZI+JUZnpBDZrT0tJGW0?=
 =?us-ascii?Q?3YolWi+0jzlg8UOIQxgkm7NofstS9Lq+P+LMbxnCF/iRgb+4v0WBoTOQ005Z?=
 =?us-ascii?Q?mdnpJZuPAtlSmTPdKXWInHRudQnIxmoKj30ILpA9bcA0NP9NFTHyiJFHIFQA?=
 =?us-ascii?Q?fPy7Q20XdGF56HnqrJzu96iJyPiHJ15Ey3gdQrs/Appueeh0KBf6Y79mhI2c?=
 =?us-ascii?Q?q/bIP9EX0/yhigw7PcZAw1Z+FeuhvCQrSv4Y4mSSXJUDPFVuqK6fO+BesDuj?=
 =?us-ascii?Q?N8gbRdWhPH7ofGZHlrWizHadkl6DUBQMfCQwhv9eeYnjcZEo6gFjvIjgJHJ6?=
 =?us-ascii?Q?FjZUpaEvxp7FgPNQ/vPy0AYZA4pBgXt6+AYm+dJCa0+hCIOIxoKgxKzZfU77?=
 =?us-ascii?Q?nEqeL/6AURvpbrftIs+SIdJj3AjMg+XIasAKGvKMR2JbHlzGuoQVY6qKUmPA?=
 =?us-ascii?Q?S2GejUXNeUKIEw368BqaWDRdrHn2QKMZAkmAuHX6TWuhJ9O/hN4jDDbRhNFq?=
 =?us-ascii?Q?sIQXRrp/OKTVCjCUEXOwtYWpnophaOOsalWkF+FU0z7jRWd0OPazt/+WhHT8?=
 =?us-ascii?Q?TpDNumSACOkbGkqGDvkbdu4Gd4S42adAlhOFuXx7WfdPXHwioWhuXiIgu8CW?=
 =?us-ascii?Q?ZcdfphteeK7ue1NJ7kaBeyOF0RbE+gv91PAaeieGcsNFFW2VBim4hhOucx/T?=
 =?us-ascii?Q?lRaD308Y3+dc+WGjQHqtak9VLystXzJRx4BTPAyHuF85LfNfvLnV1+UB+iBl?=
 =?us-ascii?Q?SfNIKaFqPCKSKoeI4p989/eZN4/XHb6NblxJ/xkeCWlyXI5vf0d/bK3e0RWK?=
 =?us-ascii?Q?jWlD9za8CQFP1rOVb2ghssLDLonuSuZMt8aOPeTn0wSssLlLG2CkTYzzVqvs?=
 =?us-ascii?Q?tgte7LTipmyIj/TvEAooMtxkktsQw4DrRJ6MU7+L0kComgrn5u9FdSpZgmqA?=
 =?us-ascii?Q?WKTHmqTSbJTy60LRNuclQqikhPBKNkcYjpMb2//3ISzs1PHXGI++N7RIOzLT?=
 =?us-ascii?Q?sNTaF9uX1BPtSv7MGij7aa1ahH7mPz64lDvH3MTqSj+P8XlZxJqEVGC9shmc?=
 =?us-ascii?Q?YDKKks2J4FFmZV876dgu5+RR/nIiRLs+aJ3vRW8qkipwdPpZIJvxkcvdURgx?=
 =?us-ascii?Q?8UpJ2HG/zCjDhpSAHPPluwJPz0B8fjKKXmXrPZeXGwk7iqahZQq731g824oW?=
 =?us-ascii?Q?m1INlgabPwbTxl9mcT4SuKs+Xcnne+zHqFJozBi6mq8SPNPAF5o90Uz3NqUN?=
 =?us-ascii?Q?deXIjrrCRBIHXrErpk1ZVdj9sP53XikWZHeT8ZJQ6jK1NVnBXIg4tzdLQ3q0?=
 =?us-ascii?Q?D99I52GjYfyhcp/WlFAltX76pOTRSTfYvfpQh98R9ov76wrgKNb5iWI1bG8k?=
 =?us-ascii?Q?c3uc+v7pUe39OLwQN0X9LzKrIszmTMq2JDNbUabvGPl242yQJkZVSTWGM+bz?=
 =?us-ascii?Q?RPKC0ScT7j6P9cpQKf+nzc1vcQoqTBxUiFripR3ubLU3qWBZsBiEAlrZprmU?=
 =?us-ascii?Q?1Aqsw9fk/DOLHzM8Qeh7bSAAlY4dIbb99BOCZ+ngbLV3XTQyP8ZHUoge7Flt?=
 =?us-ascii?Q?P9UuTDsR0RKJ1YZUYvih1Qpj4se6968quIgsr2xhu0cLZhOGVs0zTeuVRb/m?=
 =?us-ascii?Q?wJ5NMa4KsoPPAyrlMkZHuaFPc7FdWq8iN31EM9QLxt7DINHOQAHNsCBiWgSd?=
 =?us-ascii?Q?5YPKAjqNN36U3n0kgedHR53xtme/dBmQDhAOJ9ucA3uCMinjdWkAVJeZuh+H?=
 =?us-ascii?Q?VzgNWcn9aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6V9aHDRfnsXslrLo+xtK1BDiMxVd0DAL2pjqUXOJOFommcDOfSzoiHbWWkoME2Kj0eHFLmbG9mfK5/Trna9HnFMoggKaZrnW+FEAqIsZE3J129sGLIZZStVMgcM9fopo6fdgNsvTCyYSfftQIiIKxrG3zeTsKmgQOJMzua1A+tncBUCwBgHG3peUd0AUdi2YLx0psylUV8uU91JkQqFBtaLueqIVWrxwNG0n8ZKIc0okIphYhqg5QaWPd7XgAm5YuSLQmopgBOcBoKG665krEkXNk3e6NEhiRsGxNdrzHBSNecKrkT3A7H51GoRx+I12ueZ4SrAHfaKZ+KrxIyMjiSI6y0Fb2eTqOU/XSCHh3uH6nTs6Xz5R9ClF8y3v+2e++vWiowUDIXXnpoqpOX/VfAZr+QN/CVx1n3wPK5zfqriZe+2aOy/rAdL/cKSRrRPdFRyFpjCwC/wCBGPhKYOgR08iZFRodyX6zP5fkivJ0JRDGjtr1PIkIxb01mc1GVXMhkpDqdy4YlvefWSCKClalPHTm5F0JOfd8IcuM2ZZU2ak3xeQhYM+4n8gsfx3ig4RDjXEqLx+Ctg5N+MnIZuiZzaV7KD+Zwqxr+egV+JIKrM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d33840-1f55-4cee-a443-08de6809efbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:02.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8oDZYD59m0E9QLmKlNv51mS6dTyvUirIoUbOzUW/xtnuypWjfMAgBTX/UOhtyEbDnG/Xih8SyvbFHZmSiMZDZ/OoZxCH3uubwFV9LO7T2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5645
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=848 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE1NyBTYWx0ZWRfX7BhaKi6XVBwA
 UdtWKCiu+adRK8A4nrvr8+GEmuC4NX/k+Z+endatF+EyBoRPCEPECB8sbxqkznwvhlTFYIdfd5u
 4Yzjs6AwA7MCvmuTVudwwBmXgVOTpGwc0v2O55l9YsW5JQIRHTHsZuUdBWxDDs4jzUQdiNDHHU2
 nDxoTHhX1z/9UuH1weUy4Y+BiQZecadGIti8n+ffGYOf5UIxdOcLxnXBrx7am9RUeUOWjFw1Dxf
 HnkGTm+raZm5kt9W/hqnXDiA9uuAM6mckQsul1SZZI5vLJPo8GD+DakYGhTncOFT89QpVlVuomK
 1cj4uUzlJiz1xuvcilRy3RxJZgMDKCx3k04vnG5Twhh1f5dotqWM5Mz1cnPKsl+Eo0oV9AG+WBg
 0B3COX5fFhZjGDExt8+lkJ4s5owZPFxkNeEYuD7eEm5BGTxiB+e6OOQX19+8v0XlwZZeuFQB/kV
 neXGoA/GwV5HVF99h2w==
X-Proofpoint-GUID: m0ZBlGL_-i8fYnAnwRSlw7vcfmQaa7z7
X-Proofpoint-ORIG-GUID: m0ZBlGL_-i8fYnAnwRSlw7vcfmQaa7z7
X-Authority-Analysis: v=2.4 cv=KLNXzVFo c=1 sm=1 tr=0 ts=698a28dd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=3SbOCVqAZBhdHzq13KkA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 517b9265..ef97c8d9 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1568,6 +1568,10 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 	char *globpat = NULL;
 	int err = 0, i, nmatches = 0;
 
+	/* If the function name is "-", we're done. */
+	if (pdp->fun[0] == '-' && pdp->fun[1] == '\0')
+		return 0;
+
 	/* If it cannot end with a pid, we're done. */
 	if (pdp->prv[0] != '\0') {
 		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
-- 
2.51.0

