Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1022DC329
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767237; cv=fail; b=nHSMCK4Bk0EIUFCxhhclfYLyssBCShYwl+N940+3/021DWzk2ONLRBTzz4MmiG0pTgGT54pqjMt2QYFE9v6HfqNAn2iw5wiOWrltW65CIb7x05CAk/gFp8TMNtdCZRmu1KkOMERk3Fv/QsriTsRd1k/mdQrcrotcj6mU7c1lyUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767237; c=relaxed/simple;
	bh=b40kprl0LP7PNWqDTnIpn+WIIomhp/NfwgGqxBrKtA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G81e12CCLlPUYiE8m86jpCRqG5eCY4k/9MveOh96/6u/kEwqhpww5fP1C3kAyIdtFKn8qZ1jjuqPcS6lYBe647EOuUCLRE4A7BHk+MXGJkUwsBbhBqCh5eHLl40jmbm6R7PHKbgRlipdnWj7im7eaGEnK4FSjQMUdQSji69BwSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fMnWuZtl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rnw/lV/x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fMnWuZtl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rnw/lV/x"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596Fu3Ip018389
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DXiJ61MrPP5+e4SG8R
	Jl/rTOgST1A+9lJiZXWOaV6Yc=; b=fMnWuZtlL6hS7FmgvovoBlblEsBWt9lfc+
	Tf+gnYZ9rihaUXNESMdlcrriYXb+GGH41fWBIkKy0J1PsJsu6r0iwm1EAMoMToLt
	x0WRmZnN2x9uI6dHtypiwwFKUEha/KcUUZfyV/VOJVtvZJLDU3i3hSof8Ya8AdNL
	7mrbZJF/vOOIhTPFDELn1lIvrggtxvxwRuf+7NPhj95aYFhPgWJlWKUaPHhsKJps
	hb3WQvRydeHFh90lW2pQkawBm3DOeAG4o4XibsGsjLtj3ttTnB8lVX2HG9GBuWcU
	W+wsSq0SJbxr5lKQSUoazlnQhuDsfC1ofZqcV1Tuo1Er/jsUisYA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mgajg4tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:13:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596G8dRZ035480
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:13:52 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt172e1j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3I5R2jcm8Vp5uTSQAfP0pNt32VX0MZdvFt1P+faIDfI1wEiSzzzSmVNExdFDjQ9CmnEempEfIRQkzRSEAwCaCiKVBsCUYzjMcvfGqAoYvdqanOpz4LH/lfiEnwlP0QtvyTC25/R5PgZU9u/J9AVJRd/rvcHR6vcoczBdbvTQUZ0/ClJTR5vZytzS5X6X0u15DG4AKze1oMakMfkV5J6pIUu5R2hmdHO2bHXTeVZL/XJZBjZVML2b7eUR7ZxhEYMid6XHd5YnmcpuoshWoDyOPEKQdzb1lxMQKYFf4aG33hbiYq3SIM0sKCL245W9PzYFx2FV/fD0+iHVwS1cUHpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXiJ61MrPP5+e4SG8RJl/rTOgST1A+9lJiZXWOaV6Yc=;
 b=aXcB+FFztjT+PtlYsb7Bh92VDFpOBNSmekmS1qSLYxZ2Mpla7tO/qQBHbt+P9XommXwYHwV990i/uj0zBFeJ0uJanZ+9O30MYFJyhxq11FnuTqCgEL2+BslNZ8EA5ABP8euIJ4ZS2hpJPxiyKciBGVONnhk4BHzYQSaxb25CiecUT3HrX12Ydvr2Njz86LklkCaxTutWmUr0fPYHvmze2BYhy0VrkGKxF4BzVvvFs12Fhnqm/2vpAPE7zrVCpI0CsPyVeVJj6v6flQp9tn++bNgueS2hLK/kglN5TasZgrlK3eyBNCL003c/mUeqHlDVUQ9m1pyxvDZznrF6xLxJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXiJ61MrPP5+e4SG8RJl/rTOgST1A+9lJiZXWOaV6Yc=;
 b=Rnw/lV/xiQb08H/Ia6QR+kYl04+S2kauBNliI6L9DMEEpqNcVGNcQQezbPE/+5SQYfn426qOzo/9sx4yksLiEIp0GJeY1JG8dyAFHAO7ZVBvOTDlczY0OxoKCeQPn8xLd+Zp8rwPEOfZVICEXTNY2srbZVlV5DjsYeFkcS+Ux8k=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4414.namprd10.prod.outlook.com (2603:10b6:a03:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:13:45 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:13:45 +0000
Date: Mon, 6 Oct 2025 12:13:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/5] test: tid_pid: don't assume the type of pthread_t
Message-ID: <aOPqtvSeXdKT9nkh@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
 <20251006152829.239100-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006152829.239100-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: 19999f51-cddd-42e6-e964-08de04f3532e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L7Phvc182XArKR1GbMCM/CuEfd/kKWoM7quQyJLbDLXTpmQB+yjWg0Bj9YRf?=
 =?us-ascii?Q?zV/tpPtWIOWtcLJnnn7vK2ImYSMXPCUrN8o3fs43ZKanqM4BkuFRk5fHkYh+?=
 =?us-ascii?Q?Ida4rs6OIMgT+9EM6Kf68T2uofqFsQmhVfJmjftKdt2PGBb1BnjMdzKsgTI6?=
 =?us-ascii?Q?Km+b0TsdEkvZoltBXMWKjsSu4c/88qTMjDA6bCtBsJlJ+fKsqOx45E9dDjUQ?=
 =?us-ascii?Q?/jLWatf2gRPd2da4o5fFcvJFaWiVIfmcFLFKuRFcHj8v5FR0bcqZkao//WBO?=
 =?us-ascii?Q?dvtzKPrGQf3w+e+EE6haL1vRfRKtWyWmDx8j4lC8aFWqM/3V7Njy7mO9AjJx?=
 =?us-ascii?Q?pZhsGIt7dgpmc5VAIFKN58vcuIoN2dleKIKzoNUOlQZoiqIDnCk2QFSM+yws?=
 =?us-ascii?Q?KdK5JyJc8hkCdT7ErYo51o5NaDgjIxc18hJ6wLusgyFd74Cx2yejWm/2H982?=
 =?us-ascii?Q?P2uDj1Yh3IStDADrG5ZKIVw9Ls5/7QsBnN7tax9FbesE/bjMREE5mZUWhDOd?=
 =?us-ascii?Q?T7593gY55aWbKjXceZTB6t4ZfYRM7g8V1RCY4BMjjIVZVPrsfHB0xR4WyRZx?=
 =?us-ascii?Q?+NyrFh/Njqke9dMe4m1C8sMRzWux4GI/yxwGPYzjYj6MmNq/Ct7v5olm473P?=
 =?us-ascii?Q?vFFC7fgr2qAAfMI4cBr4rwUjoyT6rSba1Vqsqpk7VN7ukd1pzPOUSadl+zKE?=
 =?us-ascii?Q?OAOPPx6rXBcl6fVGmLI+Xj6NstoKr9cB1bNFe3siQdaMgiEZz76LHYFRYbOK?=
 =?us-ascii?Q?KLEdyGRoiGrU5IPDju6RNi3+1FQoLFcggW5+qeDo00JC6x25CXtXFjgldF7o?=
 =?us-ascii?Q?ToWH7zrjlGHRtzeVrzkiMz2gT8ZvLiUWi7BvXB1YjlORcLh5PTNqwZgViRrW?=
 =?us-ascii?Q?gv55T2dplj5JoSdTL8f9RLWjvm7nqarbjVJZde2j7ePVYscAzYeXyE5sBvSw?=
 =?us-ascii?Q?gtyCxfKLfTC47MB95BxbtPcL3mPmqZNg5PZ9q0zXERkudwQSYnqoaovkp33V?=
 =?us-ascii?Q?9EJwTNqSYyL2I4LMl3uNNKc+55sk7yOw85dtxEHxQXvixfNf/ucHdVXWDyek?=
 =?us-ascii?Q?PNUR8s7D3eeF1ITq9rxe70F/Fl7Y7eegqvNpkeeGTmF35CbqQEI4G0i/plS7?=
 =?us-ascii?Q?krDJfnEVgmfv2VRa4l416Bb5KZwluKuhWcT/vP7ml9DUWYH7X2LG59dnqDGw?=
 =?us-ascii?Q?okOwhjboND7yeAqpLZ7pS6Bie1H0tRdR46GcQsyVNsOY61cXBigxQNBYnMW/?=
 =?us-ascii?Q?JUOfa+QLLPq6tEv/73jXCU2MflazWlRve0a68p3f2+XwzyKRx1gEDV6XsWQw?=
 =?us-ascii?Q?sklsCGkM4MxYWY5U6XsZdeAR/ECABmZDj6rXRVrRXBGv7tEmy5QvZ1dcBy/F?=
 =?us-ascii?Q?73cJ69mqZ8z7DCQ0XsVvjuEnbvO3tjmXpq3WzqNS9NDmmsIRCODTKNBU7rJZ?=
 =?us-ascii?Q?Qfd19DqS2d7HQi6oXEk7FRe53CGW8xpd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUuGUPc7Uw1DDFpZlbB58Z5yYVGL8A1BzkVEQeMSX4OkEKBSN1xnEcfh20Vw?=
 =?us-ascii?Q?fuaUEXdVD0fj2B1uJXtFOm1+wAVKyIQKGXrRskGXsEBsPeJaoOkg1HY4Dhxo?=
 =?us-ascii?Q?qEBilvcCB7az+JH+kILoXK04qLogjkcQtBDb28MUpueNWeBrevCraO0UlisR?=
 =?us-ascii?Q?uYMJ+LH3bf8W4J38uv+utK968fvzXV0wLnBpZHyJb6FGAzQ2h3XWLgTRHm72?=
 =?us-ascii?Q?ADM6KDrIou82n0PXPKVJq0dEvn0G4gk0yjKG3XDXUJAyBEIDPeL08L5vw0lp?=
 =?us-ascii?Q?1E20ZKuzDB+pNRqfghgyyqQez1bSbSDYbUvuB9uQ+bDN3ut8wuO0NzXjeKut?=
 =?us-ascii?Q?ln4mu5Kpm8WCxmtUTpiyjsY9Jp7uOyTEenC4fHICJD6OWqwTEh0LXMj5BzAa?=
 =?us-ascii?Q?tnxPovgP+8/hVxArO7g+wkZfGvxSVnEn+jdcEKISHo0o01PZCbw9MILjEZDN?=
 =?us-ascii?Q?QASGVTzSrHfvjUZQ5iLBfmkCYm688WHKQasiD7i1AZPLY9RQubccRFog4e3p?=
 =?us-ascii?Q?YPq+0sX0GBi9QuYz5uf1RIG/oBei8i1eqIFpIGrQsnxspFG0PwCartmVB8f0?=
 =?us-ascii?Q?+zwKv7hXbuYg1wrIMv4L3MDkU1/APpyLeAfGmaMSyEbF5gOBpLU/2SimeNyp?=
 =?us-ascii?Q?a47+b8JuimhGa8RTx6dWar2FLxfpFFyMcvwWbKP/EF29ohRvqSaGHtBnUbDh?=
 =?us-ascii?Q?N30wgZUsOxkKl6FEhQef4EuD93wK0WjjFQI1K1ebi8HELkdgWywS05MsYFUw?=
 =?us-ascii?Q?9b8i5YBGkfUtZYZhew5x+gH3x1xusyMeMtb3nsT4jB6f8SGYARKMfLu325aV?=
 =?us-ascii?Q?xhDTZDdWaCkkKib9cySgCjTYIHVJ47ChwdERXbA+1IphNzYEMVaVs+GWlTPy?=
 =?us-ascii?Q?Nj70GgSDGSQ7KoszyZ8aukRR/6giVu3K6sCe/qEXKr5tAng0UgKAnovcysq3?=
 =?us-ascii?Q?mbo+YH+4eXLX9swGn3kPctsOEte4e+nRbhkKRdp3IEkFqkhVCJHv/C9gdpr2?=
 =?us-ascii?Q?7cFsDHuBHjWyoCHa6TD86vMlEB0fFPtZdsjbDh2dRZ3KoFOgPXYvc/xJbqTZ?=
 =?us-ascii?Q?tpkuOqNggJyKV9qhsFhjxv24ufo5A7wcZFVLA3NFynIf3mLfDeV+/eMm9Yfa?=
 =?us-ascii?Q?AadZkmwBCqLBVz1ubdnXIoo3Ua7JdRYK2+9+BZ+SN1SpSbOwARjAN/Wu4q4j?=
 =?us-ascii?Q?9xSogO8Vk1wcm4/l8h/04W0iFPYIua44MxDytqxIbwoXu9lEEJ1uO447Oeeu?=
 =?us-ascii?Q?Ec4N97uV7FtMIBjJjfMOQ+dHbfXrV1K02xnV0PHeNvAmZl0z5LvGe7Qtk3GT?=
 =?us-ascii?Q?5d0Q80ktq19CsQb+0v7pa30CbW0kWiuF1c6zbK7cmwgJVzvLVNTY1QcQA82N?=
 =?us-ascii?Q?wXhqzHgYd4g71ROPeAa8PlhMS59qy3d3686rqbcXb3h+a3s7BgMv+dBjJWT2?=
 =?us-ascii?Q?rquznEfkVfAzNcEdZeXx0m2pyEi5UTqfWWKmSRsXrQSOBoMfebUsYm6eRxb9?=
 =?us-ascii?Q?nAvylWd0PGbrBBdfAkCAqsVa9CWu6WJb0SDltvHAXToNYLuk1V7Un7Nlx86T?=
 =?us-ascii?Q?LJ5B2U7qWgfzq0CKOZNQMwz1PVY57MPJOzF3omuY9KbixL6zA+hdH9e+9clV?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eaSrnyRh3P6H5PuBvggirZ9cPXl9VdSr2A+bU077/ijVpIERmv8EEoL7V9mzNIcPvc6gpd+uztNGbFeofoEyi56j4lEoueCRyCwbuwCCZ8+OOcnAqTffyVN40dhjCMJwGMsJMRO1iZn3JxfV6/GsgGtf042l0Vlgxp/rxUB6K8nMYUSPPdPvPb0ABxkkcW7tlAKOfH/4T+uNd0nnywnH4Ko0nv2ZHF7R8+MeziHatoWYoQHTeXCoFcRKxC6oFnMGhfhtlFCj65FrCD6yVZDO/UXhdFM7b1cjtBcE/PFhcpbiErLwiWciKSE/B6YQVMUSNSYNOylP1yfmP5smbijDHRcxHeICbY/MICSwAjZWb2bYSoaff57o7LapAT0eBA4eS0/GUjYoPQ+kPgICGvvDLROZ/wE1//aw15tJGRC/zp9gpc4k77wDlElB+ckaDvJVOyH5R3NDDq3Q37eMN0bRZscMAN8LoU5IUYFK6DBp0zlEGZOkZ0KyDVB6PzcdQi23yE/bqBPCPAg0N1uBBsdyEu19e7UT05HNzyxxQDAXDMnfJ2Ph4BH6pUX04VpsnUh/zXCPLlFu2YauHuuykq2t3dOD9ZNa63nzC5TWZNNlrWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19999f51-cddd-42e6-e964-08de04f3532e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:13:45.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E95+kIH+WswFgCRBW5gPIKvhDWCo1NZbyNoN1DuWVUZu+/prll7716hVNUS1rlNRrEJTB9vaheJJ/we757PPi6bDQLiqtsiMdql6HNNO7nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4414
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=985 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX5fwGIG8TS37z
 Lm1npU5sjuLJ/iKJmnl5zgtCRggmQQMh766MFG7ZA2VfPh+YxmV3wZYkszj0bEiAoadYR5Vqxvu
 2m2L2AgCXsHjq+QkD0ugaCKIKT/NAU3NVe4T4fYqfn+9rZIxcIJHbnRI7+mkLb/DBFBDGlUiZ93
 XcVwaTDuVflNoiRg2jAx+s7R3GxspxnhMJ43gbTDfVsKn56h70SkBSBI8ejF02UFHtHj+MPlqCP
 0OMXegERrca7NfJL96MG2SE8f+JJhDdL1Orp6arBHMNshFJqCvRR+Uvg6BDfJzcdYDEXHfo8sTA
 wJDLLlR5yWOZn6I30BBMSmbqiwmENsbq5Rnoj47J9AS3A1/D3F2TnQZC0a4jOW0Wj7updX5D+P8
 GFYuu690MrKp2bJW1Qf0VJo5bjal76HE07+/IsRAnvvD+R/zPeo=
X-Proofpoint-GUID: AR5ATixyve7anb5y1wV2hjNmUFR0omYk
X-Authority-Analysis: v=2.4 cv=famgCkQF c=1 sm=1 tr=0 ts=68e3eac2 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=K8GrSSZPAsVsFNzf5TgA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: AR5ATixyve7anb5y1wV2hjNmUFR0omYk

On Mon, Oct 06, 2025 at 04:28:27PM +0100, Nick Alcock wrote:
> GCC 16 warns about this mismatch.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/builtinvar/tst.tid_pid.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
> index e367411dcfb7d..7551f7c4b8f5c 100755
> --- a/test/unittest/builtinvar/tst.tid_pid.sh
> +++ b/test/unittest/builtinvar/tst.tid_pid.sh
> @@ -51,7 +51,7 @@ int main(int c, char **v) {
>  	pthread_create(&mythr, NULL, &foo, NULL);
>  
>  	/* Also report the pthread_t. */
> -	printf("created pthread_t %lld\n\n", mythr);
> +	printf("created pthread_t %llu\n\n", (long long unsigned) mythr);
>  	fflush(stdout);
>  
>  	/* Wait endlessly.  DTrace will kill me when it is done. */
> -- 
> 2.51.0.284.g117bcb8de7
> 
