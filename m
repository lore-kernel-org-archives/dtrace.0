Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621433A9DA
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768367401; cv=fail; b=iTygXPFwrQ7i9o1FCWD7/KGg2sK2r8SIKXZAwI2iKIgdtbAa7dv6A9UelPyMIXEsPldijMb/RNjS5d2tXDxOIXoVW74sgM6nO10Mfj+L85uHozNKqzN4LyC7+WEW0fWVTonOBYLEpf9IhZhDTzJs6dCJyyMKuk6PRmcY9czrWOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768367401; c=relaxed/simple;
	bh=Yo+8TFxxg44O7rCFQ7xJhovJ1qLp4cIC1534pAw5pOw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Y0Tx+LiY6rJGd8AFuBsVI3rsK8QqovTsVF4emTk74c7NxiN/44kKCrTE4JtDLLmKeJjMB3WVX3Tal7LWSp42IHtMBOxKjEB8qmMW4cigNBe7Os+wtaHwWdKb03dj9aD++LJGvY1nN+Fe+EQNVaaqLjrKi1sItqLRXjmeJz1HkbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UuaG+lFH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cKyneVgp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UuaG+lFH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cKyneVgp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFp2lB2395200
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 05:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DqGZqCCcs7xOOLRvFSQNHxCW5noqQei4Pa6XB5zSIho=; b=
	UuaG+lFHAmUE8wB5hTJyeFttZoXZbK7EHJCrYjzJ54moKZtRGwW88YYHUYhK2bI7
	OQmeKIzKdsSQCqo7gRlJdjgHdqjUAMg+NXV3fUkZRftZHJU7Nlhj0/5NrCUdDpJZ
	0Fs0PCGf2cQy2+0eRMAnvlnpA7hcTBfqEFWEayNoVrLTeaR86Zm4mncMVEAmfdMI
	Jr6ayMsG4k65HPHWm7QiHnPD+13X1dkQRikzO3Ppwc4ZfsAsz2pxtcsMOM+KJ2o4
	aWQuyIcrbCzOwgtXvxrhEPWdkEtIqfAytBAP6l/qv35JSJhUBKCZqiqnIzgvTan6
	033xHogKsOwo8lLXbRL+ZQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq54mc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 05:09:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60E3iKsO029363
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 05:09:43 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7kbtm6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 05:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS20RWj5Ldl+CE8Vw0GwZ1JDgCtUth5oPPh7/TLMrVu4xbXA7wNtucokYymVtjVxNPScW4BfydYjSHMzIMjEYXWhP8zfWTg6L/xYkzKTZAqfDv5EZRQZA0wbPd0EsC5N7B4XyDMH6BHDhR+y5V0L+C3VmG9lcjnztGUjrBa/IyWEIY/PGuI6ynz5SpAw7MUQbr/IUgKl1YkEyaX+n9dc+GeINSCWnB2jckVcGY3iutKHKYVcA2eYqlIGt5PMW3gOK32QOp1K0ypLQ0JWSEME+3MtzbNhpsQ1v4h0DzNE6VwtVWWowECHwFDxd+yU2HyexZgo2Zn4NckyV3kGrg2VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqGZqCCcs7xOOLRvFSQNHxCW5noqQei4Pa6XB5zSIho=;
 b=QuxgYiRl5rUpB2WBTb22eEPU7iPZMDi4rXFHoXfA3orU0sqM5iYXmgg47VW6E7P/deetxOLip4PWcspCHDpqKVbbUr1BNuUiI1WjHMwN5H6Y3bKGBowdkXbvxKBDMR7joHDG/Zceliz3cEs0MgEwEZghh79QYru8e7nKc7xIiuNyGlktGkTdz/IUMyo2JofkPd8jdwPcDLwGsjMsuZBpK/9h5tZMWpYarHNRUTKM/5wy4u+X/TWmWjxwIooZLACrTSDol0NG3UpelZbATpPE+4JElmhaW0n+e+wt8o5yhySMssd4dH/JM2AfM9EMRnCVMKcJtGUzzf47sctAvMBpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqGZqCCcs7xOOLRvFSQNHxCW5noqQei4Pa6XB5zSIho=;
 b=cKyneVgp9qpHXYFNMCQG4Fz7BszD3S4iWqAKRylBKTjAsnWw0/+ljgt7ggHiFU3OfpMRIVTCt9n5vskmciZFTV3omfI16EJvML8ajBq3lCU483bIBrtB487hQPWpu0gh7nHA0YV37TY7r3FdZVL+pWP039W2+HsT1hA2pgwXvzE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB7047.namprd10.prod.outlook.com (2603:10b6:806:349::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 05:09:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 05:09:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Add support for printf formatting with non-monetary grouping chars
Date: Wed, 14 Jan 2026 00:09:36 -0500
Message-Id: <20260114050936.14847-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ce9f10-f9aa-4f33-d282-08de532b1e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b5qdBwjNWE1Ath4mZ331dffkHagZRU4Ae3i3BscSyANo4/Vc6bZ9H+7pnlFh?=
 =?us-ascii?Q?c+cdompA2HSbaZh4WgvxcJGGUES4Zluz904IJlqKt/miUTzAqC8svmY+ex/+?=
 =?us-ascii?Q?zcRiWhxCVuWp4104FQemjawYNDgACQTifh5SyMvgoOyLcaOsFZP7JzB6K1Lj?=
 =?us-ascii?Q?al8JsLqNMfc+DzJjzX1dbVntmb+lYzD1Vl6anihcT9tMWPvBQq8H7AFDb5Rd?=
 =?us-ascii?Q?wqgHRt0qDJOA4jicqsy8GXbobnlu9oEp9VOHzkTTYwuYRqC17/UoAqfwd+IY?=
 =?us-ascii?Q?atoY73kdIcsmnKcqkUZSkEN2pITKEj2FiBXstM/VvVP6AQ72wXy21ERG8bpg?=
 =?us-ascii?Q?RU+IQzz4k/89mefCe/kBsULbqFJm44mOsr7l1onLNt3zB85+x1zibIXePzC8?=
 =?us-ascii?Q?fFwHn+1/RRiMBQ1ltpm1ccqijs/vxCPAebXvjX+56y5RPhmCv3jzlbwigw9q?=
 =?us-ascii?Q?U5pJmj4MuanPugkDhjn6c2TDjlJoMDQ3ixkXzmT4VKUsaIUEbKYXpaXfSpq9?=
 =?us-ascii?Q?mdnRDuun6NUv+EidUyLMxwK2n4YZRgJN9ML5ZPzR/pfy5LG/pd9jVLgUO4c7?=
 =?us-ascii?Q?oDK5JZIn5O80kScvHL4dxWBYQy0UPFBwdoBMeBYDMytrbdl3gjZ0aW1v30K+?=
 =?us-ascii?Q?AQQe9/SA8df7nAx/SAYP2Nrxa3TY7Q96MhBe3zddScBzbviO1yhTfAL6n83G?=
 =?us-ascii?Q?MfB9jJoq/ogJcwfKB+gIzo4pB10xIjB8GtVbNuuRlDYDsPyF3afd17l5a96W?=
 =?us-ascii?Q?yO6dzylc39OZjxT7nidN+Me1DCOXgc3EPkDhkcmR2On14n4BWzSNiwJfMIyG?=
 =?us-ascii?Q?MOxr39rioKw24K3Re+Lvfr47V2+KXkR5zNsBvdVoneu/2D0kRcNHAlwkfNYr?=
 =?us-ascii?Q?Ca6P5OzfTNZoyzO7kU/nc4Rc0GAUZWF+PSYGfRH9jdORceB4Y0RQ5wX1fnDi?=
 =?us-ascii?Q?WIuo0/6RcBKGILQZTClmkUFiIiOjFLk2y/b0gnE8vjuFs9G0pS/hiRLUGuZM?=
 =?us-ascii?Q?CCT3v3qImQQOqjAo6eAOH82xt6oTmx41UFiQMCaXexU5hV2kTGYynKGcO55+?=
 =?us-ascii?Q?0QWIaXKbM+Cl9Ioe7QM+jKYjGnSjSN0hmkm2kfKc6/vuYn1fZLkDRN5jwF9f?=
 =?us-ascii?Q?lCbmGVPLYIrxQ5GR1CQhR10r2EDHTgwVipN4bltu6mT83qiA4YmkLCNXwEXj?=
 =?us-ascii?Q?vk6vYadwbsdhY0hU2/9wvXF/szPFDQn/MhEr6nFKup780WUgmdIpcdg6BP6J?=
 =?us-ascii?Q?02zuWobJXM54/NnB3FghdsIbx85isbXJ9IRikWur8H3QVCv62Md3hpBxatX9?=
 =?us-ascii?Q?5UtgfQFsQalZVf4TmlWo6v+XtV70LcKZPATlMw1rHcOQnYMsZH747S8gdFR9?=
 =?us-ascii?Q?km4lmhU/6u+yvzoKiakNWnxHKXY/CR7fbVqmLxFedGfmbVr5Pa/WOoOcAYf+?=
 =?us-ascii?Q?9xtucSHkriTskYfSa4G9Wl5XpN7foOWkL9/f3Kfjkesmmbr/kzhhLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0NQ18hbYju/AZAMr61wmj7hk09wSX2pOt2I5vJRWwGqYb7W21h3YFUvPRxBY?=
 =?us-ascii?Q?OjJ/vY/3F8Rn39JTxBr236YlBXAg0+HvyeQzo9Kh6bO3Txs9+5nW1zd13cDI?=
 =?us-ascii?Q?b1zDDUC7iEgEVqKwiqUmwDQjnudzaWp6w0qj0qG3lt5l/oOQ3q/NiP30u8BD?=
 =?us-ascii?Q?vcSTORO78dqJwSMN3YAckzOtaQ0dWEqkJ1mBu0TfCQ0QlVtB3snnQ7vFlveR?=
 =?us-ascii?Q?QM5l24y4sF0aqm3sXls/0Gm0TX8gVwzkSGKtJbzgc3oZCsASPc4+HYrJ5fed?=
 =?us-ascii?Q?I0R7LXoSwU5uy5hIlROc2CYh/G+AsYX0bKadH9PnYY0GcwtV1nheRF4RNzV6?=
 =?us-ascii?Q?qBhHDrfV4PJ9/rSL9wqM3m2vvryEmOVNbH4PDyt8Uv63Pg1RqLz6L7BOx1kE?=
 =?us-ascii?Q?JTsWhE37CY+MfWOSYzBAajFl17gzHqYPR7VkXA3K/tdDSqrTpr7aP/QvZCJa?=
 =?us-ascii?Q?f+C0PceEXGe0r+7KLOx4erIu00c1NbsowaHDVM0JS+Pfsh6UK4oH/FJ/rRLu?=
 =?us-ascii?Q?TSosNRDpIJ/F2vN9ilYFmTJcG77WThUeKzcajZft3AAihgqwdOB515RBuj1K?=
 =?us-ascii?Q?uQdNpi2fQD7bFEtayUlVOqlVwIz2RN/473LU46bPiWEOoc9KHFTCo4e6oql1?=
 =?us-ascii?Q?W0zkrj+ziIViMvUDVsEzYps/FiaGf+fOAqZEmvjmkg7QDq9O4NeRllxO9k52?=
 =?us-ascii?Q?Vc8jhyiItZ/NrA6loCBCykJkwZP8oRctreeiHRlL/8ZzwSMPfX2fkt2klOSF?=
 =?us-ascii?Q?OhpDKsnv+21Y/m5lJQToZEAn9JH4KHyLHO16MrEOpyMggYnu969zuoq6nfTn?=
 =?us-ascii?Q?6Zk91pL17yf2Ia3xKcs6wcSz3LiAZR1vKzmOwbADHtbux0YjBiw0lcDYN7hS?=
 =?us-ascii?Q?/cjXS1873Qx6EVXiNIOLmuhLUWkz+FkCP3nYa8CLwBru7PlUP/uA4KFTgD5q?=
 =?us-ascii?Q?Ur2PvNToK/2GcAUUWeTDT0FmENQu4pXm+5yEyIXQ7icLmKTvBfRwk5A/l/SK?=
 =?us-ascii?Q?IAmE++GRxD4YxnRt/L5dry8gMLQOuGTLdnjKa0wAdetawuEUMAP1amoXEQGP?=
 =?us-ascii?Q?ybu1NqYWuW0Jo+5nZCUSgz1VM+Ksxz4Sfy8BJf8gtC+Ur5KuEUzR9eDkPGL/?=
 =?us-ascii?Q?XLF/a60LvuPTe+mYVwJYhdJJI8Avq/zm/imTD0xl9hg+6D1zNMDoTMNxXZFg?=
 =?us-ascii?Q?uSz5ybb5+xbZ+vGw8PZnAVI4i6FwDt9NnIK5bzha8r6nNz91PZXENIjqEKJB?=
 =?us-ascii?Q?PPDBJ5KO72avVLYOFuaJn6H9+tZMAnBsga05NW85M9yMlV+02IBJaVYn/42U?=
 =?us-ascii?Q?igrsQsErpb7ObHWQgTOGIoA79YO3siDygNlroh2GhOJ5sha979uykPYY5VSi?=
 =?us-ascii?Q?a1GtZf2F84DT4kYo568QfBhY14g8tlRmtxgnofiQvc1FQhpnaq1SHw30tOlq?=
 =?us-ascii?Q?qgSCH4BpWabGCjIUMr+IwIlL676g8CmK7AqbNYihnbWTdPhayvTQrl1Cdf+C?=
 =?us-ascii?Q?sVEKEVbUvdIsm9XLQL0aX7a/jT1c3gDFErvZjVQ47p6abVcf4IhoBxfR5FdO?=
 =?us-ascii?Q?ktcD1gtXajM2Hdc/WpTfkthDGc8SaLsXLq4X7FwVQLPAUkSOjLOGDItsSEfq?=
 =?us-ascii?Q?wI8jCxoydPnmxNoQBkSGpDKSWUhc+MWjyv9ymnXAYkXHo9eKVFBuyUTDIuCz?=
 =?us-ascii?Q?8ZuCHk8edXsJ+Fb1Zy51wglVGCotbeW3xtq67Neaj+s56PpM74s6wKmo/j8h?=
 =?us-ascii?Q?WoyxJebyrg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	agDZHBRSf9Av1fgHXl1iUW6KOQyqiTPQJYZ8gqRvbVxmG75ERK80izFItukyffuJXQ/W/xSG6lVX73u8q0O/xrV3AcgRw6BMcdB7My4bKd0aPquXrs2tvG+/1Z1c7nQG21TnHbbd/Z4sumQycNzUj6rFHY7FEijHOQB2C6yJE6lpi2KZZa68urbCVSoYwB3zW0S2tVNIsiHSL4UqIQE7Rf41Rn8K1vGiOKgJ4TIkCS5qQr1QBzbHJt0cWdYWN9T8BTlsBBMGS76TZxC1qkeRQuHtuiWVD/1CFui3Urm4PKFFTWtEKKErPhCySMFGaNym2uDFKFe2cCR4RDL2RvWSV6V0AYezj98SUR7JZFkMOBzAQs3Y5NgMNptWE69xXnTzKVB3NA3RW+vKVsXlQfCvSwccytRYVrUXUnZi9teMdAd7sxvwA9mpjI87htaKI1MkDnpJIhKqKjs+zhwGfMUg1uHsoxJCfrEEvUqQJW3ovofANMBdcol+R7EIyOCXJckL04bt4byEh14dovFHItG6s4Mybe6iFrV/n6u61BMJyaZWvFDmXwY4NZsWNcM7IkPatV4UP7lC+9/4GyznuaLPB1/t1+fW/VNuzX8nOY8bsD0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ce9f10-f9aa-4f33-d282-08de532b1e94
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 05:09:39.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRo9IQSWXD5QdvZfsRG/LxSHLXAqfgnnmOyCaddUbX+MQmNoQxjkawDkTnNLNISwoVvAv5sULzVaFa31YeQ2Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7047
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601140037
X-Proofpoint-ORIG-GUID: ZVpcQAP7rF78kHS6q5vDAO2ur1FER7V1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAzNyBTYWx0ZWRfX90dSAningrJw
 m+OBMZ59uwdhgkEZYD/PeB6h1Z+8MUzMcCLw9fct5zRR1w2f2+USfFViUm8Gtf5P7cM8e4aIBP0
 L0jGL36+qdfnGnisMd+v7rYLW0mQ5AmABkZDuOOHxpHQYxHVER0SNP5g99xOyqAvaQv6TBBM54i
 9W4dJJXUcJ3ricFI0v/TrO71JDnflTOeS0R1JldOmudTmH8kN4lDyKN9JrYUQMNqXK5/EYisTXC
 rkqphrqnox9XQ1tFcpPELCPQvOnLFHnTkZKp1Vhs1rzvFBoumnWbgQTl83aEqB+kejoOWg4+mXC
 eNV0hmcZDJFSyrxYGyxoUHJ2bsi+VnU6c5yvhDhMqhGXjoaPGF67A4mP+zlin9J5xdkGKQzr7mQ
 9jA1gCgVk+v6cqPYamzEbHUANFc0Km2UafinxXQWyhbMQJLfEhOwPxKcK6MKNTxS+8O3BzNDm5h
 N7CozYi1FdboI59s4MgH0VRfEV2NiLuvTcO8AcuY=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=69672518 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ARn5UG5839AEHCsK-vkA:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: ZVpcQAP7rF78kHS6q5vDAO2ur1FER7V1

From: Eugene Loh <eugene.loh@oracle.com>

Non-monetary grouping characters are used to separate groups of digits
in numbers that are not monetary values.  DTrace used to document
support for printf formatting, using a single quote, for such grouping.

Add such support.

Orabug: 30430270
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c                         |  5 ++++-
 test/unittest/printf/tst.grouping.r  |  5 +++++
 test/unittest/printf/tst.grouping.sh | 29 ++++++++++++++++++++++++++++
 test/unittest/printf/tst.grouping.x  | 13 +++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/printf/tst.grouping.r
 create mode 100755 test/unittest/printf/tst.grouping.sh
 create mode 100755 test/unittest/printf/tst.grouping.x

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index baa73e9d7..6cd7aeadb 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,6 +9,7 @@
 #include <sys/stat.h>
 #include <sys/wait.h>
 #include <sys/compiler.h>
+#include <locale.h>
 
 #include <dtrace.h>
 #include <stdlib.h>
@@ -924,6 +925,8 @@ main(int argc, char *argv[])
 	pid_t pid;
 	struct dtrace_proc *proc;
 
+	setlocale(LC_NUMERIC, "");
+
 	g_ofp = stdout;
 
 	g_pname = basename(argv[0]);
diff --git a/test/unittest/printf/tst.grouping.r b/test/unittest/printf/tst.grouping.r
new file mode 100644
index 000000000..077a0b7f9
--- /dev/null
+++ b/test/unittest/printf/tst.grouping.r
@@ -0,0 +1,5 @@
+123456789
+
+123,456,789
+
+success
diff --git a/test/unittest/printf/tst.grouping.sh b/test/unittest/printf/tst.grouping.sh
new file mode 100755
index 000000000..13b953758
--- /dev/null
+++ b/test/unittest/printf/tst.grouping.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for mylocale in C en_US.UTF-8; do
+	export LC_ALL=$mylocale
+
+	$dtrace $dt_flags -qs /dev/stdin << EOF
+	BEGIN
+	{
+		printf("%'d\n", 123456789);
+		exit(0);
+	}
+EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		locale
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/printf/tst.grouping.x b/test/unittest/printf/tst.grouping.x
new file mode 100755
index 000000000..9993fbcd3
--- /dev/null
+++ b/test/unittest/printf/tst.grouping.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+if locale -a | grep en_US.utf8 ; then
+	exit 0
+fi
+
+echo install glibc-langpack-en yum package for this test
+exit 2
-- 
2.47.3

