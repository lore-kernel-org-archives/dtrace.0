Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07352383
	for <dtrace@lists.linux.dev>; Sun,  6 Apr 2025 05:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743916782; cv=fail; b=iZ+qDVFk37V8UZKJK6cARWkr1D6I0ykZ1tAoezez7soH+JTJF7li1rZFnVsRxmLTWnTQtP7GoBJ5/IFzo+/6sI6zcZtir28a5u0LZsXkHodZ2T+eQ8KgNsvFhI1/aiAkOEvZq1KcMFWF6ID6iOwYgvEaC+QssgHh5ts0PijS/AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743916782; c=relaxed/simple;
	bh=ThyygslCZK92gKc+opWqoG9RuJhQdPtE9tO48PitsqQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D8bcRtL4y++JwSxFKWGsBhtXHBKeCDTdOGEx0MifTI4o2npW1czVLlTI9zu7CnO4wa3OIRxd3q6+0/lCJrKZ8MhT6ULYv0CUUEVsTqKKSqHtjyDc4AQ7wisVzWIy5AtigtWi15HjwX23wOAqqWv3jPyJ45rbshy4YlcU5MJe8vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GnfJEFyG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m6mXes5e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GnfJEFyG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m6mXes5e"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5364q5tw002131
	for <dtrace@lists.linux.dev>; Sun, 6 Apr 2025 05:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=kyNxu1Ph65T2GrIOi7q9ziRu38BzzjA8Tc1DUK7xi58=; b=
	GnfJEFyGWxhdFi6HcehB0pWtA3qAigVOS6/dJzq8n2P5rwtsGom9bMOjSAGVVcsb
	7MKS7Hec5lc/nBIJ7SruKd/Fqnipc4fpqcFRh997C1FkDiYQBSuDzc2/zbQEgl24
	w3z0YObCkWRe/J5CiJp3TV8dN9bB9M+JrMDGGYGctxRRHm+LTVYqahVJbNFw4Lzl
	ly7NrEYGapinXPfSaggwmmxpaiBNH4NOoH4YQou/zXowbz6favegNVmZjMUmsoiw
	trnKQRqDwCTuaWqAHOQHYQI3kk1+nJ8RuyCbRkvL6Zsjtx2/CckGgy1/ANdoqDS/
	Tvo94Jggw/eyc2a2nv4enA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxcrtvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 06 Apr 2025 05:19:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53624ZXd023888
	for <dtrace@lists.linux.dev>; Sun, 6 Apr 2025 05:19:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyctgxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 06 Apr 2025 05:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mttVYYJQ8mtpntZ33n9l5Ak7V1LV6k1dzgtTZatReFXntumsfd4oJ2ZMDPFZ5T4Io9/3C9jQPrAdQ7vNmfXLEH4nz5TucHMLdMhL6u922JaN3BI6ILk4MHlAmvpdtw1H+dhxxBkbOcQfzrhDUDbrJYnfuihDyLJgn5FY8KgXyP+nqHZouqYjEihh1KJ5rrD5C4qNzWUXNCMy9YhBdNvmmf92VPH15CJz06JbdD2ZEWXkY96HKTOwxRKEBiP+5QK49bsa+3fc0boyRQqlI3JmMatxGSNzjVnQUwL8d5qdGSWyp8yrNRc5O8XwaWXn27AB3KGB6jfC+noKq8Y06p8zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyNxu1Ph65T2GrIOi7q9ziRu38BzzjA8Tc1DUK7xi58=;
 b=ta6emuaisB7TYSKfzkitduzTnK5+RspKA50w+hd+RPBKuVOtah3kATVer9xWlRodmIJKMcZNwY9cehtwyoO8j6oTIiMw0i3nnjMkr1tHrrHax0Xwf6kRCe3JPuHxjvNSzXuk7XEli8ND3U+85/iQPKICIBFETCzKllfYjjq+IFgXW+J9SAxsEjOfwZ42nWR/a1OWz5SyaxK8z/YTvkNzyyFdlq9zZ8zpX6v/mTpLCERmpHgu8Dnkg4IJmxyu5XsotIxarL1f2wv/H3ZoFY3hOlERbxnkZiXBLsNJE8GB/dlcvVSbpFfTWSU9dh4TP6cyeE3DqbgZDXqORBcW3uhRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyNxu1Ph65T2GrIOi7q9ziRu38BzzjA8Tc1DUK7xi58=;
 b=m6mXes5eiT0uURqQh0Qj0zHCoW9Zrsv7P5xm9lzqhM1ae1zfX2W2Z2fN0WsV2LmBvWn/xX4MYgpqkNddwFatfrgrpDhca/OLGv9nIcux+ePN451EIFL98suLesBCvIcKb6/SPgj2rH7e38zOPEPblFXvkU/iYmF4T4nz33jwPmI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6743.namprd10.prod.outlook.com (2603:10b6:8:10d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 05:19:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 05:19:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Get cpc expected branches and instructions counts from perf
Date: Sun,  6 Apr 2025 01:19:17 -0400
Message-Id: <20250406051917.29640-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 67873670-e939-4d26-2d1f-08dd74ca957b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QZf84m2LvMpQRx75qUpJ/yvTEVUJh1aSjEXIIeI6y7NtjwwMv4TsnqvxI61r?=
 =?us-ascii?Q?9pc52VsUVuJOxl4myBMTGmMCBx2MXGES8DP3gRA1duJ4ToD8w7MkIjmPuOQu?=
 =?us-ascii?Q?rp/xh9IjAQIRKS6eJkgsBJkl53VTiqfRTpJsrtNgvV4X/UKHP3a/CPZRkL+l?=
 =?us-ascii?Q?n7x++uCotoocbHpWo5Tl5V48ASWWIa5omqNaVySj0PPpLnAwtoEZwRSIPoNI?=
 =?us-ascii?Q?JsTPsXpNdkdcnX700wVDG1ZUXj1+I0I1zaFdTbOZASilk+8KhZaTO5GThgBk?=
 =?us-ascii?Q?k4dbuIF9eV4Lyr6p/UMYS/oc0R9bEZLVza9cGLiuADlwjF9ANODmyTv1FcDj?=
 =?us-ascii?Q?piwgv75lI7djUt+/nUmX2aBoLD+Ki+cuIWxFgldnPqp8AO2TTAIq2OUfThsx?=
 =?us-ascii?Q?IlL5Nwqt1gBmplfKBeF5v+DSIICZ2M3vpZKBBYHM9YjXM5yApfe1Xe2fpNeS?=
 =?us-ascii?Q?etmlSjGLUHc1TR+0auIb5iqJHyn/60wTmaG4UJZhv/diKKAueEsBuj7VcgaP?=
 =?us-ascii?Q?LYgpCk+Qb0qnng3JZ/BDxNWl3wyQ58bb/Q4i5qBxK2KfQOy6noV3cvrpnI/u?=
 =?us-ascii?Q?d0bRZxm+fMF2EtOMJaBPSQ8MXKUWare6q0mOxlXkFLpHzxXf0NC8uIyaMbI8?=
 =?us-ascii?Q?FZutllO25sP+0IGiil2HxswMyBytCYetfOL92695gt87QeZWZa8o1Jk50vsI?=
 =?us-ascii?Q?uf+ksUYBBDfL4WlEqZ5RoeP6xeEmiRAyKhBJunVZtH9Wny/oVjSu56rRGrfx?=
 =?us-ascii?Q?9eDOxo40rlbriCBOJhQNiwtPZ66WH3r56ovB15qpN2s7xEH4sTuSTd1G0JEV?=
 =?us-ascii?Q?aBpa+ejm+6Px5hKtCEjxfxT24bzFy89ibXeVRKcz1MZyUfZKSHmGxGFw4mIZ?=
 =?us-ascii?Q?BqKWYV1EB/zMAx7gtuMhiRMUtBjPV8+nDi3tc+lfzDIGXMPBQqdwb30KBvBu?=
 =?us-ascii?Q?b+Yq73kb2QaZhimHSukSijIF15mXTdaGHq4rqp1Pmi3dP8bFBkYEntrmuqHf?=
 =?us-ascii?Q?IikovFP56BhJTzz1BRJD4/YfYO0WccpBmjDM/+rQ+rKqwDMZoEce/eziiJLH?=
 =?us-ascii?Q?gkVjSc9zpzd3fYrWLM69IVTF0ClS3V2pnOUUvHwYFczrG9g4tfK4Qe/E/rG8?=
 =?us-ascii?Q?Ltkhd0rYAjUstIi1Qymu880Np93vpQ2q23krq7XKol5tpscNVkt94AhXVwJM?=
 =?us-ascii?Q?Wgg5HjpWUbqJfCbKqTpGPABhRDFb1q6YFduhnadsnux8LQQhpnPEe0sc/qGJ?=
 =?us-ascii?Q?3kbMjcCMCTJuWYP3ad4pf9XkqGp4jPssroxTRRcf5bXFZkP983MLaVPm3JTx?=
 =?us-ascii?Q?EBdsnmwxotjsLqv9J4YpY2A5t5Vmu7BZ4SNo6juvgt3japL1SEhEcLuDN/ek?=
 =?us-ascii?Q?QYOH6y6Lg6AutQ+CkYkcttnOBbH+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6q5+9mYXBN2lgeI8pac9ViNnzM0cz6uTg0JqlkYxZnLFI/mYMYPg8G5mL2L?=
 =?us-ascii?Q?dF7XQPWvOphdfcHG5zxcCeoUjtMU0+pLLTwHKds94Mb1oSuEEPGmHtmWTxTz?=
 =?us-ascii?Q?WDQLdNfLmXyKkwJ3Nh+bSDWZ8mMLMca8RRxjvaFBJZIEQLCjP35P7q0/YAz8?=
 =?us-ascii?Q?zD2a+sfqnYLhXjZlSB1UrpSHIeiqwltsPmf0jfBH4ma513QS1YsIPr6qHYKe?=
 =?us-ascii?Q?ZbNKYuUVAcwY1JHGPA/3uSj84p1/Vl3bTlYeWaXMCuqJ2XQBoU5rKGcU41SW?=
 =?us-ascii?Q?tHa9kbFtdnNSZ466ZqcYuyNAmK5YP42pwyuw/xNg6VrPzNJVQjvNQcetNhlP?=
 =?us-ascii?Q?CdAl3TWm7pUIFvs6sgzdz2+XGVR7dUqnCxY9hZwRZXXlj9U8eXxPGd3ftod8?=
 =?us-ascii?Q?Yk7ivgtIR5oaPe6bIIzILyS7MfXi91GHGITXtiPj0ZE9vE8AGznqdi63Hoox?=
 =?us-ascii?Q?/DLT2r1EQUW6NERacvLx+Dipn/aeXGxKybm4VKepaHQ7jvQBrfLspBzIF2ba?=
 =?us-ascii?Q?N60HNf4gMG8XYWqu3o3MvDxCeVu1wwdR7BpZyp5BJ9Ga0sh7vrd9D1ff8ml5?=
 =?us-ascii?Q?9V0/S4OuF89LRT7eaIpZygDaFoMP4AasVbNWe8uNxpeTFF7rno3leevm8aa+?=
 =?us-ascii?Q?J7t8bIbenR2xvP8nyj0WmUWTzFrbVSfmAr7h8cKFUXpF+hPSZtSuz9Mf2qPc?=
 =?us-ascii?Q?sSd4gIW+H6AZZe5jCRdKXfoOCi/OeLTsRzIRFw23yji8TvlpznPHPHnhR2r1?=
 =?us-ascii?Q?jOqb8nTvRLnCK86TLmS3h4v9zKOeZf/epY1xQxz/oENrTpDtPeRW7JdzSre3?=
 =?us-ascii?Q?9WArWbQvOYgft8lEvEWi8wzmVVuymAk1kpjPVwoGcAGPt6+/1sG1zy0ko4sO?=
 =?us-ascii?Q?abw2QnkUEGQkuPehSYyfns4QOdLmPrnNldev3oK9n25q0vD7OH2PywtbPPUs?=
 =?us-ascii?Q?TpW4TDYwj64Lo4mVbbZx2n/T+CleSdmkz0svugba8amugz7ixJ+NL39c/4h+?=
 =?us-ascii?Q?RwQyb6WI4j657A1QFejgQAnGGnfTW2p31Z2VhDnOTp2d4jqHK/yFkoUNRQ7x?=
 =?us-ascii?Q?Y7F26JhHoKNPjmmaLaE6ek/1dqqQwDzF+rtHFoos1tjW8w79a515PWlpS4Hh?=
 =?us-ascii?Q?EGWsOGu3XbhGFpQ3b7krhy7WLCxq425n8x6vMVZ4uyzn7YRJV2PiM9xA1zwu?=
 =?us-ascii?Q?7MbDfiSDrQfIRfQ3XisKp/biJXlyM6+Nwr5N9Q5B3ScSGWTUHGvp3bdwHoHh?=
 =?us-ascii?Q?5pvZtcGNSDrJKBNEFbQ5aL0lpCaFKdbhA1dLFbwp/Y6F6uTRc3frqalOgVhs?=
 =?us-ascii?Q?ghUNAz/TLOHSwFmb8Ef3/yttXcXy7WNXGQah8bVTk7LnohLWygSnnoWvYb/s?=
 =?us-ascii?Q?5BgPnRMQ7Fif2QUpSlENzPL9GyrfDWY7+fVUbI7A6vF0wS2NGo5rzgrUvbBW?=
 =?us-ascii?Q?nE0qiu4miODwZyn3IZCICh9Sr+CookNcmas89+k0E2XU6OWWPiw2YS7Dx9Je?=
 =?us-ascii?Q?JxnIfZDa6qhFyDm/LkckHfFMDreyCaqpzihb1AKrRBA8EIVzZbFFH6U+bZV6?=
 =?us-ascii?Q?1u4ENTryXGuRvj1vEZzDW6McSJJuBrmfS0vE1nCi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TgyNSN1hjsKpqMIf20sU6EwbrkHY334rhdExtS6sEyicd8v/cd/ishVGgCLO1fVtyHlDCPf9tTFXKRkAY+oL6uyBdk3dwxxx14KwadMRT59cIeuM/V3C8sLMq0N1mPa1fhc4Dv9NFExTM1tLVDjqCP9ke1jExUbDX6094yqvHgjbpR1Q1CVx4M2aDe0HYWxBgEGyNSBikA2W+/6urHnFDpFKfbUD0nZtt/kHm8zsRtR2a5M3kUMZuAvQFZK6YxLEU5rjwb2ygGOGu7J0nDjDXXgJRS5P7QZeBk6J/Zf7TMjdZ9K9dRAH2xZ3pMO29gyF9HenyUSFZBX7AQJkhTET9jDJKjX1Y+u+WdlwOOcVjHbKBon08Y7oedgGl8TKSw5ApoLGIRr66oR08BuFIJE+c9OY+QKrpN8PRYwZ4XZ/0BzvaK2HWAnsICm1RVY0Xxe1XNHwHySAziiZ2fJPCHiKQ0VBOSeFK35gWzziMcTcKCGKYrU23EbSX8dkUsSlJAMWInztkiTnQwMMAUUwUqjOcPXsAaINzkZr+iZzt9MUrQu2yX1Z5vLBMUfZ4Lf71XI/mqrU5ITgPz1372PUdcTHOswhWlMin58buLUJDrHRQEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67873670-e939-4d26-2d1f-08dd74ca957b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 05:19:22.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJNQC3rq4jPcIN9Gkgg94fwIW01mTKaq97HQuarKwDwaeL1gbng83u77VbrJxgNWOFfNSrNu/UUTHp5LB/Gkog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6743
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504060035
X-Proofpoint-GUID: dLoYdZt_1AHo_nWaNLvllQ6Gf_ghfvlp
X-Proofpoint-ORIG-GUID: dLoYdZt_1AHo_nWaNLvllQ6Gf_ghfvlp

From: Eugene Loh <eugene.loh@oracle.com>

For a number of the cpc tests, we get expected counts from perf.
For branches and instructions, however, we can determine the
expected counts more directly since there is one branch and a
fixed number of instructions per iteration.  Thus, we can derive
an expected cpc counts simply by knowing the number of iterations.

For some compilers, however, there is apparently some loop unrolling
even at low, default levels of optimization.

So, revert to the perf count to estimate the expected cpc count
even for the branches and instructions tests.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/cpc/tst.branches.sh     | 2 +-
 test/unittest/cpc/tst.instructions.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/cpc/tst.branches.sh b/test/unittest/cpc/tst.branches.sh
index 87250c371..442d65332 100755
--- a/test/unittest/cpc/tst.branches.sh
+++ b/test/unittest/cpc/tst.branches.sh
@@ -53,7 +53,7 @@ fi
 actual=$(($period * `cat tmp.txt`))
 
 # determine expected count (one branch per interation)
-expect=$niters
+expect=`$utils/perf_count_event.sh branches workload_user $niters`
 
 # check
 $utils/check_result.sh $actual $expect $(($expect / 4))
diff --git a/test/unittest/cpc/tst.instructions.sh b/test/unittest/cpc/tst.instructions.sh
index a7fad3e78..34112c6e7 100755
--- a/test/unittest/cpc/tst.instructions.sh
+++ b/test/unittest/cpc/tst.instructions.sh
@@ -61,7 +61,7 @@ fi
 actual=$(($period * `cat tmp.txt`))
 
 # determine expected count
-expect=$(($niters * $ninstructions_per_iter))
+expect=`$utils/perf_count_event.sh instructions workload_user $niters`
 
 # check
 $utils/check_result.sh $actual $expect $(($expect / 4))
-- 
2.43.5

