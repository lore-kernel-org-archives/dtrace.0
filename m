Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5D1DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150314; cv=fail; b=LjeYDFUXICrfx83MTZNV/VMOJ0qALUPA/PZfTXfJLtohtFoAKaPJ4PXtTo7XMrYUHbhCCQXKSm/UgZ/hII/oXm2yaZYZ2W8vaE4LBhkGJqBbk/Lqh+15PdHS7r6eFMuOQue7u3/3hLK+60d3DylsV8RP9KQiS/a7fageZmvZm2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150314; c=relaxed/simple;
	bh=qfSWzm26hE80JI6GewHH07L+4vC+JFynmpT0z2Y3AMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kgRKlASA2Wrbwy+TDqqv9UXUhy8OYwE7xeOKA5B8kxTo6zp9C3UbaPKwSBg+3gW+BSAuVyfFsgthwhpzlhL07TatYGAQpYcSKjLPZIT8iGy3iHrJnlzikrzPj6fGq8b/NiLRKPSnsDc6i2gtjNiD4rVr8opPGugLO3ZpYsnMSxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fGuJ6CEy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SfOjhQ7s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fGuJ6CEy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SfOjhQ7s"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaMm024336;
	Mon, 28 Oct 2024 21:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=; b=
	fGuJ6CEy6Vjn/TW807ZBS58mGx5ZPKkrMKc4J9J2ODJuzc8zY4l4SngrL0fk1ZbE
	1Y4SkY2vRxk0wNAZfMdWeikOtsk3UNXk/h1gj+IFq5+p2TEvC4ICLqn0qNfPDp4Z
	OEx1mVKiclN7tW/y0yVcJx1qTmgOxUZSdYDh93PTXBoYaCnfVao5Z3M+5Wxkk0Y1
	XocUcUQrAfAg19mfxmQpKQcr5A19Nbc7zSlq5y3BWI1O0+Cv3MLkXGrb8TBnEY5m
	qWpWsyNrGqYA3tvdJYJXvRZvCkWK2s0lvH9wp4MiGXQfw56rZNN2H5iT6KAwk1P2
	2vIVwhl7a3a+tovbVRwbpw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqby7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKVPCP012478;
	Mon, 28 Oct 2024 21:18:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe7fp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6F3M79cZOO+xl0xuukg4g1ff/62gSH9WVUyw6s9kUbJVQKhXlT5L/5242Sr0GD8oMmBYZ45FFD+SHF3/A4gAy4aNzAK3saR7OYfUhc9q304pz1GczXeguVUAVZ8yXdaUmSTKWyjWiMoAIpT2wVw7Mp2OKWz1qOyLfGaG0+UiZkvrCjGQ4OaQZqVG8ypXxdtxDlC6V32ZB9vdYUbp4ekbeRtH4c/hnKSyc4pdc5zAnkkecd2teohxG3GzVEpR4Dx7O7FOGFohXw4b3eTtaelenVUin5KKTfzYd/8foLDa9J4zWnko4N/tL95Ni910alqVY8xYgIVY24vZSPRtkoPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=;
 b=eTtOYGOhcPw5PlFuKUWyQV6glbFn/MzwPUV4LOiztxNSE2dP4xZei7RbuzqbgD8yZQdXX1RaXNh2a74sjGD/9wX41Yn9UtR+DKpar1bCAlGYRoNsjKu3F+4IP3FOXoq1rxxT69FNmS8MRCKvfsllnNnCi9gFAauvKU5V6+hznOLGD/7KbNbU/pGjAM7LZcil09ldEeMQqBO8R+k2ATToMDSc4+4fgl3dulrnrang6ECuQa3zrvBLm7odV/OxrnsYIYFZhI2D0/Lht79tZBDkFMoe1jZ0rwOP7RM49X2RuY9IYvr8M3PBkcDG0+DTjH0VuV2yPEyNQ6V2gxDQsRiO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=;
 b=SfOjhQ7sf8UJ8RAHtRo1CSzeRCmV/NnPaJ5qOF8JO1ryoGL9dP0zvUqgjINMQ5ZvAZsiK/ZBaKFe2oE4yce2v3rR//HQXIn3O4Rk+QWtRSGlCha3OYT6OsCows8TDCt5QoMCPC7HBkUDD9Chz4RAAq5BQmULuxxBzhzNHhtVLxU=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:24 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 08/14] man: use \- for option dashes, not -
Date: Mon, 28 Oct 2024 21:17:57 +0000
Message-ID: <20241028211803.458685-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a172ba1-d375-4370-673a-08dcf7960e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PeKBZHADKpdqLr9npYWyRmKoLe0KDlUOY317ayn6G4zLNHI8G1n0QkawRzyu?=
 =?us-ascii?Q?2KerzqoEMNsYJ3Co85bgyU331N4ADV01qAufp60WS1fBQndDTNJJQnsZyh5f?=
 =?us-ascii?Q?z9JKQiByCDHCMVeKQHoHoA8D1habij3KKbrUIXWhYlEo8mzS5FDLyWvEDqlM?=
 =?us-ascii?Q?LdxP69tAqARsZRH6A8t9bDq3Z00gsZ0ct6WQYyoHIzbmkSujkUdeL0+W8/H4?=
 =?us-ascii?Q?WcMqxz7ERhi4smrPjdP08sm49LvUKYxETDAa5VAWbPu2CtSlqho+z66huiZ/?=
 =?us-ascii?Q?f1MCkcZupcSLgD/h9Su76bnhtBFHioEGiHnRDgSmQycbJbJKGsxeJ1c23VHe?=
 =?us-ascii?Q?PkqSi1igiVqAMQynX6zH8WuZ915391/2UTJIlEcRSiG5HBp5Vwt3X1qUplxH?=
 =?us-ascii?Q?3jUiCR6rs/wiTfIQfOd80oeAe9H+OBJqKXxZfJh3exedfmFeGiZrK7xo5FRE?=
 =?us-ascii?Q?IY9T8Qvdr2jhCU9CEw+DpGYykWVJ5Co9bbyHa5nd9bSe28y5C7X3rR8bDXro?=
 =?us-ascii?Q?BeUX5gmMpXKkkudYbXKqXTPVBM9yUwRkUgFfi/wK11y/hceK4pZHBelfXC5e?=
 =?us-ascii?Q?pZNXzsrE8aIMN0bBQ7sJ8abfi/6RGSpbjaMNZvZ9B3fqAaa7J0iLK7r52XW8?=
 =?us-ascii?Q?f+eqbUoc/ax5WINFe56kvZMWBpLF2WH3UoAn/GXuBsY9vmZRqeVokRoqzUDm?=
 =?us-ascii?Q?+FyXTQNulo0KvUzokmah+cacA4Jh20ZumPCqv+VyCa31R57scs9jtDPD39a3?=
 =?us-ascii?Q?1VcFyHej/gtF/VqPrp02nK2k//pt7V7OTND74Z4fwLlMnUj9SoDgNZfNrHPY?=
 =?us-ascii?Q?fwtcqaMwt0NhMZRaaR8vL2eDcHop2nGo/+1bqk+1q3bFWd62FDmf8gO1Pcj2?=
 =?us-ascii?Q?xHrej4owqfgDNlcVdTlmVPKZGiFnNxgegCVP1j3ysroNaRjfsJrTNyXmzfFb?=
 =?us-ascii?Q?ZFLN1THLBvKDC23JKyBbpY8kQ6mBq6yeJ8FLkQSlq9aAs+nP1JLjPq1E94di?=
 =?us-ascii?Q?shPXjHanOYCg5RTZm14MGBkSIxS2KCwukcXGouRQ7lyXGcfXwuMMMbMs1k/Y?=
 =?us-ascii?Q?xoItKy6B9mK9O4b7xDsJay+KBQPRnofLLToVhTwts+dUvIfbstyjsrHqPmg4?=
 =?us-ascii?Q?z7I5y5pVbKOg9X6oVUY46uesh/RP0B0LA561pf0raDhmN07F50djbv29ujPQ?=
 =?us-ascii?Q?+fA1ZCr4r/m38seIrMjr6XiPOjp6FxqF6wRlj9yoe7u4+0E3DooK19hyVA2d?=
 =?us-ascii?Q?f7kQ+TxMd3LmdSsMSyKVmZPJk9jkxqekOrYn+1KTQVxjusVzWAkYIaKj1JJ7?=
 =?us-ascii?Q?KDWl7GWjFnXQf9knDxSki72Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebKLa39d1M/yw9KayVccSm649fEsBnYuzdoQpGC2J6NoTrtvVRdvZPLG3OTC?=
 =?us-ascii?Q?ThgA6A3nSP4mTWBY4RPOAJ234FKtoy9bjAMD+CbczR5P56MdDwvVSWU6yVqW?=
 =?us-ascii?Q?zN+WNtFvANfT8Cs6mPB9M5wzrTb77C7RHNE/CgQk9isodC0sDuNGrD0AtFYb?=
 =?us-ascii?Q?Jh9UFrX6tC9bJVVdtQCylVdMu0LnE8yKjj/F6bizEKDQu33ikCQq68voD0w2?=
 =?us-ascii?Q?KgVgnaGFJGASbHvp3INjzLPqfA/sp7V2LarjMZ434KUgeQp27AbI89KNgImw?=
 =?us-ascii?Q?ra4m87QEgFN0+JeD4EAaCZnMY6052h6Q01zrXwXIWGT91UH+3uFq3sd3ClBB?=
 =?us-ascii?Q?wuqJyN2MMV8mqwZiO1bRMzZMV+fAKv7x9qWaaVo4u+7Fz24zMB+cXSMG/fT0?=
 =?us-ascii?Q?nS/ED5hZ4UsEiRrpvZYi+l8f3SJMMv958vI3ldd8m92ynnyWyJ355yBQ1q2m?=
 =?us-ascii?Q?yz2Bb1RzhbbDGi6WbU9HiPUrzyfFAmldABEnMC9LeMuNAzTQw1kZYAEEp/eM?=
 =?us-ascii?Q?zH0ZhJolxSCtnAVEiVP01KD1HEmm3V2C5hmFxrw7KuIfOVosWENnnWFSpK1X?=
 =?us-ascii?Q?ABfcrRcKV0v9KdhWB0SAgjIJOZ3EX07Y2aTeJRqLup2NzvNaJZE8dBHZO1FM?=
 =?us-ascii?Q?ZW3BCHlmyozAebU0OgfQ4q5nj3AZOEv3g28Du4qyUaI/TQDv5OqwB1gj10Ha?=
 =?us-ascii?Q?g71OFbawVH4QGgiiWH5qPMpeISmsdTQHp7GoexojWasVyUl0cXfopsD/lPbY?=
 =?us-ascii?Q?gHKY0z/mf+MdoA+Snw6N37gLF61s51/uruDzOPugvLiWVI4iC2/h6KoDd8pn?=
 =?us-ascii?Q?qyf+g1xR1qA1a8eDskQ+UXIkuc7ysXVG8qsyVwTl3q9hzoF0PupKcxlKB1Jn?=
 =?us-ascii?Q?P2dSEzo54yVQ9OavWS2W6xLAj1vyXRyUFU2JlcvymkGrDSrPisiOglJPHX9m?=
 =?us-ascii?Q?dgVbxpmbkO+xZ4aUDfdfkoPgd6XkfwE2eY2BpmcumbcOvEvcB6z8sj9/H+LH?=
 =?us-ascii?Q?fnfB7prv2+XrzcWp3qUZ7WQJsAfuBavqpetJppBgpoUIr46l93DFiXaMF/Mr?=
 =?us-ascii?Q?pnQPPq18TiNGGzTEKLSk1vCu1wwWByElrVxcUqvnT8dElC6H07BqNlO7o9jK?=
 =?us-ascii?Q?U2LqwuN/JMAXmA9W3sXShhIpVBvV2hhe/OA+OQ64M+GOmmL2IeJPTlg0igQC?=
 =?us-ascii?Q?mMRPqRXKAbpb4UMXKIrBOGw4f3kPSGFR9VPKh/Rv241xJm72XAMkh1VeCFKH?=
 =?us-ascii?Q?5eT/rqjt0l26YLpZfZZ8ZkC+2OGdrmW669aalUs28FMrZikYeJBbWBklPcC8?=
 =?us-ascii?Q?pUq1zlMlAShnO+TRPkCvsQdQfBS1zkANHgcU9662D2f0oTOQzuyrIozAp8aw?=
 =?us-ascii?Q?9Gr9vFWuHxYxY8c3QS4ABrjONaV8JQ8jShmUGMwEuYvqTC/86BM4Hqi1Lgk3?=
 =?us-ascii?Q?tZG1aHktfmVA7LL8bX7OWXp5YNcBF1G9ufVhovK57TwPpwqeqNL5CZn+l73C?=
 =?us-ascii?Q?C/52C/PPKE/XcwyieTJjQ/+iZOva6NL/kVbpAoBdNvYPc66wRxaJEHMo+W09?=
 =?us-ascii?Q?HTOglM0ysgrd8a4Xa+wEUS2NKekKqmT0QKr2tuErMrqyHY0jLYMqYiXM3CAZ?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZoQeBQPRVOuw48sDA/FCQ7GxiFkWeCuKVA4wsQgvjsOOOkpXiZ7bvh2GH5QYLow8ryHZY0rLYIQob1MVco0xDW3DLoIuHcnVuJcY7mk8vtzcJ7yICLovVYpq2RBsMwjPmHMF5hbwqi8fTOt7DSSIUm+Y5JGsmi8vF9f7Ac7w+eXeiq2pWM6qQWNXnTZL3lYYJ9ad1OSK1GalE9bCBtgchJCMNGPv3IKJHOYZyYFP5Gf3wVq7356HPM5u/tALOmkokn0LWiT8evNcqGoDmJaFVDovVV8BmbNIa7OymADFBG6FFs7zpoqm4yQgJSFI6RSbGWjC/zrU4E//p2YPvLdvwL3hvIevQMbpJ36sdBrLJzhS29Vt2ti5OuQ3lLbkslFzXyvkZL9TTGuPsyxAau931KKVlUXYdJgftT3oDHIlYDQLdaFmDVCSdu2KeLTd996feFa2maUr3ruZ44g2YILigHEmArFD8+LiPopWw3MwQu1c3Z4hSdIT4IsMHNh+JMMrBq0O/lZhGT4cr01NaBKPnG39mvcShI4F+enoTVFUat9i78jDxmaZ/E14EhZyGw7ngmVhh1+pXeHX3889whrx+JFG2neyXQJ3Gh9DamFqRtk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a172ba1-d375-4370-673a-08dcf7960e5a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:23.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+tU7BRnAtKxxD0Us18qM+ez2eHc3Sww5ZGWjoKqtwKKgtYIATyufcL9ngX3l11n+i1/wpgyvWw0vB8fRzMaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: Rp2drtcPcL7I5HY3RWj5MczoI4bSodib
X-Proofpoint-ORIG-GUID: Rp2drtcPcL7I5HY3RWj5MczoI4bSodib

- is a line-breaking hyphen, almost always wrong for options.  (Its use
prevents the option from working when pasted into some terminal
emulators.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 116 +++++++++++++++++++++++++--------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 940ddfc65d1a..a53632949e72 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -57,119 +57,119 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, and \fB-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell. 
+The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
-\fB\fB-b\fR \fIbufsz\fR\fR
+\fB\fB\-b\fR \fIbufsz\fR\fR
 Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
 .TP
-\fB\fB-c\fR \fIcmd\fR\fR
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-c\fR \fIcmd\fR\fR
+Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-C\fR\fR
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB-D\fR, \fB-U\fR, \fB-I\fR, and \fB-H\fR options. You can select the degree of C standard conformance if you use the \fB-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB-X\fR.
+\fB\fB\-C\fR\fR
+Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
 .TP
-\fB\fB-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB-D\fR option to each \fBcpp\fR invocation.
+\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
+Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-e\fR\fR
+\fB\fB\-e\fR\fR
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
-\fB\fB-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
-Specify function name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-f\fR option on the command line at a time.
+\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
+Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
 .TP
-\fB\fB-F\fR\fR
+\fB\fB\-F\fR\fR
 Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
 .TP
-\fB\fB-G\fR\fR
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+\fB\fB\-G\fR\fR
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
 .TP
-\fB\fB-H\fR\fR
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+\fB\fB\-H\fR\fR
+Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
 .TP
-\fB\fB-h\fR\fR
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB-G\fR option. If the \fB-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+\fB\fB\-h\fR\fR
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
 .TP
-\fB\fB-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB-l\fR. The \fB-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-i\fR option at a time.
+\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
+Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
 .TP
-\fB\fB-I\fR \fIpath\fR\fR
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+\fB\fB\-I\fR \fIpath\fR\fR
+Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
 .TP
-\fB\fB-L\fR \fIpath\fR\fR
+\fB\fB\-L\fR \fIpath\fR\fR
 Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
-\fB\fB-l\fR\fR
-List probes instead of enabling them. If the \fB-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, \fB-i\fR, and \fB-s\fR options. If none of these options are specified, this option lists all probes.
+\fB\fB\-l\fR\fR
+List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
 .TP
-\fB\fB-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
-Specify module name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB-m\fR argument can be suffixed with an optional D probe clause. More than one \fB-m\fR option can be specified on the command line at a time.
+\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
+Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
-Specify probe name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB-n\fR argument can be suffixed with an optional D probe clause. More than one \fB-n\fR option can be specified on the command line at a time.
+\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
+Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-o\fR \fIoutput\fR\fR
-Specify the \fIoutput\fR file for the \fB-G\fR, \fB-h\fR, and \fB-l\fR options, or for the traced data itself. If the \fB-G\fR option is present and the \fB-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+\fB\fB\-o\fR \fIoutput\fR\fR
+Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
 .TP
-\fB\fB-p\fR \fIpid\fR\fR
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-p\fR \fIpid\fR\fR
+Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
-Specify provider name to trace or list (\fB-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-P\fR option on the command line at a time.
+\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
+Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
 .TP
-\fB\fB-q\fR\fR
+\fB\fB\-q\fR\fR
 Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
 .TP
-\fB\fB-s\fR\fR
-Compile the specified D program source file. If the \fB-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB-e\fR, \fB-l\fR, or \fB-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+\fB\fB\-s\fR\fR
+Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
-\fB\fB-S\fR\fR
+\fB\fB\-S\fR\fR
 Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
 .TP
-\fB\fB-U\fR \fIname\fR\fR
+\fB\fB\-U\fR \fIname\fR\fR
 Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-v\fR\fR
-Set verbose mode. If the \fB-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+\fB\fB\-v\fR\fR
+Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
 .TP
-\fB\fB-V\fR\fR
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+\fB\fB\-V\fR\fR
+Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
 .TP
-\fB\fB-w\fR\fR
-Permit destructive actions in D programs specified using the \fB-s\fR, \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options. If the \fB-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+\fB\fB\-w\fR\fR
+Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
-\fB\fB-x\fR \fIarg\fR [\fI=val\fR]\fR
+\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
 Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
 .TP
-\fB\fB-Z\fR\fR
-Permit probe descriptions that match zero probes. If the \fB-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB-s\fR option) or on the command line (\fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options) contain descriptions that do not match any known probes.
-
+\fB\fB\-Z\fR\fR
+Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+.
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
-
+You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+.
 .SH EXIT STATUS
 .LP
 The following exit values are returned:
 .TP
 .B 0
 Successful completion. 
-
+.IP
 For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
-
+.IP
 For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
 .\" .RE
-
+.
 .SH "ENVIRONMENT VARIABLES"
 .LP
 The following environment variables are consulted:
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 
-Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 
 .SH SEE ALSO
 .BR cpp (1),
@@ -190,4 +190,4 @@ Options set this way are overridden both by options specified via \fB-x\fR on th
 
 .SH USAGE
 .LP
-When using the \fB-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if , for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

