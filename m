Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6A1E5020
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290152; cv=fail; b=i4LPm64XiWjAzQxs+PeeBzj6K3On+gEOSpTMvWbYNvaAXJ8L4T7283+erMYvbLhxXhAR73fyHzSUfvRNmVt0fIj6gZcepubGolI8tmZDr2UmGalMzn3lCqb5u9a+HeoKrAW7vO0u93JtJpCxDCI8LGMDYL229amp4WSqxhuegx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290152; c=relaxed/simple;
	bh=OJMmNCE2imSPnqG6C2807+CMZH/cWVEoKaCWXLIQi9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJtCwqI1iXVmHK5QdMlSN0cZvEPocrO6c3VrU7z0FGLIfMP0yb2t0c4Zw4kou6So0HN1xW4mEh3kZutGWe8MIMMxv85o/8iFxZg0pTEndkEg3+oA/dEVia0GmVPp1E9ov7JMpJkUYv0j23Q4YgXiw6IxfE93tApyAf6aBMzDC20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HcHIQ0JW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KibaEWXU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HcHIQ0JW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KibaEWXU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fdXM027036
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=; b=
	HcHIQ0JWmNngJqyiCCmwm8ewmLElN5c61I9xPstPs7ShzHf2mCOPJrUEjh8fYAtL
	WIwJxYOLLu82r+yQcPVw/1qbEhY27cd7HnzunlUX4s8Zjo6P1zrALEfN7vQAo44/
	B4K89+yRr0eX9R0pAPhfhn7TF29P86oOyQY5twxGYi/CICHw6rFk53hVaEMjOBgb
	HOul3vmC75aXc5bxRTpzMT1LjSXchAjadOkvrJGTxCEYLEg8uH67cd35VEBt7Sp3
	JC+F9HnXrIMfzCne2HfshbbyqaN8vy/NMza3KzIUD5+Kc7+U6MDbidF0pWx96oNJ
	eyvdqP4ewK6DAesX8VpEhA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwfrx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBHN5x034771
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:07 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd9126p-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVrT4jK2ujuoQziTs5TcuQ53tGiLfQd8k2cUfZN7LkrTmHZzmoPG5z73z+vXTFmllnWztd6RTn2RlD2YweeGFyz6MSQ7THfJ/7OcMlWtpH/I03xgdQ6oqAVqYTm61Naqgj4XYUo2IPxj3UvyAL/fTTIDeG+fA599EUUWIYDIOP0+FQLgQjX1OPryCpinS0reJHLzjlGAZPllq6FmzRKf/jsGSwTzqWVPQiUWbkcd49jvDw0HmlsfhpeHG5oOdQTVjWGwDZwSgGg/9cv1x5hJZoeZsJzVlBB+KoyPM/IqXyap7g0OmHOyYseli9svHaBGf4ziZAkeQp0LN2HRC4xkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=;
 b=qrckBkj3u9J/g+Hk6oa4G1lBuLTAYj8Hz7Uun+H5z8XMeOnbw+xkQ4emosgPdqFUjEISYEHucaj2ajXGeuRgSscFnsfW+FEJ9/wYmRW8xogCAZ/JYGHnSfr6YqKX0g86nXFmSkBSte9O41TLy0dxeGxoYR3zdDKvfuoiyWYPP6Xa6ELYxniYy3NgY527xWiZInWBoERXmuYXz2CsQ8hNLgthqmwSpN+hb4RZEcZy0enLDRmtd0nAwnfZmIC6LXbsFFlNrMHcZHa8v/jOLV8yP995Qr1bLXGWY07DjardzCI/lNvnGi3Q81wEDnU17QIszWKvyPqaKUcwcLDBfAVSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=;
 b=KibaEWXUy7MUArVdNlnIuaEl98b3mxGanNuhC6WQHUK8PxcTIilRVRH67ZiCl0niUqnfxyH5PyQM8Lcecx6q9pqosMPaLUxL1f+IN+h7dL7i0DyezDz6+63GgiY3Mdajddz367ruBBvUjr+MrAWqZ2eRv1Vn7gXq6b+RrDNr0T0=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:09:04 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:09:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 4/6] cg: add argument mapping in the trampoline
Date: Wed, 30 Oct 2024 12:08:48 +0000
Message-ID: <20241030120850.256884-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0319.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::18) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c864119-75a6-452c-f784-08dcf8dba59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TRkbVzTKeObDsVnQvIgaxcEd3mR+PnEs1s/pyOJpJ8mK/TgeGsHlZPZYpEfF?=
 =?us-ascii?Q?X4vA0Ee0N3jRA/NAORa3mJLJZGZmbvZKid6CSr9Gfion5n9Hq/ku5n5rc40Y?=
 =?us-ascii?Q?r5xP/4ZdiJLPgYlmO4Xc/x7q8I1ve7JwPiyxWPwaTChhXDx4r5D/5RgHjhLG?=
 =?us-ascii?Q?HmvhzHRtO7JCJMNwX/OVFi7n1iS90+XO8wQSgok/Mj43KqJSJpJNITyo1XJL?=
 =?us-ascii?Q?wD/rRg8syEkIKnhzC68RxL/R4zADMsPMAACp8akwcIZbyr6QRIJGPcQ/7BmH?=
 =?us-ascii?Q?Ha1a1g6JAQIlQXFjzbnFt3V4cjUzyV0mOt47umXtq6NoiPR6jGmBlHMnawdm?=
 =?us-ascii?Q?BDXqrPLR0zpxdXqFkbikIekfmUX94rZrHHpM0TmiUG4GB/pxQQkDpjcPtHfV?=
 =?us-ascii?Q?cwRQKFK9XXbKsOFGYVKDtYlV1exfdzBC+HHzPbOuvji1PmjgQKgsjlrpismD?=
 =?us-ascii?Q?Q+aOdiE/Nhls5e01X6lo8aoMafjWVBHGMvns9gdH1Sqyjwv3GosfJD0KGj5R?=
 =?us-ascii?Q?9Y+XqYhPIIY211rB+BEExgvECIWEdMK6/FGdZdbNJqyBZ/kmR+2LDU+wIk8J?=
 =?us-ascii?Q?tR+rS3PdxiAUZSNis0J2THnL7OZYo/9XKxuBTOeeYUFTcQGjNtF5g7qA26v5?=
 =?us-ascii?Q?yW9YFAjXndC9xCqeUVxV5mQJtD+yJIsFztKd9K6fp32vraRbIMD0SPKc1cxo?=
 =?us-ascii?Q?PinAIxXPUv06xr92OyHhDnb3VMKhByE55myFG+lOTMqQk3mIN7r9ehUcAc6d?=
 =?us-ascii?Q?2wmunqO7F2IuyAcybI8KWEQ8ko55pW6wSQBXoaTNM4/pik4IEE0+4WmLH3Ic?=
 =?us-ascii?Q?rv0eRf/V7ROElwYooQEAK6ay09G4L3iFfT6Kyfz8yJK6uOp+839Ir8zo40b/?=
 =?us-ascii?Q?Kc9CLj9W1/Nq1r/L89heisnZ/qnCZ9LU6QwXCCiRiFBINV3Os2HIfiBgTW16?=
 =?us-ascii?Q?jNCfJHU05U0IFT5awvdBMjMKFFt793y+A0rgfDtOrvbK4XJ05i4dWQ9A44gJ?=
 =?us-ascii?Q?KJGfmiGfgUjkYno8eosFzavatC+aYZsHC2DM79uC5ezjjvzhW6I4kZ77qgta?=
 =?us-ascii?Q?fGsxd4yryPYGz2chj5woezVeT7t//gXKk+zZG99YCaj44nP5/++Qlb0oNu7E?=
 =?us-ascii?Q?FetjxWHKmzjl6thdTk/BJIFYZu+TF30a9FLWuC6WPsf5p+0YSo7sbsJW57/j?=
 =?us-ascii?Q?IMTz8Cz2fJcFpogAbTPzGBz/AgEwlDBR8RFtWk0qShdYmkwcs4drbrW602NK?=
 =?us-ascii?Q?1GFYlTXCT10AnafD6xVusCLrph7eOfG4kGl0Z1mtBg3ryysVfiyHAckMNuHp?=
 =?us-ascii?Q?Ra4rpjhWOiwRS8Y81416x7go?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCyFg320mjMg5WyC18SGi26oh1EOzNqjrIk5FRYTl5BbgonEsNho7mCRCtPO?=
 =?us-ascii?Q?qzxB/C5P48qbNzIPMSQmNyTeRx0un7xnf5hvaGM0DTRb/fRKw8ofsp5jMb1D?=
 =?us-ascii?Q?qLMsqm+eRSw792GJ0EOd2crsgmuyUlQQq1kQj++WGTj0ADt4rMqKdMN7z7dB?=
 =?us-ascii?Q?fTs5ESEG1FMoCaF4za0wNNvtaImkTtQxkeTUuLXRGjI3AAF3s2BrzuL81wCd?=
 =?us-ascii?Q?trf6T0vr9bcLRIoKYJWHYs134DIwRRVo9wrYxdgR/Muq/BI4nCpctTN27IMM?=
 =?us-ascii?Q?BtD0K/GC8AC/yhrGy5yGFldTjLUuHytzkO7rfzGGimKHOav6svNFbzSRzV7r?=
 =?us-ascii?Q?ZCX98l27cQnKDXsDe7RnvoVZcjoRfZnMLgryQFW3IlWf895wuWT1zbruQ+8v?=
 =?us-ascii?Q?kgj6Gf495ycAzlmfsOXXKryFdm9wFBPU+Hpq5l9VmKhAnxOCtzf9cHo7vT+9?=
 =?us-ascii?Q?c47OuqbF+CHHDGBcWDTfR8ZfqjC/Dg4O3du4VJ5Ij6n4CMnpn9L+GpqfyAx5?=
 =?us-ascii?Q?TimY2CBLqXL4w7anmLkDHlcQGhuJ7SKQVA2ZkDf46auNRshqXb6n4Pc12N1T?=
 =?us-ascii?Q?Hn4P2fMX+4gy12UDOyQkt22UbvsUOZNX/0X4a5pQFVEyfv9l5Aa4SvQlbeuf?=
 =?us-ascii?Q?QSoj9q+5MDW52IaQvEEKyWJ5+6+KLUK7ZTRovF70zxzZ/loJMtYRYS+tGXOA?=
 =?us-ascii?Q?vLi8dvhOr6qVTENeN8kkNr8kXB+WdVHF3Qm4yf+Sx5te5zfn6NkTg82QZlvb?=
 =?us-ascii?Q?aaYNEakyTM8GV7r6sHMNNbYec2uQKrfY1Y/8euFJkrGwTTOMZUykRHBETgJw?=
 =?us-ascii?Q?yic+h+iIr+uPHph3j380x9eMaxHimYDVUbjQbaIjaZwF5AIA7/WE0nrTrgLK?=
 =?us-ascii?Q?bKSVzxLUqzl8GWEJyY370TxB01dVPMHHwjm9pcvmeRqWRyfspS4M4tMkGRXA?=
 =?us-ascii?Q?O/uhA38nuB42IZWy/HTJ5FINMp8DkkNn0PDAn5/4Lij0KI6qz7d6QnjxXtzF?=
 =?us-ascii?Q?qlr/LQ2WalTiNuouAknVy/4q8YAL+VXC3LEZSMwh6NPhOegao12Ry4W2Z5pG?=
 =?us-ascii?Q?LXLTpDfJzVUa/ff4eNcgaVPKFeu6lUtCW1LLcTUacZZoCvO+mNhrGfkHoj3A?=
 =?us-ascii?Q?bb2jh8V1jzqiQ3iSP86h9eu139qgD6iKz8mHigZi5BdxjvPoBEFA/5S0os2v?=
 =?us-ascii?Q?0ssV5aoe/Bl7rFw2j+n+GkVjiZpPEGMzbEaPHth3d9TRJKp4kehUofCaj4G+?=
 =?us-ascii?Q?5JiMSS0yCscswPzA2wuKS6u2oQo4iOj1j54Qe2mqsWLjeJxbBzr5OAWSMNP4?=
 =?us-ascii?Q?DDbsWFmCgU91AcPPb+RXP3/yul8gXLxLI2yjb6JC21Y9UM929zA/qAmdoQVQ?=
 =?us-ascii?Q?TcakpVcnmO00odNvcHbPfj+Wl3YLgZx4JjyBr51I7L0yY0ZuuY6WgR0aSAGQ?=
 =?us-ascii?Q?dKEZ2LfnZAsEpBnV5A6qtJuYqR5H04/1DKy+W2Mgzn0Wr616Y6xzSMLbPMs6?=
 =?us-ascii?Q?kOdiU5xvy3Fiao/ptOQZysI3mrcsZ8hIL5Ov/DRolGUKuntAICSZBptegugo?=
 =?us-ascii?Q?4ZgvIJJk0Krffr0sB2mSrdMA+5CNd8jZ2RlSLv2lKMlMHRtREUEh4i3CsE3G?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xXL+Y34QFzHPm3yVtAjgWBOnrV7OlAhwwdE62PGCXCAm7icpzkRJhTVf4EnQEZU8r/TjcWiQk6OttzZbAFNnEZ6FkhzfFvXjJUE5BcmW76JZKV+5d1m512+NR2iCQjZV5y+4oGIMVD6SbJJnXr13dEdMPo6e47gSf46KEi5FUZ4WC8HZa5RdpIZ46+o4SX6/O1WzbHpdFpkEXniauvwkEyWT5/BRWl1yoqQZYjh+NQplyPMnXhJllL18jpXe4yZj1zxBsTNqbn73K5eZQwXNK5rUup1mkqrIdW/xDU0NbiscxBAa5OoTP2U3EayOOMRFpTUgqD3cCxnKwatxiwBGIu/HTJ51rBvZcm7fIcqJ900EEbG9XJhRBxHVchmdqEl+OpId9E/9BPaERdJuCmjICzzSnIQarGMfNhlHXQmKZu0fpyL1ScwP33GIvYuQoXBPRiAt4Avs4BXrNhBv8bTCJpZ56CfwP9o2plu2gNiTWRB522RmuUFCoMkHCXNeD/eiEwhN94yr4rlf+3V6/dZMkZ7n7ZqvQ/fc1YfMcVPE2FiUZ7bEu1MraNuXcbiYQwKTkEr0Z232/XL40nYExaxDotQD9DLgF4t63G1ldJ5B4/s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c864119-75a6-452c-f784-08dcf8dba59f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:09:04.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+tEYHTChqWWxz8/RykOeqlExo55ge9GYhe5sM8S/EoXfldyRHN6xxWz90XxQBkgwn3B6xDYWKp7Cw9vu4qDrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: LZhlIzijRx_xKAy8dOsealSj4feMZvGu
X-Proofpoint-GUID: LZhlIzijRx_xKAy8dOsealSj4feMZvGu

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 36 +++++++++++++++++++++++++++++++++++-
 libdtrace/dt_cg.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..959be5601ea8 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,35 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Remap arguments according to the array of mappings given.  The original
+ * arguments are overwritten (but saved).  In effect, this changes the native
+ * arguments: the caller should adjust the mappings array accordingly, and
+ * shuffle the native arg types to match.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	/*
+	 * Work from saved args so we don't need to worry about overwriting regs
+	 * we're about to remap.
+	 */
+	dt_cg_tramp_save_args(pcb);
+
+	for (i = 0; i < nmappings; i++) {
+		if (mappings[i] != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(mappings[i])));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5060,7 +5089,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * array index according to the static argument mapping (if any),
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
-	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If dt_cg_tramp_remap_args is in use, you should apply the remapping
+	 * at the probe_info stage, since the effective "native" arg positions
+	 * will be changed.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..8f66b7a7cb98 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

