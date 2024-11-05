Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F85A2D
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765193; cv=fail; b=It3z3Y/R8mBnDrde+GpB/u/N7jypdB4wHudF306wvBsgK1K1y0c+4adhxaD5sdgZHsR8+6t4wyoHe8zfX3BktzPdsZLk2C0tJoqFGMICN65+T7jG2R59tSOMdZAs4T6aU5JlKNgIm1Kgl4oDeQsQJUEXO8L/DqHVwXB+kZkyTY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765193; c=relaxed/simple;
	bh=c7/o/oxiNqr7b3Otz45Ki+AH/4W09i16CO/fxl9vO8M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctFLzRSBXzJpIX/k7zATVJtZjpKe7CQ19uPLhJ6mAcg955Hn6WkSbJDD/BWXlu2j4JaIRxoRAC59CyBBo7TdCBsKj8um+PVXaYrFviiHS3Qd4IfcEferTabfXGB+Rn8tNgggMRsVd5yfkmxe/zS1qnDdWPoYk/IrZOUq68s98nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lkOkaHhS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lLd887Va; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lkOkaHhS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lLd887Va"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LhD7u031204
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zNsGD+AFa2IRHNC6WtXcK04REswVP2qrLviIdnqgLVE=; b=
	lkOkaHhSM9oDsztifggZlfMcIBukdhRGtyFCsW96nlA0lVRJOE6RodY2gRdj4NMB
	+65y+8CJZvVotRexl/x7HBRX8SpdIBpW6gil/dpRGnibtfNvLwrdDGZk7ZzkETyu
	lckZasPBFXQa4jziSdbHhRv0g3KNPXpGrOmE0LMMqWfpg7uqr+G8P+BUxt7PyJ3j
	yKLrgkos+sHS2BvY14DLQqN7EA3R+asKaFlYg6CedWdgy12i6/VFgrdLI85iYbnX
	IlKlLy9Mqng7TKtZz+NRZGRK4z+b+Ekys+dFgSV/hoKkA+yj3Zek77/zp30tfd0w
	toEiC7QxpW+lsv21FajTUg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ncmt437s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MEELg031392
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah67dr9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k35gUZPE43wmtejQnMuVxJDkzep8MSvy0yU0mFG48NctkLlPqBxlAS8HZMif2HeQU3uuxowC3HG4E4NmEeXQmZBSm0CWaHX16DrxfRbz20wb9s3vAAA40BX5sZxUIVFXbXW2H59a+7pZ5trPTleUPqBdZfZIqozj4kOv3gofo6zeaDde+vQmiPSX7mHddxF/K4UiblE/Aylx9shIUgBqD6L8QB5Lw3YtJZg1JWCI7hHzH+PedRhPvzBpHvaHK/wjHzEchHYzGhKdFHzGxSNG1eSTkK17l7uLPzLVYAYal0ZeUcB8enthblm/R1AiZMuMZoZ7wxnhUbtcUk83bX/zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNsGD+AFa2IRHNC6WtXcK04REswVP2qrLviIdnqgLVE=;
 b=uApePgFfZUCahIIgLDqWar0yos9blWLaCOIYSrG6agIs2vG/azcmwaNcZm0Fu2rQPirQ0jhotGkDwqG7dOm/A2Ip4soqVoJKd3tvICnZRApfrrgzTbtMa5r6vTYMsuot6fmMts8k8hDio0+7TXQtpPpf49zKjcakuGF3aJY+PvRonEG+2RVzrIyo50jn67Z8KlyQg2oW71S/K3h/TpsflJ5ROwOIc+xQ1WjLBsrshC6iO1ANLT7LrlAJhrnRYd4Rm/NDVN46ptLg/VWe4murzJPO0ZRhMyrrT8hzhWxkduzT2Z23yJUrf2Rsw2GstO7reyVhNXeIOINy3FrjZOC84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNsGD+AFa2IRHNC6WtXcK04REswVP2qrLviIdnqgLVE=;
 b=lLd887VaNNg8RWHz29zstlZUilNhZIiSJPNNSLx8BFDmBsnkJGHUf7T8tRCCxG/p7ex58YuBs0p8fRQavZ0UAJXDt1my9uo+pcr2LfQAXqWHNNWW4AhpncYTZ1A4janpNjeRp5r4YpwMW6rTRHcETg72+zGAyPw0uQGUBfAdWJU=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:24 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:24 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 5/6] usdt: new tests for USDT arg sanity with overlapping pid probes
Date: Tue,  5 Nov 2024 00:06:07 +0000
Message-ID: <20241105000608.333229-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 9257c14c-0635-48b6-1741-08dcfd2dafd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Fwv3Syyh1pgTPBfyi+kF2vt4UNRZiLid90RRPDoVOlgGyBPyhWSfwRQVQum?=
 =?us-ascii?Q?8BunO02SpeGUEaU5WolxFlarZdtmi4NtmxT1Or4zJ/Ijd5KngH4/WJCGlWV2?=
 =?us-ascii?Q?TUPoTuSUoCKY2VZjBipAL/9TDWFyKKW6cAUmgJwSP63KyCPJgZ20BFsK5w9U?=
 =?us-ascii?Q?K0UwBPttWk0RFNPpfOhHQwhAT2hNVmTOwUgCxix6ATQ0dBSRbi6feCn2BNdb?=
 =?us-ascii?Q?08A0ew3h/tXRqxAbHvpozuapk2M7W6Qjl1A/Kn8KlMoGp6CIawCV615k7u4c?=
 =?us-ascii?Q?BuuLNsKVJzQkLWTDd5V+DOMHcSk59ydLdV9u+qYasUUOf4Q0E5yKXNdYUceJ?=
 =?us-ascii?Q?gy/bM1LH1uvOUkV/D8iIiSnPgkk6Rj3x9UqA4rf5SVZRZiRGAnsiiUFzA/AH?=
 =?us-ascii?Q?OZ0265+nsjcazLeNEHEQ6VIpdpDjaaHpDbLgWH7wfBdGoGNSH/jjjVAlq0f0?=
 =?us-ascii?Q?AhXXQpPZdqPpC3TZC03IBFTqAkxvno1IUo6NxP7Sq+B/rMp7nHLSmoIMv7RF?=
 =?us-ascii?Q?tye5uVZEe0yWBBorx9o/KZuNFT6IRsAs0iSRF3BoEuYNFjRZFvHJGqluZAak?=
 =?us-ascii?Q?ZZZiEGjT+p1n1FqRiE4fyDfRI0ElwJRWDaNoArJ5AJl8wYa5dk0mmDCUM2s/?=
 =?us-ascii?Q?idM2w9iGMxZFS/GZNKAl1yeZvgudHCbkZq5oLZAsY6/SbZD5NQze5oM4ieWp?=
 =?us-ascii?Q?Icdh9i6obeB9ZfRHeLRWePvXqRH9YbaSogOVQMwTKp7DMY4p/ZJjyGNMeVjZ?=
 =?us-ascii?Q?K0uMqlJp+9k/5vPLVf+XLn4rwjUmdqx3cRnr0DtJq5F3ZicANnu2h+Oc+Oqe?=
 =?us-ascii?Q?C6VPY4LGd4V+EMnpSwjaX6o4GIPLoIt/4nAq5xevkIBlf8XhQFwPXilv1jQp?=
 =?us-ascii?Q?YbYzV5Xs92QN2XkIf0jQxBTcy/ExzzEVMDFBsZnE06D9HDvZwu3vFBpCH05h?=
 =?us-ascii?Q?Bmr+hI4MVAC2X43clW1TKeY2Ay1IMvlKZ1BRD1bAGpaQbcU+aa9a2wQv6w3j?=
 =?us-ascii?Q?2kZgkiSfBdMLUA6Jpb5ObSjwKtvmxoQv0Gq7LeE4jjNoMUtYZlO6jFtKeveM?=
 =?us-ascii?Q?7C0InvGz56AiWqKDf33HZHg8DJTQYkjq5m5pv/XIiRk6Q7aog7QJ9Vv6oWwt?=
 =?us-ascii?Q?L1ThWSVmlNaUF2kHK3YvE3U/Hmu7VbDWCHOBOdKq/nvnjNg2a/Cz1TtOkkc3?=
 =?us-ascii?Q?0HxYZiu1B5wq0YNagTBrNTzMaF/iTSV76/V8gIz7mvXD4rJk9OW26lQD8t+Z?=
 =?us-ascii?Q?4+GrNhmfR3a76niU5IVbbf5gx57X5gK2KAqNbipahbPRCndVA7oz96sEjyEm?=
 =?us-ascii?Q?aGIhjOGFt8w8n6RU4dG8dItp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l59InPaTLQytbhPnYyjdRNjbT9SM7MTgXash+fIXcu+aAitYr56mGRNEegj9?=
 =?us-ascii?Q?/qL622epy66JxxwLVetqkG0w7630OEH7DRRkcLMg+a47EWmSwbzhCyND1Nbw?=
 =?us-ascii?Q?JN5KzDYatLIwhPuzN638muJCQ93+ao/ifDTXOXFRwB87U3WmwrOYub+a16WH?=
 =?us-ascii?Q?bNFRkQyNczY7GPJh5F2095KlUETSCnLic9pAujlw4qONl0+hL8TVPPCCppuj?=
 =?us-ascii?Q?+HEnAkiL8bzegY82PUzFqB9CFGxcEraxtCDQoKXOwiPf8IBpDervqLxpRpuC?=
 =?us-ascii?Q?9lmyG5aI6NcogfTeVCPfJkRYG3ESQrGZYQLaPxfokmBipaQ0yPkqJNlxePjs?=
 =?us-ascii?Q?99GWzO6h8F0tAxbioGJIWKy1nbkW/ZXMCoUmGM4DVOQqvtq5d3RIyIpnoGxs?=
 =?us-ascii?Q?sMlIudM66pBjPVu5/eZbiq2pf0mjjVc8RaGN2M8tmE2xCqPCNhMY/Hh5m82H?=
 =?us-ascii?Q?TqNm6CkAnvcJFOW9fKN5HV57WRMtLey/Z3x3tqdnmuGmNdPyNtrrP4qOIkfI?=
 =?us-ascii?Q?Gh5Ki643hBusP8qoakbzX1QEngm8ksjjzx336H5Y8H7dFPoBcacRxkOWijIe?=
 =?us-ascii?Q?eWwg7ong4AU62wnRYBfsutbxN2s1ahldigv2vow4geF3/zblG8pG6fXpUESx?=
 =?us-ascii?Q?itLo0FMMogZ6zXXhUnLvK7WuzRjNId27ROftsJIZM0276aGlY3H6LAA2YHri?=
 =?us-ascii?Q?OTCg+KtoKuuowjBXf1kOtSN2UF20WyZlOOpcZSyy3zB1QVrJFsOeqTBDD8V6?=
 =?us-ascii?Q?NSihyXnEBz3O+fLF7KnAzY14JfN/GNIVe+VnmyKyg9Vyxgaiyv1cOH+hlbiQ?=
 =?us-ascii?Q?zPOxArXyOdMoN1GYmC1F4TJZDIi1zL0yde5qJu7am6hfHdGRWrAsKlYm7/XJ?=
 =?us-ascii?Q?GlU0iOdck7PEGIwpzfcG2wtTbz1AK/0igc0hhUsUM/+GGFRG7FwgQUNMNn2+?=
 =?us-ascii?Q?CeTFGwFrhLtxhLSSXMrp1Ifx9ycA/WjMCfEmLmrozGal7yLZZfJbqxSr3REs?=
 =?us-ascii?Q?rdebw6pPm8RlZL0kFe8tlJQr7mqYdIPgb10/HgdVhBQ6uWDSm7yoeq2KCXEi?=
 =?us-ascii?Q?1nYMjvIlfDbuFj7DiWn9HJKvzGGtnrc9hCz2Knm+Jz6cGtLzw0vLQCEG9UUX?=
 =?us-ascii?Q?870mQniLXQanIB3AQPazmOeM31Gp39/kSWEEJfVpFate6rSvJ2qUW0OaiHUO?=
 =?us-ascii?Q?FkUSgnnaeDsXzYxipC3uPsYrcVyvx5hqSy/snSyQoeeQAXdce4TlPZ1rh0Se?=
 =?us-ascii?Q?hs0XHBsCTcE3IBivPlmV6gZ+8wGgmkhpboU/bL0DnUdxog8BU770RTIZr7Wg?=
 =?us-ascii?Q?PI1oI70NVmYFMk8LVNGQVjADFQ+yMjaY8afA0vI8lYnh1reROCmCBFUqsNve?=
 =?us-ascii?Q?4SvisoYAuF+WZZkCG0fhfIuFAtogQY5II38YR3FVRSb1TRFR+EeourYgXj5T?=
 =?us-ascii?Q?SQC+6NFYSkjOKqMA/rlKrEBsd9DQTBJcM1/uggcfCUclpBr0l1hVnt7KmyoA?=
 =?us-ascii?Q?IBtOtfgGvEYhfOq1EViqZEGAgNC7yABwNJA3TyAzh5ZYkIauE9tepsjnBB0N?=
 =?us-ascii?Q?U0lOoo9I2tprYSqaPVNbCCV3Izi3Ur+o9w92m+U9cLfdDFKAbefUaIqhgXqM?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	807N/sBdmd9Goo3IMSIR4wtglyrU/IyP/44gOhwzjSRtt3EI0k3sP7POfwZbUGeWIQ5VNenpa3udYL9TZORIAPuRH694Oj/2j3OwH9HJRVnt07D950ru2rZqoA1PpvJrRPZfDKaoGM1QQkwBm7XAX2Tdosm5xy8IP388xEKWAFBGehzThYePHmBnlKHADZwH4W+0HDXPnlF1BEiQSCQF47D3EKw/BxI+ACf+JjG1LhkPtAvVOL6b0TcbI5Jypa4V9d/rIwXL6LWr0kRPXPFywtZTieRgwsPT0wWFjIUZ+bMFc86M6anvaC8P+wf4s+mzZrM9DnNHizUtJd6Nmuqaj/ysk/38pHHCKRsHFRBzy4KHfU86maWwK7sptKxW65NFja9UbBGKZ2YvZsHwYVEkYCDSQZ6PxU5X5Y70iXvRRrhzmVbHJY3jW7iclW+Ff9qdviA0RHP01oPwg1h0e6idbtpHPEVK1HjV3Huc4k+BDIki+LxaLAyyRDx5zl6Y5hacRK0L9yno+OvnDt1tKQ+g5GZEmjA2o3vMZMpU49lipwEf2O+ydRleB/M9/md4TIaIIXPAUmUlciBwQT0xOE123NSHNxU8y2SZuXXVzbHdQ8M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9257c14c-0635-48b6-1741-08dcfd2dafd2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:24.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8XlFfluPH4gymoHYMXKIdvSPhZOX3m/QF+1O8dA5albbguDyej7adlzy2TZB4Lp6ktLWp6UezEVK8K0VBIfyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040192
X-Proofpoint-GUID: jOVZAR0vzFL0XfBVHXfnOTrLnfOkHIEA
X-Proofpoint-ORIG-GUID: jOVZAR0vzFL0XfBVHXfnOTrLnfOkHIEA

This generalizes the existing tst.pidprobes.sh to check the args
reported by the probe both with and without arg mapping in place.

Everything seems to work.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   |  54 +++-
 test/unittest/usdt/tst.pidargmap.sh           |  11 +
 test/unittest/usdt/tst.pidargs.sh             |  11 +
 test/unittest/usdt/tst.pidprobes.sh           | 284 +-----------------
 4 files changed, 67 insertions(+), 293 deletions(-)
 copy test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (83%)
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/pidprobes.sh
similarity index 83%
copy from test/unittest/usdt/tst.pidprobes.sh
copy to test/unittest/usdt/pidprobes.sh
index 8d18c89a4aec..c9769fc318e7 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/pidprobes.sh
@@ -5,9 +5,12 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# This test verifies that USDT and pid probes can share underlying probes.
+# This test verifies various properties of USDT and pid probes sharing
+# underlying probes.
 
 dtrace=$1
+usdt=$2
+mapping=$3
 
 # Set up test directory.
 
@@ -17,13 +20,21 @@ cd $DIRNAME
 
 # Create test source files.
 
-cat > prov.d <<EOF
+if [[ -z $mapping ]]; then
+    cat > prov.d <<EOF
 provider pyramid {
 	probe entry(int, char, int, int);
 };
 EOF
+else
+    cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int a, char b, int c, int d) : (int c, int d, int a, char b);
+};
+EOF
+fi
 
-cat > main.c <<EOF
+cat > main.c <<'EOF'
 #include <stdio.h>
 #include "prov.h"
 
@@ -48,7 +59,7 @@ EOF
 
 # Build the test program.
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
@@ -61,12 +72,12 @@ fi
 if [[ `uname -m` = "aarch64" ]]; then
 	objdump -d main.o > disasm_foo.txt.before
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+cc $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -75,7 +86,7 @@ fi
 # Check that the program output is 0 when the USDT probe is not enabled.
 # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
 
-./main > main.out
+./main standalone > main.out
 echo "my result: 0" > main.out.expected
 if ! diff -q main.out main.out.expected > /dev/null; then
 	echo '"my result"' looks wrong when not using DTrace
@@ -88,11 +99,25 @@ fi
 
 # Run dtrace.
 
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
 {
 	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
+}
+EOF
+
+if [[ -n $usdt ]]; then
+	echo 'pyramid$target::foo: {' >> pidprobes.d
+
+	if [[ -n $mapping ]]; then
+		echo 'printf("%d %s:%s:%s:%s %i %i %i %c\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	else
+		echo 'printf("%d %s:%s:%s:%s %i %c %i %i\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	fi
+	echo '}' >> pidprobes.d
+fi
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
 	cat main.out2
@@ -271,8 +296,17 @@ for pc in $pcs; do
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
+if [[ -n $usdt ]]; then
+	if [[ -z $mapping ]]; then
+		echo "$pid pyramid$pid:main:foo:entry 2 a 16 128" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 4 b 32 256" >> dtrace.out.expected
+	else
+		echo "$pid pyramid$pid:main:foo:entry 16 128 2 a" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 32 256 4 b" >> dtrace.out.expected
+	fi
+fi
 
-# Sort and check.
+# Sort and check (dropping any wake-up firings from deferred probing).
 
 sort dtrace.out          > dtrace.out.sorted
 sort dtrace.out.expected > dtrace.out.expected.sorted
diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
new file mode 100755
index 000000000000..0c83f8703539
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargmap.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# do not apply arg mappings (incorrectly) to the pid probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t t
diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
new file mode 100755
index 000000000000..53cba7c39624
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargs.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# get the arguments correct for the USDT probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t ""
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 8d18c89a4aec..e63d9f5dc096 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -7,286 +7,4 @@
 #
 # This test verifies that USDT and pid probes can share underlying probes.
 
-dtrace=$1
-
-# Set up test directory.
-
-DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
-mkdir -p $DIRNAME
-cd $DIRNAME
-
-# Create test source files.
-
-cat > prov.d <<EOF
-provider pyramid {
-	probe entry(int, char, int, int);
-};
-EOF
-
-cat > main.c <<EOF
-#include <stdio.h>
-#include "prov.h"
-
-void foo() {
-	int n = 0;
-
-	PYRAMID_ENTRY(2, 'a', 16, 128);
-	if (PYRAMID_ENTRY_ENABLED())
-		n += 2;
-	PYRAMID_ENTRY(4, 'b', 32, 256);
-	if (PYRAMID_ENTRY_ENABLED())
-		n += 8;
-	printf("my result: %d\n", n);
-}
-
-int
-main(int argc, char **argv)
-{
-	foo();
-}
-EOF
-
-# Build the test program.
-
-$dtrace -h -s prov.d
-if [ $? -ne 0 ]; then
-	echo "failed to generate header file" >&2
-	exit 1
-fi
-cc $test_cppflags -c main.c
-if [ $? -ne 0 ]; then
-	echo "failed to compile test" >&2
-	exit 1
-fi
-if [[ `uname -m` = "aarch64" ]]; then
-	objdump -d main.o > disasm_foo.txt.before
-fi
-$dtrace -G -64 -s prov.d main.o
-if [ $? -ne 0 ]; then
-	echo "failed to create DOF" >&2
-	exit 1
-fi
-cc $test_cppflags -o main main.o prov.o
-if [ $? -ne 0 ]; then
-	echo "failed to link final executable" >&2
-	exit 1
-fi
-
-# Check that the program output is 0 when the USDT probe is not enabled.
-# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
-
-./main > main.out
-echo "my result: 0" > main.out.expected
-if ! diff -q main.out main.out.expected > /dev/null; then
-	echo '"my result"' looks wrong when not using DTrace
-	echo === got ===
-	cat main.out
-	echo === expected ===
-	cat main.out.expected
-	exit 1
-fi
-
-# Run dtrace.
-
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
-p*d$target::foo:
-{
-	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
-if [ $? -ne 0 ]; then
-	echo "failed to run dtrace" >&2
-	cat main.out2
-	cat dtrace.out
-	exit 1
-fi
-echo "my result: 10" > main.out2.expected
-if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong when using DTrace
-	echo === got ===
-	cat main.out2
-	echo === expected ===
-	cat main.out2.expected
-	exit 1
-fi
-
-# Check that the program output is 10 when the USDT probe is enabled.
-# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
-
-echo "my result: 10" > main.out2.expected
-
-if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong
-	echo === got ===
-	cat main.out2
-	echo === expected ===
-	cat main.out2.expected
-	exit 1
-fi
-
-# Get the reported pid.
-
-if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
-	echo no unique pid
-	cat dtrace.out
-	exit 1
-fi
-pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
-
-# Disassemble foo().
-
-objdump -d main | awk '
-BEGIN { use = 0 }             # start by not printing lines
-use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
-use == 1 { print }            # print lines
-/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
-' > disasm_foo.txt
-
-# From the disassembly, get the PCs for foo()'s instructions.
-
-pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
-pc0=`echo $pcs | awk '{print $1}'`
-
-# From the disassembly, get the PCs for USDT probes.
-# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
-# what sequence of instructions signal a USDT probe.
-
-if [[ `uname -m` = "x86_64" ]]; then
-
-	# It is the first of five nop instructions in a row.
-	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
-	# as well as whether they are nop.
-
-	usdt_pcs_all=`awk '
-	BEGIN {
-		pc6 = -1; is_nop6 = 0;
-		pc5 = -1; is_nop5 = 0;
-		pc4 = -1; is_nop4 = 0;
-		pc3 = -1; is_nop3 = 0;
-		pc2 = -1; is_nop2 = 0;
-		pc1 = -1; is_nop1 = 0;
-	}
-	{
-		# pc0 is current instruction
-		pc0 = strtonum("0x"$1);
-
-		# decide whether it is a nop
-		is_nop0 = 0;
-		if (NF == 3 &&
-		    $2 == "90" &&
-		    $3 == "nop")
-			is_nop0 = 1;
-
-		# report if pc[-5] is a USDT instruction
-		if (is_nop6 == 0 &&
-		    is_nop5 == 1 &&
-		    is_nop4 == 1 &&
-		    is_nop3 == 1 &&
-		    is_nop2 == 1 &&
-		    is_nop1 == 1 &&
-		    is_nop0 == 0)
-			print pc5;
-
-		# prepare advance to next instruction
-		pc6 = pc5;  is_nop6 = is_nop5;
-		pc5 = pc4;  is_nop5 = is_nop4;
-		pc4 = pc3;  is_nop4 = is_nop3;
-		pc3 = pc2;  is_nop3 = is_nop2;
-		pc2 = pc1;  is_nop2 = is_nop1;
-		pc1 = pc0;  is_nop1 = is_nop0;
-	}' disasm_foo.txt`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
-		cat disasm_foo.txt
-		exit 1
-	fi
-
-	# Separate them into regular and is-enabled PCs.
-	# We assume they alternate.
-	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
-	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
-
-elif [[ `uname -m` = "aarch64" ]]; then
-
-	# The initial compilation of foo() makes it obvious where the
-	# USDT probes are.  We just have to add the function offset in.
-	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
-	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
-		cat disasm_foo.txt.before
-		exit 1
-	fi
-
-else
-	echo ERROR unrecognized machine hardware name
-	exit 1
-fi
-
-# We expect all of the USDT probe PCs to be among the PCs in objdump output.
-
-for pc in $usdt_pcs $usdt_pcs_isenabled; do
-	if echo $pcs | grep -q -vw $pc ; then
-		echo ERROR: cannot find USDT PC $pc in $pcs
-		exit 1
-	fi
-done
-
-# Get the PC for the pid return probe.  (Just keep it in hex.)
-
-pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
-
-objdump -d main | awk '
-/^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
-/^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
-' > return_func.out
-
-echo "<main>:" > return_func.out.expected    # since we use uretprobe for pid return probes, the PC will be in the caller
-
-if ! diff -q return_func.out return_func.out.expected > /dev/null; then
-	echo ERROR: return PC looks to be in the wrong function
-	echo === got ===
-	cat return_func.out
-	echo === expected ===
-	cat return_func.out.expected
-	exit 1
-fi
-
-# Build up a list of expected dtrace output:
-# - a blank line
-# - pid entry
-# - pid return
-# - pid offset
-# - two USDT probes (ignore is-enabled probes)
-
-echo > dtrace.out.expected
-printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
-echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
-for pc in $pcs; do
-	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
-done
-echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
-echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
-
-# Sort and check.
-
-sort dtrace.out          > dtrace.out.sorted
-sort dtrace.out.expected > dtrace.out.expected.sorted
-
-if ! diff -q dtrace.out.sorted dtrace.out.expected.sorted ; then
-	echo ERROR: dtrace output looks wrong
-	echo === got ===
-	cat dtrace.out.sorted
-	echo === expected ===
-	cat dtrace.out.expected.sorted
-	echo === diff ===
-	diff dtrace.out.sorted dtrace.out.expected.sorted
-	exit 1
-fi
-
-echo success
-exit 0
+exec $(dirname $_test)/pidprobes.sh $1 "" ""
-- 
2.46.0.278.g36e3a12567

