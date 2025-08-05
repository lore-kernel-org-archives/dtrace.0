Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1A29B8F8
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754420931; cv=fail; b=bIUBtcKmLsyShMnpN+9piyitPskLHpl72euQ6S3HMrZSpe2Gp8zo6NWA0EkaZOZtDKNanHG1qJqR67HaDcfdUYDydNUWfsBniHjt9xcrosgqMp3c09T3VKnHEvnx/+W54GVr9ppJ20C2HpuH5ulvgOJSaRIY/kscYavH1ksV6Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754420931; c=relaxed/simple;
	bh=xgog/vYapB/4JRBt/J1gS0tS4NzqQfIywlD2wwfqY3U=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jG/z9ci+bu0Y9ZvYaB1OTekfwXCs4la0JfZQ+ST5pxbw8tCe4ue/f25U+9FHVuUl6oAluLDEsLSPU2WDgOD2a0vI8hM9kahs8/ZcfTW1ju6O95OY1a6BMFTAIDat19btc8oDuC4wsV22trYup/MepXQdor+Zzufs69jMgdR6gp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rkx+FhJm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cGyys/HO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rkx+FhJm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cGyys/HO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IuDjK014417
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 19:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=hArQO1YDsqLLAEZakoZ0Q4A27/9AwXHsXVSbHuL3TAM=; b=
	Rkx+FhJmMTO+zrPUtqppeqmnGrTqS6j/AQ8CIWE3nvjMfHN1EteiiSa5aqzW8IjT
	bsX1xKt7RLfsJbmkwrGqBUhmOooAMF65aRgU18xXz0YnUJ116v6FbkjlbDLfKxpV
	mZjErd2L1H7YqwpEtCoQTAzsr2TC5pXWLyaJM5q+YmAHp+Vu1PiOOtea5uubEoE1
	JIgX3dQBfFp3Kvy1ikIVcgyinbob5L/w9+fspelZnv4djFR68xumzmQ0LTW4kRvc
	sFcMGeEbsx+YAYzi0ys0ajym3mrabjLZXLWg6xKrFdX6SgJw71k0yAXPwTzf5BX8
	yq8LMn4J5WTz3dM6JDFBDA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf03q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 19:08:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I48Li028978
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 19:08:46 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk2cdj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 19:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZOdJ+8dzDfs2HgIDAWFEuk/Kd6NaV9N2Cut5HaBzEnoBEfdpbhiU8plI+QSOarnAozWcBt4eTBRMOhNb9oBP82Ma24z/sjCGJgSALaMcBByoVWqgGU0tbkR9esnL30ctS3TRcbu65oLc43eDpDQ2SuMFjjUqvsGRPd8x+l9bySzwO0LXrXKaAMJ6oCnSm1yJth2xJGJ8sBcQKc86qo6bF77KGcKGBGJC+f+yvwoheh+feT5bS+zVTFAhYh05vE2TUfYqGGd0nTecyGzGcfOt203c8sDkaGRqY6lfPF7W+u+7KFp/4DtT5ASsx91yNTeXCTA7m1srMh7tJFa4RVo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hArQO1YDsqLLAEZakoZ0Q4A27/9AwXHsXVSbHuL3TAM=;
 b=fcCvUJICaPaQWFyX/vEa2t4aaqSL88IRbzkXB4io+chttkPKI5YmfyzuJSAPoEmhdi8Tatcgkc720loVKdsnraO6B6nn9XKjDNPJO37CTTARiOWE2k8ZUoDyB7Z81Uf4p/gIOjsRSraYqQe4FWcmZOxVmQ+m0YxJuTj7XzqJnf9JIXzaSTds6NZQVCWt4aJKt2B3Fn36xZdHdA0wUEzMHTQbEKZjlfTgRdokUXWkP5lgX1Gmx86FjBUIFt8ouZIeC9pDZTDR94tbgI2dxMSq2Aldgw2Luq5tdrzcwiefN3S3hOu18BcDw91q38nYSgMIVyH57AzmV1mMyOk5pnFfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hArQO1YDsqLLAEZakoZ0Q4A27/9AwXHsXVSbHuL3TAM=;
 b=cGyys/HOAwTC7RixnZQw4UXM23j/ektLSakKyfh1h47rJWwMK+6jK3S2J3V7sJoDbNf62GV1gWDxFpvhXL5uQSGDPuF69uwP7WM5rQk8xRwCPnYoRzornEU2Po5BjH/tjgNd/nMAXKo9zD5pJyDEqKptC3wtnOr4soxp7qyq3hQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4321.namprd10.prod.outlook.com (2603:10b6:a03:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 19:08:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 19:08:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Make sure all probes are listed in default case
Date: Tue,  5 Aug 2025 15:08:36 -0400
Message-Id: <20250805190836.18761-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 07833f7d-a4ae-4f59-3ae0-08ddd4537ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QAVBTmVzMq+FDTH7zAQkO1IZf+hXqR49F3QTkw8+j7JdrAe4hir+Y+6cEHv1?=
 =?us-ascii?Q?fhCZ5FjXoB3+Qwlkafhnq8U8oeZQZ/He2d3QJ+4Q8DDmnt4duCBUjDPT5sSX?=
 =?us-ascii?Q?DlhzdBYrpki1zesFdo3iwzvjc0i87cHv+5ayxag9gBwx+LUwFKAGAgW/sj8N?=
 =?us-ascii?Q?iyuF4FZ7esKu/emDdNrJRhT7/07KBxLON2zEUF2NHwzqyAh2RnuwR5new4Af?=
 =?us-ascii?Q?EhX/J8zOBUTUI+mAAffMdgRKVDmZ26FE/36MVUxn3rvOMR2qK4evYbCZy5Va?=
 =?us-ascii?Q?yvM2PLUGnaHvqeM5aIdB1+6XM2X67358J9wbJFp8w7ub3XvXSwSY8ZgLEkmq?=
 =?us-ascii?Q?rMbICbURZiOH69uUhZkYSrHavpgmsoECx+kWUNX5IXkrYu1ZfIFWFftHV2D3?=
 =?us-ascii?Q?hW05aYhlJxgVLeT2qJ2h9zRcoqcXq9LAbs/jkrH41hHDFZ5YUVi8kvL0TIW2?=
 =?us-ascii?Q?Y9OhkuV/SZH1PeU04upmjvPEV1xntfD+LA5YWfRfvl1mn/mBuJAy16AmQamO?=
 =?us-ascii?Q?X6hGjc4VehOpVYRZyVQm7Zr8vAXRRY5rPNd3apCfe3f5WO+9d2zlFi615YLd?=
 =?us-ascii?Q?9IuVB3p7apLHWDguyAS8fv6f9nk/+sRy8tZQh3DD7APPtwDRs1FZE+vYQ8dI?=
 =?us-ascii?Q?6WQj9RSlr6mLtgndWPCdfeE4s8/8WmICHk8zr7PkR/oUh0PFFfyEtR3Vu75w?=
 =?us-ascii?Q?se/Cuv8eKhmFfrZaiFAfluKLHkckhZAZ1yK4UkOKhN5UUBsnM2BARynbp3+x?=
 =?us-ascii?Q?Z6+e18DM1jkQHPWkye/oEmBGpg1lKuNjA+Tb2mTpAnIRtGBxic9EUJH73W6n?=
 =?us-ascii?Q?XuRtxSocUTHFWQi1HYxGOWxKfmk2qaDkQCxoVuJuKyKRRfzrS6juthX/pm6V?=
 =?us-ascii?Q?QwdBZu16Hm0XdvqO2eVBhKptSFkFKrU7Cm1Q8pEzkTTo+0s4DPE0Jy8UY3fa?=
 =?us-ascii?Q?w+Hu5/22oj0L7IcrbvrfzWSYSJc46Nd/RarrAphuwmIyN3J0sYPhiveG9kpE?=
 =?us-ascii?Q?sCBQb26yD9nbiJkVrwenwfJGnVWYVnanSqNHNaLPxTWQ7C1ouHHTxdikcw+Y?=
 =?us-ascii?Q?Q25/k0G6J2R33ej+b/4G681xs07QVphqvyO+84lQj005bsrBxAxmwuJzq3ZF?=
 =?us-ascii?Q?bSXXTyXsC1bO3AnUGCWPaPAVmmsHlrgwoukPoerzRkN6e/xNKoidF9ObmyeP?=
 =?us-ascii?Q?blrTZgQZxH0oFYobFlv9IDDvyWGatJ5Dj5SjTF9Umpg27HJmBYkoRy86KzIr?=
 =?us-ascii?Q?ATpj5OS4QWZ0pebEVcCGkpfEx21yklWrAW9DGCMgAI+jANU8LWXZlw6yYJOg?=
 =?us-ascii?Q?Tsz8HmN3kXiQVcWnzXp8FYJMl8UtwaCI2EQHRY24a1VWXzzzDQLE7BomF5mD?=
 =?us-ascii?Q?qD5yKs6H0kc2iAs5Y8WPyq0q3bULgX5h8fmwrturlB+X0qSjzZco9geMs7HB?=
 =?us-ascii?Q?4UkaRmpO/VY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?foW94n5+mMgPKCLqD9fyiBD2vJYKLevQVVLklU9u/p8OK53L2/PeIzNj3J+c?=
 =?us-ascii?Q?cotW4st3JuoTe7HFv0TNXo6SxoQHb9kSLpGzCHLhkuoDz2FjrIyMPdBMfTvX?=
 =?us-ascii?Q?fv1dL/11VLZLmHhBj7oxgDvgy5/qkAU49kpjRINHeeBkhlxtHWD5IxZQ/n8E?=
 =?us-ascii?Q?Gso2NuJfVc9rWCUZZLNXYucbjwvF/V6FI0e504h3BJKf6LwC7zfB00+/Dp+A?=
 =?us-ascii?Q?0Kk5iPzXKETG4vYFsAyf08gfB8Z4wSiqShMcCxCPNL0ySkNC/txhScFomp6T?=
 =?us-ascii?Q?bH4K/LraBYOM83NHrFS8dg8609kiRMv++6Rw8JbuPc9jiUuQ24guT4uED2MI?=
 =?us-ascii?Q?pJJAgLVLFmJplufukYAB40V+gXbdWpqDUIqdy3Z+6CQMDta4L5vlIMquIORr?=
 =?us-ascii?Q?ib27LeEQ/MoECzZeNl1Nc0QE9eYbbdl/jK1J/UFOnKVogIR4ASPK9bDKiVLX?=
 =?us-ascii?Q?29IvJUsE4qiEST61XyQISip6kMFOrgosrPTKB6N13Mg9nTNl6Ylx0Lh/Qi9a?=
 =?us-ascii?Q?h6BkUHXZXvrz8wfEFjvZOXJ7olN2P2LVZAkby7b5wiLB7yA9rHf7rQ0aREs2?=
 =?us-ascii?Q?nunxtEEbhErQQHtQ6WHh75dKA/sKYbZGwh9TAMZlKl2iWi9jIX7Z2MJWOdiK?=
 =?us-ascii?Q?X92Y6MsLe28HRM/+e71JtLNf/mD9VaRualLR2Dp4oMr9KmIzTCWuR9JAD3qr?=
 =?us-ascii?Q?x1hLycEABuuqM9T6mke7r8BpKXDCzU2VhM6b4jN7QNN75MykL5lcJnDl8njD?=
 =?us-ascii?Q?aOS0h3J+P1SSHDm5iDr9UFfIioFujjs+EeP5PGhErbkVSpACy1+MhJ2mAejm?=
 =?us-ascii?Q?H5U4iTPytzRPi7MduIuxZf39KgNDqX7Y6SPsckchv0ooHQqHKfwFZOUcKxwT?=
 =?us-ascii?Q?XLbNUm3o0XeyLFLYUzfqyuhW88Qe6FX6IlZ9JWkfzVXdES+2WR5/E7tmG7WZ?=
 =?us-ascii?Q?jOxRYui5tUePj3ee78CYT8UEpohwVzR2s1+Z8YW5YDvDCY6K0Zi3VYcyRuwU?=
 =?us-ascii?Q?i5lvWQxKoWf2jPiJED6VgBhMBHf3H/58cO4gt9s7nqeV8NOL2wnRMErc1NiW?=
 =?us-ascii?Q?ZAqK4FOyeB1QS7HJJAEDKtS6njd4MQMkxLEs2n6x6i7OynhsVoT8LuwhiKs6?=
 =?us-ascii?Q?bw23XEGO6zOGObqmsUd2hgUDg/vfNsdQy46LVJdYi2SiPxuHrusKUQXpxg6a?=
 =?us-ascii?Q?oOPcrVLoKA31BLYjclJlnLSR3tPXKLZlG2BMMbeIIcmB0mDAs4g+LKwTZpP+?=
 =?us-ascii?Q?q5FKMCy+f6dw8uj9QIOhggcaUpxrlQthJHhq2MzUeG83RcJa29kjke5YCxIp?=
 =?us-ascii?Q?vfCqLrVo40z46yhPpj1Ow0qwzZNSmzFp6QMgxi7ljWm+vU9NcLLCnHbPmx5c?=
 =?us-ascii?Q?b2rAtBI97Yq0L9xrtr/upk1JOc4RKDAiz9UUQJ+iKTAC9/LGOyyFHDE6vnXD?=
 =?us-ascii?Q?ZoQcElnM/WWtIQkEHPkcu7VCiNOXK/fWtJAeBS0GOYeMBUV8oWs9qNJK/wBO?=
 =?us-ascii?Q?H+hfPFT5daIq5xEE5n42rSuORfNftFUTQv3laS2PzFDhCMEN1eawojIEWSq3?=
 =?us-ascii?Q?mSi1YEkbKr8jEzMt4h3U/g8/iWDCDSZ6UKIOKNWK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BXR8QPKhmoHIkyj6hSIZ9Dyjs+egMFu6e4AavnreYVaxuz/B4ZQFTBgz1z3NZxz6IFAMeBOC3l7R+D1KiXI3fhPQBaXw0KMAyuvDmdWdmFrgbSSUHgRXGij3C+Z4XcHGXuUMAkRhvSxE7IxYsclBnjWOM449B+7pZ7KbKrqDdH/QFG51+sM6I6itDOhspiKlj69VXX0zvcV6GncaMDvXYxkMgyPUXufdgTkV23gZjoxc8q47+AAokVDyHv5ga/7GijfNBMhy7zV/J8lJUGVeiMyepc+thsJARKYNOiCmxunqBtW93nDyCeJKQAhPm5zxklfNwZZ826VHvcyasmiursDY/OphxfmQvAQUxNkDZeX6rF9na/eFmwiM9ZqyqPSoxZ9pCNZxI+lSyl9S74phcCDC9YsrPuEH+PzR1jG8LAnOzweZUU6nhooZ3pXKPs0QVEf1keIu36loi3Z8J01WCdkd4hakRo0w7QuMKaoYRUqj2fPvBFlzF1eaHKdG9E/UD0AybzXg3MZPux8oPqtzKrJWmFr+x0umrOzBT1ajkfnTvzMkmqX/eu8VcnQi/Tk9yEssF43djZsN3EybOZjdS0HUzSIjCZesFguvL+0j6kA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07833f7d-a4ae-4f59-3ae0-08ddd4537ef9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:08:43.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFcNRzKBDb3gL2iQ1M5unY5JRPRQR4hrMxGyKLlb8Qqp1cUPSlVF1Ik+GuxCTuxKJ+FtvFLpdv5VBcuv5NioWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMyBTYWx0ZWRfXzlRUqAfPAhos
 8Qs+pPEJ+Kf0Vk9WpV42JPws3Wg0divmpsZn/S6ckDp+INnOfUarLBF1MdAFZ6f7DlsNdAjcJt1
 9UekXqPcOhYpU/yuQGcb9IhkavUy1K+sNT2fvxSuQ3GGHKOc1Kbfj1ZJItk/z9uHYSckQIvKNh1
 0gSGRsSs1izjdkuFSx8H4jSTU6JbQgnrmLltq2khN4vVeF9M+yNQXJOPD6o37SxS4KuKP2xEwAE
 EIX4upZtcLL02g2SbtUhMIH5qPA//gUtbLDEUCJCHFhgRIi2z7PPR5d9olBB+ND2SAOxWKBLc2n
 LKB3n2sPlgnreAJWrTEAN84A8pvi+cjvNobeOPX+ZABonUd9fceQu1irEvXkpd8tnzPm5hENFR/
 qSf5Zs5Wn37PdwU3n9qtr9HgaM2Du9X09w2tN3LyMmDzQBbL3B5g/YRHHNa7Cx9p+XOxFhfW
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=689256c0 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=V3SoATIoaGlUVTrDMlIA:9
X-Proofpoint-ORIG-GUID: 0icn-iJrff5pbi5IJ3FARHOX93BUo6Bp
X-Proofpoint-GUID: 0icn-iJrff5pbi5IJ3FARHOX93BUo6Bp

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 INCOMPATIBILITIES                           |  2 +-
 cmd/dtrace.c                                | 11 +++
 test/unittest/dtrace-util/tst.ListProbes.r  | 14 ++++
 test/unittest/dtrace-util/tst.ListProbes.sh | 83 +++++++++++++++++++++
 4 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbes.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbes.sh

diff --git a/INCOMPATIBILITIES b/INCOMPATIBILITIES
index 035c3675b..bf55019ec 100644
--- a/INCOMPATIBILITIES
+++ b/INCOMPATIBILITIES
@@ -8,7 +8,7 @@ Missing providers
 Difficulty: Medium
 Likelihood: High
 
-A number of providers are missing, including pid, fbt, and net.
+Some providers are missing.
 
 
 
diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index e0e778db0..ed517abff 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1443,6 +1443,17 @@ main(int argc, char *argv[])
 			list_prog(&g_cmdv[i]);
 
 		if (g_cmdc == 0) {
+			dtrace_cmd_t pseudo_cmd;
+
+			/*
+			 * If we are listing the default case "dtrace -l",
+			 * compile the string ":::" to give providers an
+			 * attempt to provide probes.
+			 */
+			pseudo_cmd.dc_spec = DTRACE_PROBESPEC_NAME;
+			pseudo_cmd.dc_arg = ":::";
+			compile_str(&pseudo_cmd);
+
 			if (dtrace_probe_iter(g_dtp, NULL, list_probe, NULL) < 0)
 				dfatal(NULL); /* dtrace_errmsg() only */
 		}
diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
new file mode 100644
index 000000000..ad557253f
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbes.r
@@ -0,0 +1,14 @@
+cpc
+dtrace
+fbt
+io
+ip
+lockstat
+proc
+profile
+rawfbt
+rawtp
+sched
+sdt
+syscall
+tcp
diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
new file mode 100755
index 000000000..a747a0458
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbes.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+##
+# ASSERTION:
+# Testing -l option gives reasonable numbers of probes for each provider.
+#
+# SECTION: dtrace Utility/-ln Option
+##
+
+dtrace=$1
+
+# Decide whether to expect lockstat (disabled prior to 5.10).
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+if [ $MAJOR -gt 5 ]; then
+        expect_lockstat=1
+elif [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+        expect_lockstat=1
+else
+        expect_lockstat=0
+fi
+
+# Run "dtrace -l", print the providers, aggregate by provider, then confirm counts.
+$dtrace $dt_flags -l \
+| gawk '{ print $2 }' \
+| sort | uniq -c \
+| gawk -v LCKSTT=$expect_lockstat '
+
+    BEGIN {
+        nerr = 0;
+
+        # Fake lockstat if not expected.
+        if (LCKSTT == 0) print "lockstat";
+    }
+
+    function mycheck(lbl, val, valmin, valmax) {
+        print lbl;
+        if (val < valmin) { print "ERROR:", lbl, val, "< MIN =", valmin; nerr++ }
+        if (val > valmax) { print "ERROR:", lbl, val, "> MAX =", valmax; nerr++ }
+    }
+
+    # Skip the banner.
+    /^ +1 PROVIDER$/ { next }
+
+    # Wrong number of fields.
+    NF != 2 {
+        print "ERROR: wrong number of fields", $0;
+        nerr++;
+        next;
+    }
+
+    # Recognize some providers; apply sanity check on number of probes.
+    $2 == "cpc"      { mycheck($2, $1,     5,    500); next }
+    $2 == "dtrace"   { mycheck($2, $1,     3,      3); next }
+    $2 == "fbt"      { mycheck($2, $1, 30000, 300000); next }
+    $2 == "io"       { mycheck($2, $1,     2,     20); next }
+    $2 == "ip"       { mycheck($2, $1,     2,     20); next }
+    $2 == "lockstat" { mycheck($2, $1,     4,     40); next }
+    # nothing for pid
+    $2 == "proc"     { mycheck($2, $1,     6,     30); next }
+    $2 == "profile"  { mycheck($2, $1,     6,     30); next }
+    $2 == "rawfbt"   { mycheck($2, $1, 30000, 300000); next }
+    $2 == "rawtp"    { mycheck($2, $1,   600,   6000); next }
+    $2 == "sched"    { mycheck($2, $1,     3,     30); next }
+    $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
+    $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
+    $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
+    # nothing for usdt
+
+    # Unrecognized line.
+    {
+        print "ERROR: unrecognized line", $0;
+        nerr++;
+    }
+
+    END { exit(nerr == 0 ? 0 : 1) }'
+
+exit $?
-- 
2.43.5

