Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB2E148838
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908949; cv=fail; b=QAaacn2HvgKGuU+lOdUJCnxDNRIWUweobEQDv+o0S0fewfHah0jPpMukTJ3JEPQCiIBztwF3Y2lMalI39HlAhVkdyzHtcsGvgU6ijQtWo6AtRxHYspI9k0A0b+AURLP8F481Mvc0YvFWlV9kOmDMLamW3E1BdrzjU+P5Q6Nub0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908949; c=relaxed/simple;
	bh=uN4FVKATEJJykMg8iwUlIolaJqtPUg+4qs90Xe9lHI4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5SXEeIE0zkBYQoSCMOwPWZ01TnyG0NIGUOJSPctFyA7Abw6IoFt99vdm7R1f/+kBIUyEkKG2sAxj+fNAI69NJy/yBQQxN/GBeP+8ugQz3WCB6Aq/NHScfZx2f6S4G8OWm37QcTp8LJyEni8uKqovda4HRJqgDnbyhNyNoG6yOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZUfQoTKy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0IbcS4wm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZUfQoTKy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0IbcS4wm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fsmK032708
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=WhTkjp5agWJ6g1
	yb7SRDRqk47FoURGQK0Y/IKGZZqJA=; b=ZUfQoTKy4YMGJVAvWadkCk095nW7+Y
	cvf7zRLzH3KOP7pfv3nF7TZLEpk9Nq4BDLew2GVB1cHzyfowi8FBRL8HHxBP+7zR
	BJXEnqzu7QOYARHiUqci4jgpSN08192NVivnYp+1e+yepi6BamhUm0CtEt9kzpS3
	xkLevNredW08Zb9E2H+xpV2ehWJsnhxdWeVUhHZnP40XZuHThCslmHvG8CPDPAM1
	qxwzZqOV9k5D8rzYs93qQmwr87Ua9t62PIoIstxjzmzaswTYtJ0ucKki95VqIkxj
	HWG+01NcWjXGVJ+N/KUeZ8aGkIF+EC3qAF2RTP9CcGXN2Ul1NkQe9dkQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T53pGT034817
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhhv-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbQQPi9OxNAMAWBxKpsKXoz0Hml6hKlR0e3iYzoxc9w6HUPuVWdN4ZWHwVJfpcYaC6JZhoAmJIRQDJJpUh1wJqySZlAf+RSllFWZoRUibwuOMf/kuBZIm0yDaEkWX75HGUQbi+waQyXuVxOTB8ZCTt0iKJDgtejw8lTtQ24IHj5ogB3um+ONVwJX6ichDBoR6x21JDPP8Cr6HxGhTCf68rGGKIXUAo/CADPBOJlmpJlnJusjfJ+hp720Jeh4owLos6m6CarCUpCMu9mjt7aIG/4J2TZ75hBeKSd1InamyIp2yU/dkKcqHZQ87WZEyqxLuPauTdimsGpgsG7xbz4A9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhTkjp5agWJ6g1yb7SRDRqk47FoURGQK0Y/IKGZZqJA=;
 b=y+Nmh5CLjo350uJ+NC8mfsS28V8TFHy7byKGU8V8ud+M0X5TfS5souEY2yhyjm0vSuETEplkh9HLLCcYabXEj9u8X42khRieK6UBUJGGqwwTLVzceRzDrbG3I6foDU+Yzuz/1IttbnRg6e4KXEkRw9hSpNbh3+tuD5SF+eQNu9CWawbtUz2osmcPdr6O6PGw1bAlefYhWuBjBRcICDZx5oySHBLkbKAn8rxfJ3YIRrYN31ghmu4eUu/ZrpBYZYSXULxu04uFplVd44V22Dmcc/sSkDM5bkgvKPk3QYnlFXLmODcghy9M9IhVtKfqtxDrI5Ra72TQcQYNGDFosBf27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhTkjp5agWJ6g1yb7SRDRqk47FoURGQK0Y/IKGZZqJA=;
 b=0IbcS4wmE5FHtWyWDT8O9uWmSglzn2ApFGD0GntK+PEh3DM2nwQeAUvMutSYnhhw79Oc3bqGhzNVLDkYjYqAyZ04vDng9zaHFuyu6tEVJ9RWlbusIp+TrtyzMokr2/S5QlA42dRxlPIPVlCgSkVWeIex0c9L6CPiBglROMkioIY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/22] Action clear() should clear only one aggregation
Date: Thu, 29 Aug 2024 01:22:00 -0400
Message-Id: <20240829052219.3234-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 6254e74a-b18c-4cce-a167-08dcc7ea900a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VjYT9FoA2mwVnB3uEmjskXIUAetMnDc/QHmNmrP9QKG7V4QuboakdaqHr314?=
 =?us-ascii?Q?o7xppj6590Kj0EN7+7MRuWINit+793ANSbU90FM4ZaNBjwrsq0a7gehZkBo6?=
 =?us-ascii?Q?Bbmx4icQ4Ia/RxdD+ctO7DffrC0zpA81gW5+z3ThYqEb+va5JNqL0XzberDs?=
 =?us-ascii?Q?R6JH8by9UbhTyE39b4M2hL/yzvw5mvjIPfnBSLq4t8yipo3gg9vaBdbpGQkm?=
 =?us-ascii?Q?GZxXPhzwbdHZSVz30v6DOBANDJZyqpxyyuokletzpyvD8OGgnhELnQIibgnv?=
 =?us-ascii?Q?R+vXMJOskenr9zk8PVq4JGsk0+eoceNLqbbR68ajDGICuX3VFgojASPDfc8s?=
 =?us-ascii?Q?RnaH1P3kVgUPSD7OD5xxnTFs9iT1+CV5wB8X4N7e9awDvKstC73kSb5BJAGE?=
 =?us-ascii?Q?GgBdcrKchKtBnQptIJH7FCw6PZ+YfbvRFtQRcCDCtNcUUh1KctePqU/NgA2E?=
 =?us-ascii?Q?25YCtvqRBIuGkNbkzk4FNyTAB+9VG8hVC/NgLQ53d4Gl2oNEsUugGRcbddZ9?=
 =?us-ascii?Q?m6KYE0XcPSvxsyO0Ej7EVDkAzXCaGdICmxQ5VtxYc6lapY6Ti1UEbvOGb0m7?=
 =?us-ascii?Q?5RnPm4xhVb+Arm8PThfSCxJz1/zrsTPhVidL8iXdZggUtRd08dpNz73QrPh4?=
 =?us-ascii?Q?UISVKPip7URhUCa/lJ1X+9ZiEcqKNHz8/ite6SQle1p66IP9PxvOikucv3FA?=
 =?us-ascii?Q?s24ZfihRNJU9OGOEVL9LBhRLuM5yN0YGbBiRESYFJWJai8YPaVgZyp+RSOH8?=
 =?us-ascii?Q?qVCjF0/z35p7JFpk8y69k7vHj5Dm3pbXPF8CSEu2m2popaK1qFJflv2VGYkl?=
 =?us-ascii?Q?QLkQYQypZRqgPgsmtlgSotyQL7hy9rCW/Rb37NeG4Ej1WyJ3FzQZb1NGIeap?=
 =?us-ascii?Q?5mn+BDkk74HJObGadRCSGbQbH8fsFjVhBfnMMA3tAycV1T/WQL1lGKxck7I7?=
 =?us-ascii?Q?eZ3DtH05Mvtt1+SsOtkhZDvtWVB/pCosYofd9v+wwrlq7LD6fV0Scn4F3cwk?=
 =?us-ascii?Q?O3kvVKs4aZ/SVjYaAJv36u+YOUemilEZYDHxpmvWn8qLca8/MLQvg1h43tM1?=
 =?us-ascii?Q?D+3opIWeNdlB3dp1h1iPG0VKJqLsqmiEibIj5FKtwGi2ZA1Pjr4TvZgLqk90?=
 =?us-ascii?Q?1daHtS/h2SCxFYnyk1v9i1nqw5Avy/e33/zWg1PIbFuZY471mw1an8i3ULRS?=
 =?us-ascii?Q?HCbHuZmoE/maFmay5CRmXLzvcIKIXVWQw3j5GNoQYiwggXsHFCgMnY2jbSG7?=
 =?us-ascii?Q?kmazqg/3wkWN8YBH0fnwBpwBCSfqqwD9w1SECs0JdkmP92Jp3/LxTDLKlcK/?=
 =?us-ascii?Q?HFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fqb8nEkN1ieyFgUvbWVOgv08qBsPMMdmlSykmDSrNufDr1aF61wABQwy5END?=
 =?us-ascii?Q?3dYEKI1vu0df8mLViui8T8jD4ygoHLBVPGw+raWBnfV0rDztOXRPPEWko42C?=
 =?us-ascii?Q?R6t0o/BZ4QCni93uNQiVcEzN/Puji8ZPEqNQe0ORfmTwtwjYyzT1TsMLPUCi?=
 =?us-ascii?Q?5HyDRVEDnr9Ite+0YuFVm2tntIADO4iwwuM5EjA+eoVNYV4L5LDhJ+wdjomS?=
 =?us-ascii?Q?qLFp1IZsxtZdUSLuhwrk5HFObEJ4/g+3ib59ui76XSlJRQ+zAhaL8X9foBHj?=
 =?us-ascii?Q?ewXZfH1/NG4DXTwB+/ncnBve/c8zHE8rNsmNzkfesMSyoFK4gaHZMGUEjdCX?=
 =?us-ascii?Q?/SAhwrt6ZknSEOkAHnKlt8p/uuTc22F6yn2YeKC2IkJ288hvIAvgjvyJQbWU?=
 =?us-ascii?Q?F6R0Y+F1cFeQLsnrB6POVJujorsPKCEMukVPPC/cA7IsHTrbzwp5XXjp9aRP?=
 =?us-ascii?Q?mDyI4qQdyUP/vC4YZeDfaXhA6TutY2I1E1T+nh6BqcvUmldIBqaPATRXVGjL?=
 =?us-ascii?Q?+rZz3hp8hbU3xrd8f3iSXgXg2Ut608e6RhjMYHjTu3qex5VuQAEOudoWdqLn?=
 =?us-ascii?Q?BysGyBVGTMbXZldklXTmRaACJwIN6TqU5OF5j04H0UFXxOoOmeMG4djuYNCj?=
 =?us-ascii?Q?ykwE5NEsVJCKlu2fsvtkAn1jxF0a6xBY9A1u9RHpIGiuCLdagJh4FbyyQ3eE?=
 =?us-ascii?Q?SqtfRSHVRKKf5X1LSGYTTVxzJ/48CPuk/FiQK54VGAQbJez6urahrBKTAi+B?=
 =?us-ascii?Q?WY/+DKB8cst+Q7P/Fj4GdCry2TDgVUVJoxG3Wb8roSJOFvIGqGmV9aG33WFR?=
 =?us-ascii?Q?jvi22YhZ7HvLvepkGNB4xDBd2TuU5aFyJaEh2E5qvN9uwKlYEP6R/kkd6K2j?=
 =?us-ascii?Q?f/3cVB6Hh4cFXarQCyT1GZ4sW2DWlGT6d9seH82VJRY5oNW8swppW/nZGZLy?=
 =?us-ascii?Q?DrjWheqA7oLj+hZ5maCDCxJ/k9nqjtlKfkVPKIBix+en/wP2CLaPn4bi3gcA?=
 =?us-ascii?Q?R31JLdWVWqlMNTsklFm98RObQURrgkoCHaOw91KNA7IJzJzkh/cEif5c4o5i?=
 =?us-ascii?Q?0IuToLsK3I/QLa5WgdaSEzg5TXanAOL62ghZWttznOevigynZVJR+LCWShOn?=
 =?us-ascii?Q?Y0I8Fgb+moOJEVJMA6eAY+kp+Y70XGFBl0knh105H7AYltkix/mKLcnEBLBS?=
 =?us-ascii?Q?D9wobFBsl365CRNeU8TsY6rGmVFgd0RE7BnFP3CMq5sWe0/OEMt+sR0lZ/65?=
 =?us-ascii?Q?eKb4WSngg+4X+HyUe+2KktmpcuyG2EIv5T3luGPKqKzIKzVC5hrqR2J6LQJb?=
 =?us-ascii?Q?Nm/Tn+LtKUgrvMWkbW97++8b8ZGeDH/waVpwRtK76iNGlopT/4zoscNVKsd2?=
 =?us-ascii?Q?PBPAfO3w4ovOBtvYFIT3q8U7rXBXiLH8POvHszFAR2QMIV/EdCqKut+qDyB5?=
 =?us-ascii?Q?tgVp9kCFSzLcWl5dVdraC2O16/z+jB+zRTO4CZelhUXHzjOuvymH0Md3+oX2?=
 =?us-ascii?Q?+Bf5al9y/JJNSC5/2Ajg/UydAjcQohZS/WH/nHEp2YLQwz4ovlh1Xczt3aaf?=
 =?us-ascii?Q?vEudZfklA0ezmTCjHaCdeUmVrEKHq9VcndaIV8ef?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pu5A3MLV7rWYuybcrKsqR8XVWq4wo6SQwrax76977mVo0WEaCLhtzd7VP0hd8/5FVRP0tdAxkr59YZ/f/cetGtBEDSnAtNYc+UMGkIC4iPrz6PzqzsI5i8OKWkJdyN7LQMiSdq6AQLVCAYcVhFQZ4jHhE1rf7y2yk0PzgfGVpLkKk0PhICjIz5c0E5wI7pkCRDkApz18sVSh0QwMwZ04+/Yb8m4uHrhxgVG/OUEAyunE4dy2KKVMIcoFxomnIiMqSnw4xABmw/mSdHBp8ebPjYOfFXKJIkQHm9rp/ye/5n7rrgW920cVHeoDV2o/KuSbwHEDElVwdflOO1A6j+74kN/nH75SrN9g9LjEtJj6KjjtZmZtEHuf1zWfqRTTN6stfHyGDwfQTip8QRGrwyy7b8EIc99ZEEhyZFeJCVyMFjXU6I28RPZuqtQBlUpcOs0CpEfopoqYG+dKPM89yF7ShFEedXD+CMQehqadXCHM5jdcrxURZkTdoAYq7oNxINQUC5I4q3MMtmNitDrgNqA18bYRjlS84b0fl5eHG3y43YQa47t/c5edYwlm5efvAdVmFFNCLYgfhOAOicDM9lZl5QBTkU3fqqgdEQQddgx4qxs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6254e74a-b18c-4cce-a167-08dcc7ea900a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:23.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cwA4HWbO+2sda43II/mP1MxTx5z+WQMvTM3NDFdQ2AOFh/1nvOP5vViIIMXpu44KeRM9IO62JcMs1CUOks9Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: rgOVHzHTp9CZZbcON0n0Iq0tdsUZnGbK
X-Proofpoint-GUID: rgOVHzHTp9CZZbcON0n0Iq0tdsUZnGbK

From: Eugene Loh <eugene.loh@oracle.com>

In dt_clear(), we:

*)  extract an aggregation ID (dtrace_aggid_t)

*)  increment the gen counter for this aggregation ID

*)  clear the consumer copy of the aggregation, using:

      /* Also clear our own copy of the data, in case it gets printed. */
      dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);

However, this clears all the aggregations.  While the next snapshot of
the aggregations will refresh our copies of the aggregations -- after all,
dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
-- if we print aggregations before the next snapshot, we would display an
erroneously cleared aggregation.

Therefore, change dt_clear() to clear only those aggregations that
correspond to the specified aggregation ID.

In order that only a specific aggregation ID can be cleared, we
modify the last argument to dt_aggregate_clear_one() to be not
simply the dtp, but a pointer to a struct that has both the dtp
and the aggregation ID.  The previous "clear all" behavior can be
specified with an aggregation ID of DTRACE_AGGVARIDNONE.

Though trunc() appears not to be similarly afflicted, add a test for
it too.

Orabug: 36900180
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c           | 16 ++++++++++++---
 libdtrace/dt_aggregate.h           |  5 +++++
 libdtrace/dt_consume.c             |  4 +++-
 test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
 test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
 7 files changed, 110 insertions(+), 4 deletions(-)
 create mode 100644 test/unittest/aggs/tst.clear-one.d
 create mode 100644 test/unittest/aggs/tst.clear-one.r
 create mode 100644 test/unittest/aggs/tst.trunc-one.d
 create mode 100644 test/unittest/aggs/tst.trunc-one.r

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 329b8ffa..8825739c 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -504,7 +504,9 @@ dt_aggregate_clear_one_percpu(const dtrace_aggdata_t *agd,
 int
 dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 {
-	dtrace_hdl_t		*dtp = arg;
+	dt_clear_arg_t		*dca = arg;
+	dtrace_hdl_t		*dtp = dca->dtp;
+	dtrace_aggid_t		aid = dca->aid;
 	dtrace_aggdesc_t	*agg = agd->dtada_desc;
 	dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
 	int64_t			*vals = (int64_t *)
@@ -512,6 +514,9 @@ dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 	uint64_t		agen;
 	int			max_cpus = dtp->dt_conf.max_cpuid + 1;
 
+	if (aid != DTRACE_AGGVARIDNONE && aid != agg->dtagd_varid)
+		return DTRACE_AGGWALK_NEXT;
+
 	/*
 	 * We can pass the entire key because we know that the first uint32_t
 	 * in the key is the aggregation ID we need.
@@ -609,7 +614,9 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		 */
 		hgen = *(int64_t *)agd->dtada_data;
 		if (dgen > hgen) {
-			dt_aggregate_clear_one(agd, dtp);
+			dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+			dt_aggregate_clear_one(agd, &arg);
 			hgen = *(int64_t *)agd->dtada_data;
 		}
 
@@ -1859,10 +1866,13 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 	return 0;
 }
 
+/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */
 void
 dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 {
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 }
 
 void
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
index 4f8d09bf..0dc126e9 100644
--- a/libdtrace/dt_aggregate.h
+++ b/libdtrace/dt_aggregate.h
@@ -12,6 +12,11 @@
 extern "C" {
 #endif
 
+typedef struct dt_clear_arg {
+	dtrace_hdl_t	*dtp;
+	dtrace_aggid_t	aid;
+} dt_clear_arg_t;
+
 typedef struct dt_aggregate dt_aggregate_t;
 
 #define DT_AGGDATA_COUNTER	0
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 0e30ddbd..f2d5cb74 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1552,6 +1552,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 	dtrace_aggid_t	aid;
 	uint64_t	gen;
 	caddr_t		addr;
+	dt_clear_arg_t	arg = { dtp, 0 };
 
 	/* We have just one record: the aggregation ID. */
 	addr = base + rec->dtrd_offset;
@@ -1568,7 +1569,8 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 		return -1;
 
 	/* Also clear our own copy of the data, in case it gets printed. */
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	arg.aid = aid;
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 
 	return 0;
 }
diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
new file mode 100644
index 00000000..f96c2db0
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Clearing one aggregation clears only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	clear(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
new file mode 100644
index 00000000..101d173f
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.r
@@ -0,0 +1,13 @@
+
+        3                3
+        2               20
+        1              100
+
+        4                0
+        5                0
+        6                0
+
+        9                9
+        8               80
+        7              700
+
diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
new file mode 100644
index 00000000..0556bb34
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Truncating one aggregation truncates only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	trunc(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
new file mode 100644
index 00000000..a611026d
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.r
@@ -0,0 +1,10 @@
+
+        3                3
+        2               20
+        1              100
+
+
+        9                9
+        8               80
+        7              700
+
-- 
2.43.5

