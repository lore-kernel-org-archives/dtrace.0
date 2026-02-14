Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C71F5858
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771094406; cv=fail; b=P1no+Fx5CNXlXbSPSFK9HfFiNFXoPOGwGxodgtT3K7/yUtd62aRZ5CJ74YbBYq1fYUYj8cAyz6TKcn16ErZ1z/AoX8wsjO8FrNv002wrxpgBZc7BSzRy7Y9CVa8mHmnujoauBZ899svwur3VivmEZTQ95riNlxPF05Yeuuq1iyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771094406; c=relaxed/simple;
	bh=v2RTJdjzcyriQCKTAVeif09OlGEFIGp1+i/Gokj2+8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=noHIgGRdWn2KUT9tweZw4KTncwEYmjBkyzhSEorvq4OGtOjh4WtqEHxRtmQE4RUsPVjYi87ntVs+Z747LbVgPlYAJcY/GUbasi7behjS2HgqegyUlthw0fk8IDhbXLWNzBEVJGCYekvKcq7SWFOhtD5uysS/9Nb9GwIj9HZA870=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZBFEEdAq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XdH+18Dk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZBFEEdAq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XdH+18Dk"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EGYFAi1735206;
	Sat, 14 Feb 2026 18:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mvNJ+1SLLkBdTw5Ykn
	5wlEhwpW9EnAdMYC8DUfnumhI=; b=ZBFEEdAq1CT9umKZNs8MqZFtTKeQD6bXzh
	h220+11SdtB0zkP9lE41q7fM49h0FoRQIngSFCgrxyPfjOvF0j7QUyATv8jj1LYx
	d414havaUiBtyYyTsHRUXuTs6PE9cMuP+JEos+qPpb/5ib8+iOR2bpuVF6ji3dPB
	ZbMkNEeljWgT6efiW6F8SbV1bd3SbnNBthXhGgW5fXs94TP4NzAAixjpJaplkBAr
	qVYoNUJljZzeyoII+BtAmJYgRFp3PR8fB9Ca+95Ap1c2rb6bw8MsDPavBNfNom8S
	8vjPAYBrx+NIWi9Wi7TW4E9sHSRKmx8HQ/ONFyvWAoPShpGZD03g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0wgar7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Feb 2026 18:39:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61ECiONo035600;
	Sat, 14 Feb 2026 18:39:54 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cafg70r13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Feb 2026 18:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHJDMSOb96bf9FCrY+Kjqvt+CKgIqTAEePZ64zMCm/QoQiprHfO7kavJqSBlnA/LMY4BmvJ4OK4FpkZsJhbHh8UeC5ugpQAxW9hulK5O8DGYoR1oCUGDOCgzLWZkLQISGxGR6/Mlde3qTAHQBO2jk6Ww0AHzpSnLvQw9/2YV4xIb68uKh8I6CDNdkm6d5ACG8zIkk0YCG8gfn77KvLRbuqb/19s+UQtpIpLECAtZ+Hzj5mFWUhl864KhCzqIBnbC32upugP3foNbbYtq3VtzF5fmVZTabjOSzp3xGXRoAKCP2l4h6HRQDnltpiVr7KO5ItYVRLE9ijZg7mTsmpJq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvNJ+1SLLkBdTw5Ykn5wlEhwpW9EnAdMYC8DUfnumhI=;
 b=vsv1BdDixtI0iH13rMuLI5HTCBbannR1XsBCJ302mzs9EGTfC/DEGJU9KJb6fZEby+VQoKwnZBJXqSY9vaMTwbNb3+INHp45oW5+dT1sxHewzJbRznmPoUMUK5HEm07IZKwHPW2j1YqYX5xwqWRb6ByAzwxxUfY/DLcKJZAcoDh2r9yF3j41k55BQ4uK6xBnr9Mffy3pwkMetJqZOb29fOo/ZA4qxTZzcRjeO7bBbab6yiOz8ppTB0F+iIbWYt/j1Jr7bu29Ev5/+Owo8pH8emFRyMxsQvZj4aKhYyYLvaMmM9TGr5I1Nxnbm4xu/EPHX+dQLtpK/Ye3XQSuQZfRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvNJ+1SLLkBdTw5Ykn5wlEhwpW9EnAdMYC8DUfnumhI=;
 b=XdH+18DkKPndIH6msaemz/0D8Enthemu9ptF7jJ/pXFRVF2fE7+VjDNT1hduthpPgpi+xWMILgDMf39PgFx8kKHTx+mO246Y5Cq4Rnq+wV5AHLBZpPEZ3aWQHvVcf96sUQPhM7pX4fIK8jIB5PXCH2YXwb9iIEuDXWSIyuIUfnU=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SA1PR10MB7853.namprd10.prod.outlook.com (2603:10b6:806:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 18:39:51 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 18:39:51 +0000
Date: Sat, 14 Feb 2026 13:39:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Sam James <sam@gentoo.org>, Nick Alcock <nick.alcock@oracle.com>,
        dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v4] Add packaging configuration for Debian
Message-ID: <aZDBdXxe0MAzO9l2@oracle.com>
References: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <87tsvkn0ai.fsf@esperi.org.uk>
 <874injxxco.fsf@gentoo.org>
 <aZClSFDq/mk2Pqjy@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZClSFDq/mk2Pqjy@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SA1PR10MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: b219c30a-da27-4fab-22fb-08de6bf8702b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yx3ByIvZWzXkEMYkewLk38u3pUZIamC3iKQ+NpDs6DBV5X7YXvJMkSLzulWN?=
 =?us-ascii?Q?DgQ9D60oOFmNLa4LLAFwPT7tlTGcDxseQWA1AslXERMBfzPzsfFEg1Y8zsbW?=
 =?us-ascii?Q?0feMTA09/8wCzvWKPOWrpYlscQZuykxBppNYN+amjb+ukjOo9yftd1ZjxD9W?=
 =?us-ascii?Q?Lti4GwlqNWtXZGSzLTUGZuDrFP5sYg0iUVLmbDAlWHrWcvoEJZB+mslge5O6?=
 =?us-ascii?Q?ltW+IUTNwcb5s1kmZEipfLAYDbRwpzc08pkTapL30t0R+zZFLD5zxchzjZyH?=
 =?us-ascii?Q?UsmiIyAdlK1HAqnWIj4PUfZoAV/8WPe2N02mYsOS4h8E7j1AtKGmi1VmsgTD?=
 =?us-ascii?Q?Ty9YMXqXIKmhutMnliLb/Dg/AkH0/Jl8u/F5ezv98zpQJVai/fitzuuDdmiL?=
 =?us-ascii?Q?VlIrglaiY9V8a/zkQr6na3I+PZGQzLllfG8mOPqCyLs0r4MOa4/QqaizKy7c?=
 =?us-ascii?Q?SpHgDUwUZeT8kZ9rhgovZJDuYwuRsRgAzH3rJ4HNN/1EJEdyeRIhwfC3lMuJ?=
 =?us-ascii?Q?GCpK+6+6IaSm5CuoKKAC29FsRWIkNztmxgfoTKQDJ/fqqtrZ8PFQZmBO0cAr?=
 =?us-ascii?Q?rN1lvaScPAc7JDYlfKOieIOf1jtz2LnLDbmnTKGCZUA5YGjRD3Hr/66dJC20?=
 =?us-ascii?Q?WE3815sChcX7Q3DDHO/NofSAoTv3mE4cxwsAIid9XIIJxb0KdZvh+0NETprt?=
 =?us-ascii?Q?C8U9wr8cGv0XSCr4rm10uWQ6FEbJ4Rdz6ABv8edcICguHl5twQdagKh+QNyc?=
 =?us-ascii?Q?3TSt8B9ZIJkxPw5xhKXg7nbSh+wTw/llGvIFIaqafVtdtG9EAmVrNJnC9B8L?=
 =?us-ascii?Q?8tEicdsX0Wu0F3WrQZQkz9wYpb5376g+DVCRfQ71iOpBJpKIqRXpJ0v5JgOb?=
 =?us-ascii?Q?JKK3NewAnXq0WddOyq2sx2wleGT3yx6xo1UDZ9CiijQvGjIkkwg7C7Ty/iEf?=
 =?us-ascii?Q?5KFsBsCDXb6rDydixM/tb9MEt+0fwv1uziarld60Zg86xl/g54SZv+6lpjGA?=
 =?us-ascii?Q?1wHcVqqOfBSsBHCnJWGzWcQ+XGcwmHSIg9TPasT4Lc4+tX1mf2MsYwf/+aPI?=
 =?us-ascii?Q?nGE0Z2XznmCVH0/yGZmYZsNPWYY8a+ojIajslZIH7WfHmUgz8AyO6xjIr8AH?=
 =?us-ascii?Q?9Zi/pMMZpnzIGmXszh7njhbYXa+aC4iL6ajMbQkjROiM2ba3SyRMLJL5LLXc?=
 =?us-ascii?Q?JMYlLOKj2ycPIbW4Vs2GPfxwMnNEbcgOPw2jrxFDDIwO3prPjPtQVkHJGDPJ?=
 =?us-ascii?Q?gdMF3V+aZ0PODN4Cxeuyr2xj3pIiHQc99IyHSoVwBMJy3WNUMKkA03dbyDck?=
 =?us-ascii?Q?jPcSexeDTLg3rHntEu8wmw+xiR3exEIQyAJL6X5XwCu/lHN4VYwCbdgfqrPT?=
 =?us-ascii?Q?cZK6oTATMD/iioHVEKbi827cjQmP1GF82/bXoacFbR+p/LettWntaxRa/uSI?=
 =?us-ascii?Q?KxLCc/x6legQu5wtZl6dLAjDjky+zgW8BRcfxSXYOj3V1rtO3iwPDf/C1umI?=
 =?us-ascii?Q?HqcEep/NNS8dbHZxbji6x6/QJuWSY/FzfU7D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vF6xxHyMEHxBlju6ePbGBUAv71b0nmLFCzN1sCVDE91I8ASvIwCpaRo70mN/?=
 =?us-ascii?Q?GAt7xX6R/se0M1c6MSTz8Bp7sh1nWl2hc+ke/c65EfwFL1uTgB0+pAd2AKL3?=
 =?us-ascii?Q?YgbbZCjha/wfzym8x0VoN4oO2OEQIgo98HyB90dKIUd7k2WOMLcKYWqhnNF9?=
 =?us-ascii?Q?e84DfkvD847kOLyZ/RpdH3rpNrY6pIGxxsBoCr/SDcMI5qDSU2zOdb+1GS9o?=
 =?us-ascii?Q?PmEy3dSWx3skOIHaeuhW+5a+GpPxdadR7Pnl38EsBXJIWaS3+mRzUPIR+Rm1?=
 =?us-ascii?Q?40f/iR9anIYnYn6/68w0FQvk31VgldgCU2LfOxL0ZmCl9KrLBDVCSpjVTTZx?=
 =?us-ascii?Q?phn60Maebx/MHezpfpnV7ltF9YWiFKkW4SrUL3/fZeeYuJ8bP6Nra+nxALYB?=
 =?us-ascii?Q?iXE5CXApFxDU2nvfDtmsZw4ZA+31jfVbkukJm10u1WjFFELRaS079AakLtrE?=
 =?us-ascii?Q?LabLK+yFrUf5ZOaM9anUnfdwAta7szdwMWTA1LD6u3hT7nHY5yBhlRUxZlVa?=
 =?us-ascii?Q?OgykoxZVbGwksIuyYHVC/4T/hHYQakRu7bjDIUQGWe3+u4VSR4MqSMwe55RX?=
 =?us-ascii?Q?proLCB0eFc2IiEnh/CUWuq0JH3weKZqKs+0Iozxm1o+MV0PFkeI+5GjKz2DF?=
 =?us-ascii?Q?862VzlehHRb2TlvZVdd0OjXk4sIoV+ZSzCBi93qKPmsccvB6f9ExbnpyzafH?=
 =?us-ascii?Q?gbEgKJsi8WfYEfJKDoUqZoVmwt5liTsFnC3kRjACOhoRGdgsneredOKcWtet?=
 =?us-ascii?Q?crBMq1aXPWkiuCIO44E8AyrwpvGwUaNCXjYKPN+bUfqs2ArHlaJ3lPA2PJjT?=
 =?us-ascii?Q?bctJKtRIi4/Bk1pxJAWPLrbsrssNLgsdPZWnddGivA6zZkI9OV01gUlRAkyB?=
 =?us-ascii?Q?Gw3A9/TxI/AvRvQScEGLOlmnaW/s3vLgwMVlf9x1zTACoAp7o1ScVPlgj1dc?=
 =?us-ascii?Q?q3h6cov235V+FBM5xmJ7EKwKu40WX2oC+nR/zI7ajP4+y0GeEbqbVd9sWZPJ?=
 =?us-ascii?Q?ESTrMFtPj2pJWMk9/bHlt3mSRrrIap74Pj9sucZmN6ghf8eEqhcu41gdzRUA?=
 =?us-ascii?Q?yaSaKoHHt9tJ0+T88wBmSBte8KEkD+k2Cae8Dv3Afvp+IUoHynhzvnLlc1bI?=
 =?us-ascii?Q?tpJ4Mk4OM9u1ADfMJtOW0X5eL5Veh/GN90xANIjDOZVViOQhYizAGA8K+Sx8?=
 =?us-ascii?Q?gO1si4+5IlpNpjZ8r1IGNsr9iatLtjRoKbHVhYwx6D5j3WGAKxMnfJn2LrNG?=
 =?us-ascii?Q?QoEC8PchW9vcTaRQJTMd9c/G/VN3eWD5Jiz5ks1zXEWTcz8UoAaKJ/uoswp1?=
 =?us-ascii?Q?NmIX9naDnqXFp5x73AROD84mhDlkjYNWIy1FKJl+XcGtRKNiUKELjA/D5BDI?=
 =?us-ascii?Q?iKBNTpzzEupAafz80nQVICecarwRdiHekUvD3mc09hJS6bl9KyxLOTGWLpwP?=
 =?us-ascii?Q?QC8evQ8Fi+vPNDpBGHefcrGScC7pIIwg2P2yrjtzDprQVtKSIZPsjzcvx5yt?=
 =?us-ascii?Q?t8aTrtmtwagQ9oU4feckSmb5TqhV1+FFP3BcWWfwp4fu80X+GkCOst5VXrEi?=
 =?us-ascii?Q?7JthFbC5L/z/6nnZWc2dL7hzWzaBl4JCc0M3p4gaTU840Ahu2X2CHJ0Oo2AQ?=
 =?us-ascii?Q?5HumDvMQFKynhsM0QYxybO2mcFw1VwN9E+FQnNntOXYTxIGfz9wNkFQ4U77v?=
 =?us-ascii?Q?1SHlYZOBiVzbF7ot5+PGx8Z4gAT1qEgCem/Mx73G+cC6esZ15Tyi9OcyZMf2?=
 =?us-ascii?Q?qnpfUal6Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PUcp9bvP9X3Rhcxv1l2TFQ9xEBzsQ7Xb5ry2e06Nj3ILVMhZGDAulO7SMtP3mSin3fNs2qDny7CgNnVSA4lVfftgbS0sKvHuol4LDyIekyLsUVPNnbxR6TyyvPCCh3rK1CtDM05YTRrMjG+8kdJrWcpjmtd37uXvvL0685Ti82KmKuvlg467cPhKXnc3Q5c2+fyrG3Uqy4dHeQ+uehidfcMZE3qXtCHFhnpvFZV0IQ6DWIzbja6AROFst6WrFgfZp1Ha6T+MNMHdUo9Nb4ZebG/xmlrvEVC9MTHVGBnkYDjE/jYtirq5BlJrf2CN8Z1HJUTuG8fhVF05CehzJFXVOpQJgDg1qSgt+Evt9i2qVjq7uki952pL3U9dpjio9cgXmQMmkF8p4rVaK/VZ91weyv2uHaMbw9rmSsMIyW0+UDeGXdNLk/ZwMNlBjAgwH/6zZ9TSdFU8L/EedV5Xf2pbytqDhue9Yz6gA/OEyrkcoZulwMgGtqjIsGg6v660N1CStzR3d44gqDclI5/T9/pKccDwwQ8hCw4lM/EeIA9vYn+p0ehJvErB9uAOnuoOJxPru1vNjvtFBklQ4/Y8y7JWfgLy9YVlh+BtVkN7MY//W60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b219c30a-da27-4fab-22fb-08de6bf8702b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 18:39:51.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG9RQw55eazYHZBL3iPvyGkHrZr4+3Eg+yM4+eHayCkvgGULFWBKwCK4YmW6dvk0nBOBkXKXXOi6dUPB25Eh4xprvVeDuhM0nRRw68LncDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7853
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_02,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602140155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE1NSBTYWx0ZWRfXwCohFeshcmnX
 m+DFpR4p/3/6nfDQkri02tS2FKBCeFjAuzBBcW3aSeLutBBkFLgfge6+8sIJKWnU7D5GQqOO2lx
 iVbavcJc/N1MCqHZTIk9yHdFnwqFd1RbMfaEVSsA8stkYqY6Y471R8h542KBH7owIZHogrpZtxh
 /AS+6+hIWgR5gv3qn47U08WTTqw94/Ed5ARgeSezhXYj1bH7idEZMe74HsgCBrlh7IG0hY4ixse
 Z2qxAc92sBfp8sBwUq15YyHEfN9vFYCxeyMQL+3/Dth6MYbZnwF5NT86AJ4rK+FIEb32erorojN
 j4/zgKbQu3mm4hC2SAJAJ3M5ocqaIaMZ0/pz5TxcMr4mn9gk9QdEqSVSEk05Wp3ruhYdRQBjr9d
 hO1vkju2vICDun8ByLo+4T5JDl5kumk4goYEwKcqaK5zvMXZzQwV5JCNRfeC30dE2CEupgJ5ret
 +hu/7zr7WFJO1eQ/XdQ==
X-Authority-Analysis: v=2.4 cv=ZMfaWH7b c=1 sm=1 tr=0 ts=6990c17b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=eE9OS-l-pE5mjqkBZz0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: aGQpIHUOxA4aulGUCraXrXUk0YmGRLoH
X-Proofpoint-GUID: aGQpIHUOxA4aulGUCraXrXUk0YmGRLoH

On Sat, Feb 14, 2026 at 11:39:36AM -0500, Kris Van Hees wrote:
> On Sat, Feb 14, 2026 at 01:34:31PM +0000, Sam James wrote:
> > Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
> > 
> > > On 10 Feb 2026, Kris Van Hees via DTrace-devel outgrape:
> > >
> > >> Packaging configuration files for Debian are provided in dists/debian.
> > >
> > > Nice! Seems to work, even on Debian stable (I was sure I'd need at least
> > > testing, but no!).
> > >
> > > [...]
> > >> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> > >> new file mode 100644
> > >> index 00000000..d4a89bb9
> > >> --- /dev/null
> > >> +++ b/dists/debian/patches/debian-configure.patch
> > >> @@ -0,0 +1,17 @@
> > >> +Description: issue a warning for unknown configure options
> > >> + The Debian build system specifies configure options that are not known to
> > >> + the DTrace configure script.  They should not cause the configure script
> > >> + to abort.
> > >> +--- dtrace-2.0.4.orig/configure
> > >> ++++ dtrace-2.0.4/configure
> > >> +@@ -172,8 +172,7 @@ for option in "$@"; do
> > >> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> > >> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> > >> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> > >> +-        *) echo "Unknown option $option" >&2
> > >> +-           exit 1;;
> > >> ++        *) echo "Unknown option $option" >&2;;
> > >> +     esac
> > >> + done
> > >
> > > I assumed you could just stuff an || true in there, but this is being
> > > invoked by dh_auto_configure, so that option isn't available (plus, of
> > > course, if there's an actual error other than unknown args, we don't
> > > want to fail).
> > >
> > > Maybe we should just not exit with exitcode 1 on unknown configure
> > > options, only IIRC Gentoo actually wants us to. This may be the best we
> > > can do.
> > 
> > I really doubt this is the first / only package for Debian where there's
> > a non-autoconf configure script.
> > 
> > The real issue here is letting whatever Debian machinery that calls
> > configure think it is autoconf. ebuilds do the same, by default econf
> > will pass things assuming it's autoconf.
> > 
> > I'm sure there's a way to override that?
> 
> Well, while the configure script Nick wrote isn't autoconf, I believe he did
> make it accept optionsn autoconf's configure style and naming.  That said, the
> script does not support all the options that autoconf's configure scripts
> could accept (and that are passed by dh_auto_configure).  Hence this patch.
> 
> I guess we could replace the dh_auto_configure invocation with an explicit
> invocation of our configure script, but then we need to figure out all the
> explicit options we do need to pass to set various paths correctly based on
> the build system configuration.  That seems to me like replicating work that
> is already done for us by dh_auto_configure.  None of the options we ignore
> are actually relevant (and if in the future, they are, we'd need to patch
> our configure script anyway).
> 
> So I would be inclined to argue that ignoring the unrecognized options is not
> a bad option.  It reports what is being ignored.
> 
> Alternatively, I'd suggest we update the configure script to actually support
> the options that we get complaints about right now, providing an implementation
> that makes sense (accept and ignore some, accept and use some others).
> 
> I could go either way here.  I don't think one is worse than the other, aside
> from having 'accept and ignore' cases feeling a bit less ideal to me because
> it hides the 'ignore' effect (unless you print a message we're ignoring it and
> then we're back to my current solution anyway).
> 
> Thoughts?

Following up to myself... perhaps we should improve the configure script to
be compliant with the GNU Coding Standards expectations of a configure script,
which would avoid all this...  It would require us to accept the currently
unrecognized options for paths, and support --disable-option-checking which
will allow us to silently ignore unknown --with/without-* --enable/disable-*
options.

I would assume that will satisfy the requirements of pretty much all distros,
incl. Gentoo and Debian?

From what I can see, it should be quite trivial to do.  We'd need to include
config.sub and config.guess I expect (unless we can pull in systemwide versions
of that using a dependency), and need to generate a config.status script, but
none of that is difficult.
