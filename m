Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CE1A34A1
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614394; cv=fail; b=ux1y+sfo6Z5XdpHJt/yZR8ckUnV7P/I2VW+fLnQrXffAn+E+qe3se+o/Bwey9TCTqHqNwJK+DKGmVR3hACDmVNftevfn1PKwweaKnjIEkH8vSxA5t+PWZd8NeYLM0bXDCOS9vdoJ4k+rHByE9SLGd6hBpwSGAB+S8NSSOM/UedY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614394; c=relaxed/simple;
	bh=0gSI3wHMSCo9/NHve/ZvGckWm2vwHslf4JrxqGMyEGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q4EGPNjwwYFyAYRfvp60W+jx9OoTHFd7N8xqw0gNT1GuJ9u+AYgoHDf5FLgMB7u5dqxN4MmJsc9Zmc6gw/ToOMSFxAGEzI4ZtUkAJEkOAoQCABF8fLpdcldXdGQ8+Es46ls6F48nJ1NqeEfyPOBmeW5cYskUNADlcu8SDGXXxE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T9vrR6Fl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U5fW+X3s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T9vrR6Fl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U5fW+X3s"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472DGRo6015418
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=mu10t2XAvKkLdX1
	vbCGTPCAhdazkOkWhshcZf2wqgDc=; b=T9vrR6FlOvfg2C6Hdr4gMyQT8p7NY2c
	kgPnsjGfGtD3hL55L3alpi1+CBvfs8VND99zlBl6fxhHkze6WMn+95Il/6d6FdIN
	OEROl2P4MKd/KCbRT6MnMM/3mtb5Pv2cZCcT2yHOB+/EHThmjoSKqLJJFA/BMum0
	4qW0+HU49rI51zf5JuUsYQaW8ukMIV8M0t9r/wWcKIm9dkm2Kc9PYwsfkytuTBum
	lsHrpBF+idmw9BxveGqbxYS8wV+ourSjvk07JOfAcI+liU+RVx+TQGNnEvJunwBt
	X7LW8ij1Sogn7SyCGWfnsuoPJLHTw2SvuXIKpEMX8/gdSFro1qPfqBA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8hfw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:59:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472FkVHQ001928
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:59:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp1sj0f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvEPgb5CwngD+e4sbwX/jdh0A3EaMu538a9RHC54q4D62oDMKYM8bkrpx/NfjyOwBNpg5GE4NHeXQExBFlBswSwJ1bBtaqIlmWvexTGkw3jZ5gghiS0IFi7G7cUZxyvLEgws5c3mF4X6rWd5x2jGu2MDct3Y8l1fCOWfnTmubQ7Xp1JiFTiMb0z10RD9TgXKqxrfdJAbGi3wTNNxWB5Rs3exb6sn4EAQWYNRPnv96FMQw2KNx8XTwERgtZuhdduQ9ZXAAxsA6mdEf7jruK8zFtDk2rwUkqS9x4HavI37K6mlybYJV93WET3uZJlTHY96x7XqgUAyu/m0wDiY2lUovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu10t2XAvKkLdX1vbCGTPCAhdazkOkWhshcZf2wqgDc=;
 b=E486Ab+Ju92Fgi6mQXvjX0GgN2gZVjijSCYSFCIGJ6Ex9DOLcLCjj4rf0VJPNQF3LHGz527yXZrhmZH6qrdo2HTk85Wati7TmXfv3RC3ZBrUUYv54vhzCbjQ9pbx3LeNAWcKI1tKEUklLwGC0oR2iU2zjBDpaAU1mgxPj6uFv0Lwm421hAZxGWztcV1+6yvj+PuFZMBFWc6rasS2ZPYyfOKdTPlf0KvLF7l7FegL60Vj21U/jC2PW2vBkkmK0cyOmsKxjyPImT7Yh4j6lGnh59Giqcqpuxb3ue2r4mmshWNyLvfeWQUynxLNk6g+sexMLy8w3LCWPdD0CJryixBknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu10t2XAvKkLdX1vbCGTPCAhdazkOkWhshcZf2wqgDc=;
 b=U5fW+X3sHYhVaNDR20Hg7mZz1rMlAQgouyZ+BSrol+lZ5zj9Scii3yiVlSvO05YYcVwhiFLarPJ7nxrobos5TKRnNmmZQEhO/EKbfBDZr+wcEBAKBDMreV+Xz2GWgkOv7/pgzTKmdsEhHNpK66E6c8ARyJvE+DONoPnwGE7zhHs=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by DM6PR10MB4220.namprd10.prod.outlook.com (2603:10b6:5:221::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 15:59:44 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 15:59:44 +0000
Date: Fri, 2 Aug 2024 11:59:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf, fbt: do not try to get a return value for void
 function return pronbes
Message-ID: <Zq0CbfK557g3OALy@oracle.com>
References: <PH8PR10MB629206C3D0CC853576B43FD5C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR10MB629206C3D0CC853576B43FD5C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
X-ClientProxiedBy: BL0PR0102CA0065.prod.exchangelabs.com
 (2603:10b6:208:25::42) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|DM6PR10MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 502c3548-3f1b-4a6d-4478-08dcb30c206a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oIPG/6ArS7CwQX1gteSrp6CW6uU+AB1v/AhnUkDbVcBK37MfYEur0gGE/TRs?=
 =?us-ascii?Q?Nw41A1gYGpEgyPmajD/+GsRanDfP5P+yftZbZO5M8iy+/VhgFXh/fu31Iq1v?=
 =?us-ascii?Q?jOX+siHxDp1I6TllzobdS0pFZ3BH/sQNfIEQR9VqJIyibw9MPYt/0nv4SVcs?=
 =?us-ascii?Q?3pzfhWgXOn8kTW7kjwW4hmDPE20INcT+HYRTTxK72Uw8UqtCNbzVXiLMpm6L?=
 =?us-ascii?Q?4jdaM/M8gEfDdcZGKTCmqGpbHPGh+A7pCFs38p+1QhrVG87aurTSYGCSKcRD?=
 =?us-ascii?Q?+VS2L6v0KauYHSQJDO4GW6GSGVv1qGMT2uYFNd2qnsTkk93t6hNY+fjGFLCG?=
 =?us-ascii?Q?0bEXbfEsyl+lUI8dI97/IHO78hfqi8+o8VKNC+vTeTpGIJOprx8BO3leEIyQ?=
 =?us-ascii?Q?j7s8BX0rBmZwXA3jZn6T/3ESgj2Z3oj29MWPq1QfB6JVmJ5EmjFGSHtJ4U/p?=
 =?us-ascii?Q?p4ztuV4B8FQSa9LVoQeYjTruUxNB7TRVXt/7pMTSalyP2NgYaJnyW/gmy4sj?=
 =?us-ascii?Q?aAU1dAJoNN4CWqYBCDVHZg45u1e2YjgM2pooxWdXHhKH/db1zt0qPs9EHhm4?=
 =?us-ascii?Q?Bbp9b8VO0unNjvcvFzTNJNwcbA8vQk9Nbavt3/DP0W6TtsNsbe4WO7Ha1i6d?=
 =?us-ascii?Q?9HP27ubSilsLPzn+QuzD/q/99cqA6t46wbnMpGdtPJgHnlf5jMeTbxp7k1zh?=
 =?us-ascii?Q?lUF18bgvX3mTBaowTYMG1TS07SohxvinTMf0RHIm5Z+3+9wsT+71mUioHpV0?=
 =?us-ascii?Q?07WTCXOLLkmQKrJEXhHWcQfHoaddDGV0V9BxeIjXitrDWPbHa41+GLTWsaoN?=
 =?us-ascii?Q?SPOnHDDz3L1QkMlzedGqIhIvxHnFKBrtoh6X5DnxjGVm4zvyPFFfIItvfVhx?=
 =?us-ascii?Q?/R6mSi/9FSGS2B20HqwtKnuZV311aTElD9b/QAVQ8syOf53+3xCsS16e0llK?=
 =?us-ascii?Q?mXHa8v6hIGkZkzn1Q4HC9UL+fIRsZLg0ZpO49+1X00cpvAEXKtnshWug+3k1?=
 =?us-ascii?Q?bJqdhfYSxmjtThd2Ejqv+t3O0MFCTgFAjtuAVDQyG27yFOkeI/8ZsXFAh74L?=
 =?us-ascii?Q?uf/5aPA+am9mYeKcElhLpGvq6SZbSZvdByFCa0GH5+XIPhH7WpMzqvvsxiUc?=
 =?us-ascii?Q?5bhFm7n1q41OG9oB9G7zA6T0SwzPJdUT5HMQoi7OsfiTP31JMHogggprgAa8?=
 =?us-ascii?Q?+yBrfh/iGe72suK76ayCAeHXupI0BBoAYoTYyR+yxH85UxYOcfAJj+llic+v?=
 =?us-ascii?Q?6WWyYcKgHvmZwoKHsqS1QMW8X+tyuuRcyGCcJBKau4uSYwoRaoEGQd0vQkPQ?=
 =?us-ascii?Q?dJ8uQucwp2gutxfsepLr3Q7Mrl5XFKo3KVaB+4Zr8+Xlmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?acPN5rdllDH7kVFcoFWpl4ndlJyTfK+vt+T3INQF7pZ/tC5ZA1oq88nqXYCl?=
 =?us-ascii?Q?NGcKAXM8Vl0qThTAn8vSV4m+5jQ654T/uwkGRZtx+1POk+uizMrIKSN5t1qi?=
 =?us-ascii?Q?GFIB7Mt7QX+OwqiQVUYE1Jp2IgYfGTstu+VPm4sBih/QazSggFOj7MPvyxXz?=
 =?us-ascii?Q?tv9QTdlPkJL+5eCMsH6ZDW+RsS3zXKxBrvclb2wEFMPdJgcwTew0fOyG3Bv3?=
 =?us-ascii?Q?NiZPU3aMdLvUArlAFJG6j2VXAIVQPl/kZLenzq244sQDXye/K+rpDfZEakEK?=
 =?us-ascii?Q?VWraYa/4L3sSNitr3jXLjUxA5fR15pNZwVLpJ4t3Ua8FfdFEURF7C8qksy3Q?=
 =?us-ascii?Q?920ukqelqjxPWMkrVr2t+pJ5sRcr0fWjhB/Mw7HCSs9iNdhq/sKzJEbcuIsr?=
 =?us-ascii?Q?ZccuFc5FEZXfprxfgfBxDk0D2P2cl2NuNzD2ATF7/MnJ5K73drUo7RL+zg/4?=
 =?us-ascii?Q?9SrBnm1MjxA4qfYaTiaSfugZlUWkR0FutROlPFzI0DErrv0vaVfsKlO3/wev?=
 =?us-ascii?Q?ySqoJV54OQAt3hZCBrA/xvcfKTREZGcKt0rGCCi1GfAq+ewZ5kARZmFVpFVT?=
 =?us-ascii?Q?nFdyBfasdcBeDb6CIRO+OA4XuRJ9DUU86KaODOosdqE9xnjlLFmcy51QfR8A?=
 =?us-ascii?Q?l5IRzQ26v+6imEcjRISejTEInJvZnSdjFLW1q3amKNJXwi1SAm65ZWfClVM9?=
 =?us-ascii?Q?jQtm7rasieLNgDcKETmZph0f6T7gkpSI4Gg9be5HH3PSBl9g6NzzkDXjSmLZ?=
 =?us-ascii?Q?oFnrjHOvkp90lBKqClQHT/2s5Zu+FF5AsCjn9z4caxYdmD+WiQTwEkjZwDTy?=
 =?us-ascii?Q?YDUy9QKVzKOJGazJH3sK4zd1mOqI3I30BG+Gyx+cqfW4UBEQlU4sXrPLSpfQ?=
 =?us-ascii?Q?fibAbB2MUu181UvnujKXL0+kebFZfRsARzPoOIXvaad5DzKlEiAwRyfpjCZL?=
 =?us-ascii?Q?sH8ErNotUpVDX/L3w1B4AaRGz0P9IJw09kC9yM/+ZdG0XSL+OYuRnaWIfWvv?=
 =?us-ascii?Q?6Dy6t2lBXvXoZKbYToVGyLW4U2ogE2RH8xxBnK14O84fTd0IwYYWB+u0QQnZ?=
 =?us-ascii?Q?dkxVWkxoUN7tB7nmVttyANMLDtIsizAGaENRUd7N8HvHMjx6H0AS6a+4uVSJ?=
 =?us-ascii?Q?jykut7o+9IzMFXlrkWAHueXJG1vsCTI4GiQYSnOwngqxVg1jMFrHgptXEKdk?=
 =?us-ascii?Q?mSyyA7FBUiyQtOUZHw3s3LhWjTmPZACOjwWChLZVQ6LWOwFIAPj/7dqfQRq3?=
 =?us-ascii?Q?6W3myV4LiyfkLtpJgeJeIAFolQm1YA0Yk9/5D1C0MoceWAy+xAi/leM/oxXM?=
 =?us-ascii?Q?7+KknuWqJZE5UDv0KtTYHK6g9qcULxvmeNG2US0bWWFGyVDWS9o29ZyswNFo?=
 =?us-ascii?Q?TWa9elD7O2EkCThlw5vyJeUx+qCUz4wFhp0U/ZJHVaEA3RMVnuzzNYvIqSd6?=
 =?us-ascii?Q?/JxUru7zaY6pTmP/fiNdxCwJVN+7abDVkujx2hsLb//t2HiIAILrJR/uo0Rd?=
 =?us-ascii?Q?lQhtVuF0u+W4vLPYm63r6JFkdZfsH+uGcAu/VTXntuCI1ViosJD3YCuiW95o?=
 =?us-ascii?Q?KXwDc28Y4zz5/yiqtkG0LHivJjjjsMBXsSuotcMGzLSfFRtLjMzPyO8mvIGo?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ivSJ5tGqAgKqdwlaLPst44j4G6k5ePTl+CDSHp1UILPF9FUOdDiSva1/tefOC3LE43N7JwVt2nFI11aBUoquPDi/DJEbvhGg/6DjN83KvObLctD7DGKxVykyX91Z5VKxyImaV3JVVoHRtp8B1EJxLjLMpPKTVFyB9lbr3dzzEdkciiXekp5LEnykeAv8L07qE3KWeeZWue2mabHvlcem8u6I8096YwCRkht3Whv745dmKoNagpznLKX85M4V/HH++0ByHG4AJ1GZVd0pv6W3VswTsmHYz0QpXV2jzA4Qy3N7hC/mzHwuoacL8rx9pxrRwSfv+ruEn9bhmyijlX8rV21FiynIGE+ezyvmEN9raMFOhiaBJB4wAlIAzJdxt7zS57jqg92ie2B1IipH6fa1EkVZLHfAoXm8Bpmg6BSfxPI4oVVLzm4zTtf0ljQ0pOLhx4Z/lSrydNRTe/HOwMp39mWo6Sy4bCvTUMQTk4Tj9G6VsZgHRsMtiKIVcv+z/nd1QEdmdaEX6vlNoKd2Z6pMVIrdXhiiUwp+m8hjn7h6DlO+7ou7CU4ZXVX1Elrc6rbZZJLU4bJe6tsSu1Pu7dmejjAVJXIyCxA5r1y2uWfrqno=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502c3548-3f1b-4a6d-4478-08dcb30c206a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:59:44.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol9nN8g1NWm+2Ei2eZUF7y/bOCe5qxmu7/U0EDJ8iRAUq5pJbp6NPpsTSS7oCXVtZLmNuGJDwJqJCcciYKzw7jThrohLqEdEKVQCA/L+18A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4220
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_11,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408020111
X-Proofpoint-ORIG-GUID: hjma196-_Aoac4bimJ_BR3F20I9p4L2U
X-Proofpoint-GUID: hjma196-_Aoac4bimJ_BR3F20I9p4L2U

v2 on the way soon - with tests

On Fri, Aug 02, 2024 at 11:58:18AM -0400, Kris Van Hees wrote:
> We were trying to access a return value for void functions, causing BPF
> verifier failures.  We can determine the return type when getting the
> probe info, and set the return probe argc value accordingly.  This then
> drives the code generation in the trampoline.
> 
> Reported-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_btf.c      | 16 ++++++++++++++++
>  libdtrace/dt_btf.h      |  2 ++
>  libdtrace/dt_prov_fbt.c | 21 ++++++++++++---------
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 77366df6..e905580f 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
>  
>  	return -1;
>  }
> +
> +int
> +dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> +{
> +	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
> +
> +	/* For functions, move on to the function prototype. */
> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
> +		type = dt_btf_type_by_id(dtp, btf, type->type);
> +
> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
> +	    type->type == 0)
> +		return 1;
> +
> +	return 0;
> +}
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index a7cee464..e05b30d0 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
>  				       const char *, uint32_t);
>  extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
>  			    uint32_t id);
> +extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> +			       uint32_t id);
>  extern int dt_btf_get_module_ids(dtrace_hdl_t *);
>  extern int dt_btf_module_fd(const dt_module_t *);
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 461d5e35..80c3db20 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>  
>  		/*
> +		 * Only try to retrieve a return value if we know we can.
> +		 *
>  		 * The return value is provided by the fexit probe as an
>  		 * argument slot past the last function argument.  We can get
>  		 * the number of function arguments using the BTF id that has
>  		 * been stored as the tracepoint event id.
>  		 */
>  		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> -		if (dmp != NULL) {
> +		if (dmp && prp->argc == 2) {
>  			int32_t	btf_id = dt_tp_get_event_id(prp);
>  			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
>  
> @@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  	dt_tp_set_event_id(prp, btf_id);
>  
>  	if (strcmp(desc->prb, "return") == 0) {
> -		argc = 2;
> +		/* Void function return probes only provide 1 argument. */
> +		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
> +
>  		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
>  		if (argv == NULL)
>  			return dt_set_errno(dtp, EDT_NOMEM);
> @@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		argv[0].native = strdup("uint64_t");
>  		argv[0].xlate = NULL;
>  
> -		/*
> -		 * The return type is a generic uint64_t.  For void functions
> -		 * the value of arg1 and argv[1] is undefined.
> -		 */
> -		argv[1].mapping = 1;
> -		argv[1].native = strdup("uint64_t");
> -		argv[1].xlate = NULL;
> +		if (argc == 2) {
> +			/* The return type is a generic uint64_t. */
> +			argv[1].mapping = 1;
> +			argv[1].native = strdup("uint64_t");
> +			argv[1].xlate = NULL;
> +		}
>  
>  		goto done;
>  	}
> -- 
> 2.45.2
> 
