Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684D1EE7B7
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 02:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770170803; cv=fail; b=GKyjzS8uVJgGKQ737z98mrbhT6ARyRtUt3sTuTC36U3MQ9dA6dObQiHeNnD+yMUFdG/zxP+FoElGWIbj5ZdElQLh79nufcxqWsz7kmQd8wlKcqZqT3y5f/d3yYrlQqmc8sMLHur0EnLWMREYKDIyOSnucpHRG3Z0fF7UxZL8jzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770170803; c=relaxed/simple;
	bh=lC66QaHZH31RzrdkUcEd1oclfy9EqSqBDS+Dx/XV0Bk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=dgS99ddDzH7kGC7a2oGjYyfp8vbApHCkPQTcproqKVWlXippeFMf3IBvbehLBl8UVkkXaY1/lGrMHfCxGmWEjWE2riphzsJTeZMXuJrlbN+8G1jaqLxpgD2gB4MbmDhQC51POOFK5JbbHkWAxgHikip8RGUUGmXkOsGgnyB2S/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qvDF0rw/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=acHV4wA4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qvDF0rw/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="acHV4wA4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuEai468000
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 02:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ALX/o4PamLNFHpFWZ7W4TLeqeyZgoPvWUk+kwp9Mpn0=; b=
	qvDF0rw/TlfBp5+9H7ZlvQg4UJ2870Seo3cVWUrR6wsUSVdtT0Q8jSpNxxXmgwoV
	1TG1y6wlo64k7AMqG7fQiEUjSmui3W+WlY73+BmjqOCvBYUYfmPMQVmbTVEiqbxh
	r92HhtiLLFOOcLSGV/CdULxCLCrQsCastvExGYJfsNBoQU5CowJCy1vdz1+LRFKH
	8HGjApj7atdTI/k55BVGWzMTWPc0/e06bZ/ZBXIvHQlK77wEYTQAaoDbbZLN/o0q
	VmS7bQ8wVlFftgUyyRVUq8EJvGOUwl0BozLg30u9nT+XWLE3zaDYfneAxOhAsAS2
	JRlV9/4yiEiCqzFsBy/oUQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jm4s2mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 02:06:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61414Kju018713
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 02:06:39 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186n9kct-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 02:06:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDdJYzUijsPs5Y5yhUPeLp2/keNHwyVqyJwXGn38FbXTV6yo5hLpPaNh1Ki1mtBMDQVwikiJRa8J3SqXH5aaGebUnf4NSfUwh6+LPCExY7fTqzDljRGfFifA4PzbwTe2BCpK+RItgse2z7S5FGyrW2f6bVY5pH7H3g/OGYsMXUJbibXJpSjnCe5Yu3bfxmx7+IK/pORNypt0iFxmL/YoYcsRYQcDgPmLwclzcxbRiPvuBDiaSkOToHmNnqM+258SF5v6u8xMNNlFaZX2og2DIcrbRTncxfCq3A/iqX2TJ8ysSTHtgi+9Qet6zikbnbGD0oP2swcxLFUV0WHZYaHimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALX/o4PamLNFHpFWZ7W4TLeqeyZgoPvWUk+kwp9Mpn0=;
 b=xc7woFlsPsD6wSpV+A8ETlmp/8zzPBIOcK/Q+WQHTWpZSx0mOy8YLvTRCsXbKLO8R4OIDk9/HK7m5Kd7YVVaJZrc6Evpf0L/fBNNkJH0tXQHUaG0Ezpl2fgVshsSy6jZBkv9pHSu+SXXahly/3NjZZQGLgkIeKscBlwfiHbfKdJIBs6/4XVshSN8oSAPhh32PuK4K9tPGBmUp+e4OjnXIyHQQ7/M2RESoVMLhfg5heX9Kcl6/+2gzKj4LtO9Gdd6JUoPycr1o0rNiI4GUmKrRsIlvX2dsAvK2rrlinTlJ1wGmsV1oFbf6M2wDvSR8m8feQR16k9GWEKzwz+0xJ5F7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALX/o4PamLNFHpFWZ7W4TLeqeyZgoPvWUk+kwp9Mpn0=;
 b=acHV4wA4egD/ayp7ipLgSvFNrmS+sxg0iIFHb6zHsHIfgGC91k0MajzCfFyggnTX5i77a8Ryw1r+GtTK130nw6rTLq4ZIXMVBhONyJsjkpT6Tr32p+HKZbD7vj0dWIRo2EUuHLM8vewFMAPNMGPOwUjo89b+rIgEfphakvzmIBA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA6PR10MB997656.namprd10.prod.outlook.com (2603:10b6:208:5df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:06:36 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:06:35 +0000
Date: Tue, 03 Feb 2026 21:06:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] usdt, stapsdt: fix argument handling for multi-location
 probes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522F828BE6550D1851B3CEFC298A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA6PR10MB997656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a008d49-4a3a-4710-6152-08de63920656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fDEP7szc8TARudoscoiyoB5s3ulrt7DXQwkyj5vea4den8tkmYFi2b76zX64?=
 =?us-ascii?Q?0EXuFvLaz3ggCtK0oLbN6+6urkTZs9M010GQcLDVGi2ljwVDeLgCh3BzdP0c?=
 =?us-ascii?Q?VE9P8ShLA+FnbF7C8FcaRUTs2YbXx6uD8ntJPmS0F7bcbZrvPULyJuPrRG6m?=
 =?us-ascii?Q?E7sYNDd68y89cPsuS13p49BSle6LvfZCfvycN7p3lP107y//2kNZ4IW6ThyM?=
 =?us-ascii?Q?kieumC5omEViij9GjeiRxXxuyuwSw3aVHFSQY+knNiOISepoVWQOq6sN3eJ8?=
 =?us-ascii?Q?cvfFaLRayuupfpGoe8hkDcgMZ/sNT2hhcWDWxRJAwIem4rZ1DEYgfKqHxl3p?=
 =?us-ascii?Q?kmal+4Y8lQlaBqz8rm+XNoYNX/5/ce8a4pnOgT1Kz8viw7gm2SmMi1smSJg1?=
 =?us-ascii?Q?t/tVOiEQQGr1oY7rXXewmS19l/tiROq0p/x+77yXXro67pPT8YSEdcwUWyHw?=
 =?us-ascii?Q?eGu3vay2M84wQbMcaJRffjclyEVNpK09mB80spj0i30qOjTB4MuBNzvbYdc6?=
 =?us-ascii?Q?g3b1xgVscz5s8ESk4GnvDZLyANM16IlHzowBiOpzxAqhPgLkmLXjXdL0V3mc?=
 =?us-ascii?Q?k0KnmQVvFa0mmUG6VRCztVeQD6hqeC7/EzlKQmrQMOtnQCDqIRXvmei4QwhK?=
 =?us-ascii?Q?1VCyJvj6vfT8QjhVeN4MZCNXvIT1TaLD9EBOjMTxThZJ8GKQDunU/st/nEtF?=
 =?us-ascii?Q?wLmEqqjNIQrJbCmUijg/Pas02D2pv54sEFYKi6tn0xr8nNpRgZdSm8dBXInu?=
 =?us-ascii?Q?bAR5wJPyScpm7XlhAY1FcyLg5GZgihTbyYf9iv9po55l5DU1XRGjKjFZGFSF?=
 =?us-ascii?Q?t8ktuLRRcWs+jPT67zP/YmVCG3Ck9smPIydkshNi78RRfR9406TQPXzPkC4Y?=
 =?us-ascii?Q?EVOSwtPwCnB2I++V/mFF1OsS7uw7/291VTO6Hz1bmorYdkaZEBTR089jgaqW?=
 =?us-ascii?Q?o8cboN88NFtZ0z1Roci1JFSPtCbGWxN5s/k0Se6CcX2wvZnqKAADSkilkBoy?=
 =?us-ascii?Q?40jnUkpX/0BZMC2oNJI5yBYyYZgMxHWeAmaEvXiMJ8Y+hwEdEunRnW/uIrDr?=
 =?us-ascii?Q?DYb5HHI0AyWtUlmXHr8IAiL6zrNlhJzZzdNC0P9UGUq+M28iGqgBw9RBvI4r?=
 =?us-ascii?Q?it4x89He8fHEy5bCsDLnzgX6f+pJgUrW5+BHZ0AMQCKRl284L49Np2zEFxZM?=
 =?us-ascii?Q?TrWrHPIGoUg2pX6HM5CK2UTVp080A0JUop4XHgWjNcOJZDVeXYiO9V1co7xG?=
 =?us-ascii?Q?m97f0/lD5VWBqdIAX4ypPZSSPu11osKb2VHuYfOiSuRJYZ0u+payukMUzVMH?=
 =?us-ascii?Q?xzEeAaZmjkQdmYqU8e1itgGvbXNio5w4nhOr0b8lXGJE8MnIIFkN1yq3gls8?=
 =?us-ascii?Q?D8586g+iM0kyv9YgUykczRRBez9GIlgBn48VGAzP4pxMicIo+eA8AeCB+FAh?=
 =?us-ascii?Q?C7pvNwPEeYIk8tT2wO3JsLEAGy1JXfRH6gmpw5yMwdfRGuMKUW103eotSin8?=
 =?us-ascii?Q?oEtIH7Cylt0GFGXG/FVj1D5AX6cMU6kKhWo6US42caRZLEEGbFP2+wr66kKZ?=
 =?us-ascii?Q?sywFZfgjQ0LEYoasjUHy8i4HMnnNBVqK7HXG3Tpe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tn8WAIAzAomi4/VxIXwDRga7fIKDif2VcardMMrhegwCAtJX70JUSJcJHR69?=
 =?us-ascii?Q?H/l7wF8zX6HeKfAqBqwxodd8gAnwj3OC80H1m0AIcOqdO0ui0ZaJxYox/B0K?=
 =?us-ascii?Q?62WkSWA1B0BWTy4Aj7YxpucKQsprTCGSzNB4eEPxxp6jpxfNtuHVgWwKr2yi?=
 =?us-ascii?Q?qcqtL2pt+ga4Db4mUL19GHAVq2np+j7lT24lM8k2jFMwwWv2ai2Usw0JepdM?=
 =?us-ascii?Q?bETZpF6V4yorDNu6TA9FzvpVdbL0iGkbAEjlOJhf94ROvVuSIXGn3HKvWMa8?=
 =?us-ascii?Q?8TH47hY34sPr37gdRb+dJqrxFIfmCOUcP9dkGCj8/idAxQjK2ERm7YT3BKGc?=
 =?us-ascii?Q?T+GIAWMbIO3Arozvd5oVhwD3Vii9uBfsPKmQT+DS06vpDgxStFBLHsxQeurc?=
 =?us-ascii?Q?wIT664rkZBdyemRlxbPFD8PugpauMfga2CFg/Gp4KejluFfaZoTFOjnQCRxX?=
 =?us-ascii?Q?3RO9WVRU8kQQ+TAwJ+GFWHWqTeGRX0eI8o2ud8/8oPIc+3548Preo+bxSNvF?=
 =?us-ascii?Q?Rzj67UOQ9ZMSZPppI7pFpHb6l8is3jdbEa9w/RhNe5QtoQTA8Ehj+kBrR9o2?=
 =?us-ascii?Q?WaND7HpX51LqFgJpXwciMLwB/Iq8eKwcOn88MRiX1AS0oCm0nEqa2CLuFRuR?=
 =?us-ascii?Q?fyd8dGyULgTEgFt76iq58MEbKb+6FbuV4p/MWfyZaJ2wI0QtsCvZu3zqBswk?=
 =?us-ascii?Q?LbFHt7cs/NM8h4r96x2QtkRQf5yeBGf8msYIVQhyjcvhDLlIH4PIT18JeMTP?=
 =?us-ascii?Q?GXLpftocaiTRSBwEfmbbQUGcjQIz8US4ZfeuWOPhzZ/sAx1KxOajkg8hEIxS?=
 =?us-ascii?Q?IdoycII76NT2nSwZ3oQOMZf///j4oBtIEkCX5gXTFUcqVM8qLOH08MTIe9E1?=
 =?us-ascii?Q?1w/lbGbSdwonQmjSaRdKBI6bQBOW2UArL3y91DrFeZ+UjbllwD44EQ3SCA+Q?=
 =?us-ascii?Q?8lot1Leo3QUN6FTwj9Bu433HOgHKk58qC/MiikvZBDusdaU1dypSV7Jue5r0?=
 =?us-ascii?Q?affd+blywTWG0oGyEN9wFeVs8tadcaItplQOR0/nc6s0rPBSDV6rTu3XMrle?=
 =?us-ascii?Q?zGapk0L5XgNmH0sBNjcP8EAf3iUuTOiTE3eqLEEJPM/oUlTEvIicT3PD3Fug?=
 =?us-ascii?Q?g3yKmHNy79OkJrJRyavTzttqd502JCptvhzoIZdPN88F4CnOz7B3lGuSbkGM?=
 =?us-ascii?Q?vdmNgajNMxccWPZ+kF+9M5Tjvzl3Ty/eK37wLohQ8/d2SxF/VdjYbyvLgMcB?=
 =?us-ascii?Q?T/l76Wvidz1F1uTUZih6PoeVH8FNauYmaPE/YzuQnDFlHkUVgWdDxBaYOI5Q?=
 =?us-ascii?Q?zEWIkD40M/07FwtjsssUMckh7S0WluaIF3Z1vyC6TAG62Vzuaayking6OrqS?=
 =?us-ascii?Q?aZ9pm8yZsMc5Qhq0wiGLHgn430+DxndhwMMMuccpthbiXFMhMm9/tFQPguZ8?=
 =?us-ascii?Q?nZ+f4HS8KMoLcuJfrwvjLZonljGBN1skqH/YNsfo0dU/KB0vP8knTxsfX+MP?=
 =?us-ascii?Q?EzpS4xHPeZzFPnPuPqYMFyugKl3OIJyA2lJ2Jx0hRXPpKBWME0mAdsQTSA3z?=
 =?us-ascii?Q?SQpj/79XM482WZpJaVJP83w1yUDyIoeI8vb8SAmmHgLDQqYuyN3VC99lwxEl?=
 =?us-ascii?Q?MZXfTd10ZgLdU2RV9HzqxaPddHGw7F9zyNfbJlUr9BXFM56zFkPr3nacjWhq?=
 =?us-ascii?Q?dn5DuhnsuzoY661fkR+I2YSQi27Ujpoy3xFHUid2ji0M+H/8EFQGtQMlaeCz?=
 =?us-ascii?Q?WP+ZwmC0Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y4E+gnFC/0J3pW4xaUJqqjTkpJkGJH7YxjgXrLYRM1bJpqsYOUcje45aFEbL/tuBILzHF3yDEFVK7aw+ssRZlziGJPia6cGajAejM3rLqp2LDYvXIDX+vmvesSpzvQKJX5Ddae+7zmO/c33j2/fuVzpCVl5d6h3VZmTYaPUImikPFyyqgF38Z7OnuZKj/fv+M0XUgTugUtu4AgJ2v/1RNarTltiNJutAsZa7XAnqygRT3cugBjS3o3AQ3ke/RC1HFU+63ZKP1LWkgk0a0qBBlWOvJPDRI69Z6OjVSsknJMDIe/tUCg6gLuRvrCc95hEVRyCrh6yrScRL90FnGYJnpzgxGtxEqc4SsOR2g71IUeGQ+qWCQrWAtceyu2N42i/rFX+BieLjpAanavjF7QFF5E/unconP6YamqpqammCvsaQNdxiYYl0X6hrPLK5q4ufgBDbU927lkkk46A0ZrxsLy1xrjAZabsLEMO7xIZv3Htn0t17VhAt/3e1o0lSxs8ceNtg0JBfp2m4nuzJpmIWUnQiiLZENry/E8HSbfTSITboDJumOWwgdC0FDnNfUSbJqcoPqP0EZFbCBW1c7lA3/4frZ318nKFh+eL0/y8pBiA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a008d49-4a3a-4710-6152-08de63920656
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:06:35.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9F4bcfrj7rBOKxWHtB7T7xtlLaUIE92hrG/qsfX/kJpi2QJpz6AIz86WBg22Igr/yr2hl7oh73KHxsHjnra+7Vj6EZ3QTrn2R/E5zDQ0IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040012
X-Authority-Analysis: v=2.4 cv=OuJCCi/t c=1 sm=1 tr=0 ts=6982a9af b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=03kTC6tBYgzzdIcB37UA:9 cc=ntf awl=host:12103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxMyBTYWx0ZWRfXxuTo7Misov8P
 jRyoSf0YsIUAYiOb/+VtkJRvQypqa0xPHyzPnn/AwS4e+Ua6ob+RGk3SIVawzrWm1kcPBfM0Naf
 v15jAy0z5ILo9hrixrJpRgn8734LOdTgQ5CaQstNTsBNE3RzByLsvNsrJ1zUCasJBYD42DblxTT
 68euX6atrdxfIaPKaJH1UehmrNJ6BqacaFdSI1tG1RGLrHYTBMeIrD48pS/KkGzCSyTNdRfiGQt
 w7qBuyuju2zk7SJl5flMFwlTaL2qWZdkmy5rGMDPmLgmrAp/UGG4sOey3/Mav9bnTBuYizCYchd
 1Af9RPdi9Ulth5Qdhr2ZnSizSjTjMPgg456M93pirXp3UXacnNa2ndZJl+GaLfXQve0QHNeX67o
 mgiDLuSAmnnjGUnQ/RxDp7MTGSNzjK7cWPiKJfTAqfrD8sqt95wseJan3VVsjaOIRI5zGlhu2QN
 SgyrW77vPpWE2kH5650bkBmQfAj4dUkJgqvnBTPY=
X-Proofpoint-GUID: 2GIP0Wb9_483hUj3d_MxPq8WlS2KlgG6
X-Proofpoint-ORIG-GUID: 2GIP0Wb9_483hUj3d_MxPq8WlS2KlgG6

When a USDT probe has multiple call sites in the same function, only one
of the probe programs retrieves the argument values correctly.  The
probe argument data is collected for the first underlying probe, and then
skipped for any subsequent underlying probes.

Since it is not guaranteed that the argument description is identical for
all underlying probes (although it is almost always that way), we need to
process the argument description string for each underlying probe.

Orabug: 38922360
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c                            |  9 ++-
 libdtrace/dt_prov_uprobe.c                    | 10 +--
 test/unittest/usdt/tst.multiloc.r             |  4 ++
 test/unittest/usdt/tst.multiloc.sh            | 69 +++++++++++++++++++
 .../usdt/tst.stapsdt-notes-bug38922360.r      |  4 ++
 .../usdt/tst.stapsdt-notes-bug38922360.sh     | 54 +++++++++++++++
 6 files changed, 140 insertions(+), 10 deletions(-)
 create mode 100644 test/unittest/usdt/tst.multiloc.r
 create mode 100755 test/unittest/usdt/tst.multiloc.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 6f93123f..a379a0fe 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		if (strcmp(pdp->prb, "*") != 0 &&
 		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
 			continue;
-		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
+		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
+			char	*p;
+
 			psp.pps_sargv = prb + strlen(prb) + 1;
 
+			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
+			     p++)
+				psp.pps_nargc++;
+		}
+
 		psp.pps_type = DTPPT_STAPSDT;
 		psp.pps_prv = prvname;
 		psp.pps_mod = mod;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 6d1c0f65..e575b072 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!upp || upp->sargv == NULL)
 		goto done;
 
-	/* First count the arguments. */
-	for (p = upp->sargv; p != NULL; argc++) {
-		p = strchr(p, '@');
-		if (p++ == NULL)
-			break;
-	}
-
-	/* Record number of arguments, and allocate descriptors. */
-	upp->sargc = argc;
+	argc = upp->sargc;
 	if (argc == 0)
 		goto done;
 
diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
new file mode 100644
index 00000000..a0bbc7a8
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.r
@@ -0,0 +1,4 @@
+main
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
new file mode 100755
index 00000000..19d5d6c1
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers USDT probes firing from multiple locations in the same
+# function, verifying that argument data is correct.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CFLAGS="-std=gnu89 $test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+#include <stdio.h>
+
+int
+main(int argc, char **argv)
+{
+	printf("%s\n", __func__);
+	DTRACE_PROBE1(test_prov, args, __func__);
+	DTRACE_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe args(char *);
+};
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
new file mode 100644
index 00000000..a0bbc7a8
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
@@ -0,0 +1,4 @@
+main
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
new file mode 100755
index 00000000..ea0d6880
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
@@ -0,0 +1,54 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
+# that argument data is processed correctly when the same probe is used in
+# multiple locations.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CFLAGS="-std=gnu89 -I${PWD}/test/unittest/usdt $test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+#include <stdio.h>
+
+int
+main(int argc, char **argv)
+{
+	printf("%s\n", __func__);
+	STAP_PROBE1(test_prov, args, __func__);
+	STAP_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.7

