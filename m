Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653AC23D7E6
	for <dtrace@lists.linux.dev>; Fri, 13 Feb 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770995665; cv=fail; b=dV9tQdrdimgrZOrtSf5evdzi8RRt/94h8jAGxVS6gbW3T7aQ027nmCz+NkVIcarNUnaeFuAKYSo8AThyDhR1OGciMO1cBqhbXBxiHr/EusC2f2Dx65WuqNsQ4YnQqPvwEgh7LVJAMPdNBwFLUTX2kMIe/8s338j+U2iko4Pcjvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770995665; c=relaxed/simple;
	bh=5X6pJ32jl0lJInnHzTVcF6iDU3/EaS4ES4W7RXOBti0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=s42oME04lEJrz7rrtUe77CYPx2SBeXYDgeEtQrw3Mfab6g0U0MEegAuQHDCfIQH6gaeRPmieAr4KUe2bSBVcjpJR0j9/+RUJsH0j88J+SI0Dwe8XnSr55r73FHgXsLLAsLh0W9I6DiRC5sTpHB5a8C14L2yh+JW47YSiowHjZlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jio/p90S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tnf/MOYZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jio/p90S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tnf/MOYZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DDbQOp3587589
	for <dtrace@lists.linux.dev>; Fri, 13 Feb 2026 15:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=F11bMPnTzM+4VzQbS4
	PrmW9ienemOKcDXE8lA49F8I8=; b=Jio/p90SMKwYoNwMxt5w/xI7ZRyPJZFWxg
	yPEUHcpulYzMehHBZ1wefwi0s38GKtsI1mUBGytxCCK9hXnYOjJLuu4DQsCZ4mG/
	1yxazPLip9h3Mcv+Dx4Sil2sODxm7R+4iwkLsiqeq0NDzaPXoy2QI3LuH3smojWI
	PdV4puJWZvFTzAx/p5HPpMlIlgWKZgLGUHdK18uzXj8HWl7ctj+8ySYvFsJkYFrz
	VQaaTFZWXNA3qJBqEr4NoVkUIiEzpsXD7UjjxQgGfWvccLY9DgWG2Uo88Avpkllr
	PO2sXUlujCv4GAXtZ++jY+pRQSCUO869sZe6YaAr6L0MAXbYOlOw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp9s5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Feb 2026 15:14:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61DF2nQS033743
	for <dtrace@lists.linux.dev>; Fri, 13 Feb 2026 15:14:21 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c82496d60-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Feb 2026 15:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+X9S2+ti6l7ngIwHAEy9FRLdqj0F+EwqoaRj1lKdxgNqYgZNZK2m9ngx/uGv2CWHVn5bTyjl99hh74T0jPhGUWP4VCvPu+4MNydWuUztrhrhYSQyumPZurMpB9TQh3AkwdFnzaVIx+u5ECRrhuScrTW+7PIt4wPj5j3HqMr8OXSq4eHv9+aV7Oe7C/PwNfoy+PIZ8gs3ALlGMBMmyB/5SkS2OWwZKi0gMlrkATumSzDuNXMCi7LEyNspvFGxT0aDBsnJyfpQzPmJOjN77TCu5suAbZ1Ec1Y5zKVe+sguUP4M1eTC5D+o/THYATmQ4sKnq+97fmbVE+/mZu8VEfxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F11bMPnTzM+4VzQbS4PrmW9ienemOKcDXE8lA49F8I8=;
 b=O/EjYBJDOFTbHu9W64TsvLFeCedK6OA9zqh1ZgyULItmQz6QP1ms2dHoFDWVbne2gTpW/hPkpJGAuI18Lzwb1ZwAXWBKYgZJa5tYopzX1bRAQN3Bdnp08EA8oGuHBzpU2vHMDvJWbvneE0fMN7op1KntnjTQvVqIRUhTGQVLA1dSP/rBTDP6pUafmBoT5wpBYnHSkXkZWLYMfY511Ceh0I9etKpNwH7ukzrxfzA7O2i2Iu8Htw2a0ClUzZQQxLQJaXDPVvUno3FFEwBeddQj4Q8rmlVfbF14ovZNRJiAsiuUnobC2+SCqt01/9HiipF68FsZZODiaWA4TpmsVv5F0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F11bMPnTzM+4VzQbS4PrmW9ienemOKcDXE8lA49F8I8=;
 b=tnf/MOYZ1msDxQhpPwhGC0vdc2JPcV8WqRKGpfXKq1TM8O1EbkM7Ppl1lw5pxmlw4Fq97lCM6TWB76gT9JsGkdp5IHQpxzo8iY1fuKV93w10P8+p9XIwNYS9cF7H5yp9ddfao3sVIvz60xDTU6tUhT+dKe/Ak+V5ASVO1R/WZjk=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DM4PR10MB6232.namprd10.prod.outlook.com
 (2603:10b6:8:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 15:14:17 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 15:14:16 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v4] Add packaging configuration for Debian
References: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Fri, 13 Feb 2026 15:14:13 +0000
In-Reply-To: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 10 Feb 2026
	15:59:06 -0500")
Message-ID: <87tsvkn0ai.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DM4PR10MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f534d1-2285-437c-a2f0-08de6b128de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUfghkhqcntlZO+A+ZSJaglycIH1tDNOVoZ131TEXg+MZMtayANSPN4HTajq?=
 =?us-ascii?Q?bVoFFEZDkqidyZ4EeaQ4peBRTqDdwDKw01SMEJR+wDAL8KxYl4Nt0xfHTzVJ?=
 =?us-ascii?Q?NSoMAfobUMr1qkY2vdiS0yicQ+6jA9FWIVvt8o4V/tGHmJqdrihR4fty8Nqt?=
 =?us-ascii?Q?sO13SkHvcycCR3n3M9xg3N6D6h5GBkHvns+iUejQ3M1uBHXTuTalOGMIMdMm?=
 =?us-ascii?Q?J60+iXkkPr6Gnh6J3AnBnSzAGQvb9E4gK4oHDG24qfFAWmYIE564DoXqGUnA?=
 =?us-ascii?Q?3OU/SFZ1ZnrCjEL8EMkCepqn7R8NeiDPVQ8dKgyr6vnzhQ8IjT8tjOj7fejr?=
 =?us-ascii?Q?cSPmD1HiOTQ+O5p9o9sJKVR8nYI8AcupqyxZ3yAY5caEXZcpDafXBQAMrliA?=
 =?us-ascii?Q?GXkfeluBRw2UemqokP9tAjg/gcTG4lWpPoX9Shzz+KTB8ntQjg0ZJW/8JkZ+?=
 =?us-ascii?Q?N1au6J2vM7MVsWuKALzjOY8nYZZidFxtl1eH0O7uPBeNb31rSw0HYUO9pBY8?=
 =?us-ascii?Q?AbB/PTxvRBdry/FqVQxuLTyow6luyAfZHJlT9a/tZKg1fDP5uFOd9zCN2wmC?=
 =?us-ascii?Q?DADSDj1GKrr/b/j0YuCPM0nN73FtpfAQcOAGRFfDeMxO1zgEclZ48h63SaE+?=
 =?us-ascii?Q?4fhoDtvU4EiEBpaudH3TA7MIKmzQ3umlL4IMuMS0N4vIhN4V0iqL6X2K3dVB?=
 =?us-ascii?Q?XsimbhqI1eu8liob4L1slgFyHnYz7BgaKazDM98TdRpARkBjB7wqeteSmVcm?=
 =?us-ascii?Q?LmGsMMZv9t0XNxdi3kBPOeSKfm8HLJsIIRODkl4Laj0IcDrXJrVhuJ5QtLhl?=
 =?us-ascii?Q?q7J662kkE8cvAAtCEHGaXnbfV1CXoweXv8PXvBUHcWEOOWd5A70Fs0yJL+tf?=
 =?us-ascii?Q?7q/IbKtAc3xHQOngD5TQu6AHHUzesBYsMxqJRhrgwGQEakbe4M5Y8mhGC4no?=
 =?us-ascii?Q?KUv1BzC1q00vefHj1q31VzQkzZLV3ZE3DASTxeKYz4CZz5srePyt+h0Lg/PX?=
 =?us-ascii?Q?u1RpZTEkIitVsxcrrWF9rJ6o6dxTFx8kjQRGKHHhRWZueCg1HRM25VR9hI2g?=
 =?us-ascii?Q?nMHXlYHHqwNEJ+cTU073Mt4n7sbcRguoCiy/L6TViexVraDFaojLr6VGaJGj?=
 =?us-ascii?Q?49EmkJQm+RQn6VWDVeks4u81Iz/0MdeH3UzUgWFOq+hQNfayIbhyUQIswoUc?=
 =?us-ascii?Q?LmJ7o1BmWeNq0V4uE8sdo5lHgZeau3yX22Qcxtm8sH0oq8Msn65Oi+HSZjTp?=
 =?us-ascii?Q?8DJdchaY5Jx9CWHyrw52MFPZKHIg+f9SFo7dtehw6Vo9rWGR0kfBfTyiEwC3?=
 =?us-ascii?Q?a4TxoTltdVmyu39RIIYHMHb8uQYyokMhlHt01g4EHsMroMDPHO2KcdKzwQyj?=
 =?us-ascii?Q?ocqdYXpzKo2OpBcbPuAw679YOR6QC8PxD8PCie6NWem52NP8fVQ1EyI5oDyL?=
 =?us-ascii?Q?jVyd0TQXNDun36dm/mGJ+G3B5XCAyk/2K+VZjXzdV5lCkNALDK4vUppS2apR?=
 =?us-ascii?Q?vASOQwHyjuJnWlLMZaKxd9UpbArSbe/ynSd9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UtD3+4HUKMMkhnBZ+VHMPYpgfr6D4JOeanSYHfgfJtGkX/MAzlE1dT7zoYk7?=
 =?us-ascii?Q?QVAvsYBPeGiEiggLnY7X28Fl4RQNHmxzZp9ogGHFcNKrTStksj2r2wudkaqf?=
 =?us-ascii?Q?btL80irbbUSjOJDhywms9HwHByJUwPum5EJHBYJPPYvjWKeeQtWgK1khwl31?=
 =?us-ascii?Q?Q5bnE8V0MdP557Dsvva59f6LCK7ixoXcY6AnqrYXr/9tEy9LLFsmF0bMEmP+?=
 =?us-ascii?Q?Iv6fgIv1Vk1wEN2MaLgxqIdUV0ySU9NBJGs80q7uUpTIc8BuMEZkxUzlBcwC?=
 =?us-ascii?Q?hvv1XmJIq3fb3k2FuyckGgBm8vAnc3nRWq9/tPvPWCLNeikJqMTpTEMdDHic?=
 =?us-ascii?Q?xKE40kTLhnEng2vgScRm6MZ3fEGvEvu0D9g6EYLSvW1ASAyyAuk8LlgiuuBC?=
 =?us-ascii?Q?981dI3K+VdwZc6133tRJ5Zm8Uo35+pvCr1hK1zqs5GDi0cTBWVUX7YNpy/UX?=
 =?us-ascii?Q?vddgLxNm12FysynX3paybOP7TATibTYNn+b/wHuSB6K7NxA4MRlPIOmyvi9N?=
 =?us-ascii?Q?iLPUe2puLp1c7uQC70cQF9yOqmPrO2zeffAemHT6o4GC/k1tZJJrOMCopSqJ?=
 =?us-ascii?Q?rrYQm3oAdFge+vC3Xs3J2UXJwerGsiec1PCCSOTEEbc6U9BiimZmuHIMlQ1s?=
 =?us-ascii?Q?P1qri8vXSuq6v1ekTb6fbAhWjgM1j1RvyEFo54qHiiWr8iJC0I8FnzpQpo1o?=
 =?us-ascii?Q?3rlvl5jUH5dTOW1KgaYC/tBux637cx1iPNMg+FMMLbGvcAGJ4VZf3BO66d0Y?=
 =?us-ascii?Q?WTl5ykO7ZA2eyN80dYcdKRGLKh3AmFtDPfJdfpRP2HFRXxvwp/maOzzmjHsM?=
 =?us-ascii?Q?Pi/p7GvqM1odPuiYOg1jyKVhaqz8CDXU1oQFZE1xXAb6pSgqioslD7PJtN9P?=
 =?us-ascii?Q?oMcSKBhg7eb0KR0CISyxPuhSrZFzHXOOEJjjjhYZmmxiv/NQTwbmAKKvuVHP?=
 =?us-ascii?Q?N6JNY6fq0z9/6HbkNlbhYzrl/bX2dfS62EZmHvPiXzNGCbG1kJ8Bs2lcdfaQ?=
 =?us-ascii?Q?MVzXIlBOtILTyFHEGa0vYtMwYsh/Ggy4XPOLGbXudlPKGlVT8vXrb/QLIueX?=
 =?us-ascii?Q?3UCFSnSU6Dz30mqf13mdu0DvPVT3aXnoKyEY3R0DwyS9oEsSoQ52aek3QXLP?=
 =?us-ascii?Q?1hLukRcJz1jWoTc6VPGB1AUIkFmpaipdvRLVKpytZ3C9aIEMZlmhcI4+kh+O?=
 =?us-ascii?Q?7iHhIMg9pbycyENfwmTgZILcpVgWCsIz8LClHp1gaxmIlyxVwSqXWg9Zfj0m?=
 =?us-ascii?Q?heswf9rTAMYTh0xwbN+b5yXedZBwf0+W8YL8ZL3qg2S7ibErD0Kmp2sK4fB+?=
 =?us-ascii?Q?NK2CUF7f8R5tKANNGQ9vf5E6wfjaWc/FJ7a+V5N0G6Jc4JBiM8h2qbdcvYp6?=
 =?us-ascii?Q?urz//dfAhuSbwC7nK9glbX4ZHgKl9LzdpRqVYOq53Mfjds5fmHpRScxCJ6C2?=
 =?us-ascii?Q?MVruTwg3yPokuAPm/iQByohJT1PN68lpXvB6x7jswqEtzcGqUL4pB4CWD5uL?=
 =?us-ascii?Q?xzeEh8PUvi47W5uBLCvVu1CNGIKwT92AlPLohqB9V0faKEPITmFI1AHVOsov?=
 =?us-ascii?Q?6gs3Mnrt+okosHVSu1TQ27m53l24PWKPL7t2Bpg05JhEPV3uKhBJXVyoirwP?=
 =?us-ascii?Q?BO+gxW1lMoAguJeDO5iksg3s+MCagtu7o55mgLh6GZ5zySE/WMK+OpxpeFAb?=
 =?us-ascii?Q?6lNoJr2XyjxGAdDB+Y47kYF7p+oUJC8b0pKKxQq2tDGnFjwLtJPO2YFVq7o2?=
 =?us-ascii?Q?wbvucDw4nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YNbUHhIiOU1tZ/gSj86dm2ytaP1SQAebq/GTOb0xF9XD8Tcn88PJX+29ak7/HXTJj+BSVdYJZ9KIrqCvF2QpAScjO/YgXnEF0bDPbiSUoh40wbhu6CfgkSH2bQziDv3y7q1soZRZGtm8Z7QLKvKy9aHGiZsW7ELUJmYbSZrzLLojuryLb3BMDXIHytgk9jS6XvrYGfBzADmGez3kniv0O5xMKP5ZvVfz24BRwrOIgsGBnLnu2JW6tuUtY9wntjgomlT/1lFPPNv1VbtvOJLqDjp/z8KvJo02sAw0ZVxi6WlWzR5gWJ0vyKMWgTGBUoORJcj4+u290lfqZ6djtYSm80vdzr8s5cjXSg4kfh68qYV4/+fe4PI1KPkBKQ/Q92WnRsMg3G3Wcr/JF9vPl4gYaHTjeI0mXvc4k2YZUIMVTwdHZLctJ88X7geNqQTh/GNL7pBkXV2fIo1PLSDLXL+8OU8KsmngayF1rcXUqNAWqeXNSOPVahKvVp61BOx/iAjSITV2LsAceKQUZUqZDAIRKJ7X3qUaY17kUGvsjQYQgVSH3QwkTNudOSGhrSdmM0V0mvDnouiRvtH5q5Mmx+z+me5OlmWMenZ/PCnae99yjTU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f534d1-2285-437c-a2f0-08de6b128de0
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 15:14:16.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AAy67l2PP7ykN3d2MaWd17IGRkoaTQ3GNv6cvgeAt7rSe/8O/o2y3R2iT6YgNrng4SAgJACcUks5sIPWzcYsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6232
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602130118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDExOCBTYWx0ZWRfX1P4CP0u+jBxo
 TSWZ/8lwXiOM+BJZH1C45v+NJQ8fyVk0agjTWm1UVazF/PFX2VoBDmn7y86IzDoZQWcXcVfBxD8
 lIvH1jghgpDDp3gOugoo2qJcCE17vxlwm/8FAI3qKliP4ip8YX3A15sJBZzr2eJDsqF2Vmn2HgW
 mqZB0K7nfDTIvQAxwrfMs9+seZn5HlBh4bmjhzPcSWTtJoaYvK1jC3jNrkvS/7hygtc4fNkAqao
 XuzJRn2q0Rgxtur0lwRnVCxqeKN1d6W3JwEKR0dBIELkrA+oBAWomFyegsHK4tUljXxOKZjcvV+
 Vm/zT29sfchf90Hwq7i5vUWWXY7MSBI3e/MqTAoufEFYT6Fgr9dwggLauQ5V3yeBGC97B+Rvl29
 Gs3PkInX/JvQv7WrfNu/CinQHFMYcxq60jIoTj657316ggAn45BuMPlRoM+uPWP6/7yv3bUWl5I
 emSW3OQlnkNiPONYT0A==
X-Proofpoint-GUID: HM5TXVQapHWK-yTw-GDBEVeyAQ1PYxpk
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698f3fce b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=ze386MxoAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Ixkok3qfAAAA:8 a=yPCof4ZbAAAA:8 a=9w6jnCWzGPF_eed4A6gA:9
 a=iBZjaW-pnkserzjvUTHh:22 a=_4Lj5ymMnAn2NA9aJKr1:22
X-Proofpoint-ORIG-GUID: HM5TXVQapHWK-yTw-GDBEVeyAQ1PYxpk

On 10 Feb 2026, Kris Van Hees via DTrace-devel outgrape:

> Packaging configuration files for Debian are provided in dists/debian.

Nice! Seems to work, even on Debian stable (I was sure I'd need at least
testing, but no!).

> Sample steps to build DEB packages:
>
>  - make dist
>  - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2

This...

>  - cd $D
>  - tar -jxpSf dtrace_x.y.z.orig.tar.bz2

... seems rather duplicative with this. See below for a patch with a
make prep-debuild target that does this for you.

>  - cd dtrace-x.y.z
>  - make prep-debian
>  - debuild

It is a bit annoying that you have to do a prep-debian before doing a
build, because this prevents you doing a normal apt-src or any other
large-scale build command unless you already have a source deb that this
was done to. (The changelog generation is nice though!)

I would be inclined to use git-buildpackage here. See
https://honk.sigxcpu.org/projects/git-buildpackage/manual-html/gbp.import.upstream-git.html

I tried for a minimal approach using the postexport hook, but alas gbp
wants a debian/ directory before it'll even run that :( so for now this
seems to be the best we can do.

Here's a tiny patch to let you avoid the make dist in favour of a simple
'make prep-debuild'. (I didn't fold it into make prep-debian because
some package building tools, like apt-src, don't need the .orig.tar.bz2
at all.)

8<--------------------------------->8
From 472a6c863d06f8e419827842e0e455d8f13f6edd Mon Sep 17 00:00:00 2001
From: Nick Alcock <nick.alcock@oracle.com>
Date: Fri, 13 Feb 2026 14:29:05 +0000
Subject: [PATCH] dists: add prep-debuild target

This does the creation of the .orig.tar.bz2 in the parent of
the source tree for you.
---
 dists/Build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/dists/Build b/dists/Build
index c75f933270fa3..f1ed1a4627176 100644
--- a/dists/Build
+++ b/dists/Build
@@ -9,8 +9,14 @@ dists_DIR := $(current-dir)
 # Prepare package building on Debian (copy ./dists/debian in ./debian, and
 # generate the debian/changelog file.
 
-prep-debian::
+prep-debian:: dist
 	$(call describe-target,DIST-PREP,Debian)
 	rm -rf debian
 	cp -rp $(dists_DIR)/debian .
 	debian/mkChangelog debian/control dtrace.spec > debian/changelog
+
+# Prepare for debuild, which needs a tarball to already be present.
+# Many wrappers around debuild already do this for you.
+
+prep-debuild::
+	mv dtrace-$(VERSION).tar.bz2 ../dtrace_$(VERSION).orig.tar.bz2
-- 
2.47.3
8<--------------------------------->8

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

A couple of questions below.

> +prep-debian::
> +	$(call describe-target,DIST-PREP,Debian)
> +	rm -rf debian
> +	cp -rp $(dists_DIR)/debian .
> +	debian/mkChangelog debian/control dtrace.spec > debian/changelog

(I have a tiny patch for this.)

> diff --git a/dists/debian/control b/dists/debian/control
> new file mode 100644
> index 00000000..56687a82
> --- /dev/null
> +++ b/dists/debian/control
> @@ -0,0 +1,74 @@
> +Source: dtrace
> +Section: utils
> +Priority: optional
> +Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
> +Build-Depends: debhelper-compat (= 13),
> + bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
> + libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
> + libpfm4-dev, libsystemd-dev, libz-dev
> +Standards-Version: 4.5.1

Why 4.5.1? I guess it's what debhelper writes right now. (The current
version of Debian Policy is 4.7.3. It looks to me like we're compatible
with it.)

> +Homepage: https://github.com/oracle/dtrace-utils/
> +Rules-Requires-Root: no
> +
> +Package: dtrace
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends}
> +Description: Dynamic tracing for Linux (DTrace)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies

Full stop at end of sentence (and for all the others below.)

> +Package: libdtrace2
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> +Description: Dynamic tracing for Linux (DTrace) (library)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the shared library.
> +
> +Package: libdtrace2-dev
> +Architecture: any
> +Depends: ${misc:Depends},
> + libdtrace2 (= ${binary:Version})
> +Description: Dynamic tracing for Linux (DTrace) (development)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the development files necessary to develop
> + alternative implementations of the user interface for libdtrace, i.e.
> + replacements for dtrace(1) itself.
> +
> +Package: dtrace-tests
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the testsuite.

(... up to here.)

> diff --git a/dists/debian/copyright b/dists/debian/copyright
> new file mode 100644
> index 00000000..1a5c8f64
> --- /dev/null
> +++ b/dists/debian/copyright
> @@ -0,0 +1,103 @@
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Upstream-Name: dtrace
> +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> +Source: https://github.com/oracle/dtrace-utils/
> +
> +Files: *
> +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: include/linux/bpf.h
> +Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/linux/btf.h
> +Copyright: Copyright (c) 2018 Facebook
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/sys/auxv.h include/sys/bitmap.h
> +Copyright: copyright (c) 1984, 1986, 1987, 1988, 1989 at&t

AT&T, surely?

> --- /dev/null
> +++ b/dists/debian/libdtrace2-dev.install
> @@ -0,0 +1,5 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> +usr/include/dtrace
> +usr/include/dtrace.h
> +usr/include/sys/dtrace.h
> +usr/include/sys/dtrace_types.h
> diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> new file mode 100644
> index 00000000..36294de3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.install
> @@ -0,0 +1,12 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> +usr/lib/systemd/system/dtprobed.service
> +usr/lib/systemd/system/dtrace-usdt.target
> +usr/lib/systemd/system-preset/50-dtprobed.preset
> +usr/lib/udev/rules.d/60-dtprobed.rules
> +usr/sbin/dtprobed

I've always been worried that these lists would be hard to maintain.
It's a shame we can't autogenerate them, though it's hard to imagine
from what. Maybe in the future we should do like we did for the version
numbers, and have a centralized list of files from which we can generate
things like this *and* the install commands in the Build files.

> +++ b/dists/debian/mkChangelog
> @@ -0,0 +1,174 @@
> +#!/usr/bin/awk -f
> +
> +#
> +# This script can be used to convert the dtrace.spec into a Debian changelog
> +# file.  It is intended to be invoked from the 'prep-debian' make target, but
> +# it can be used manually as well:
> +#	mkChangelog debian/control dtrace.spec > debian/changelog

This is really nifty!

> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> new file mode 100644
> index 00000000..d4a89bb9
> --- /dev/null
> +++ b/dists/debian/patches/debian-configure.patch
> @@ -0,0 +1,17 @@
> +Description: issue a warning for unknown configure options
> + The Debian build system specifies configure options that are not known to
> + the DTrace configure script.  They should not cause the configure script
> + to abort.
> +--- dtrace-2.0.4.orig/configure
> ++++ dtrace-2.0.4/configure
> +@@ -172,8 +172,7 @@ for option in "$@"; do
> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> +-        *) echo "Unknown option $option" >&2
> +-           exit 1;;
> ++        *) echo "Unknown option $option" >&2;;
> +     esac
> + done

I assumed you could just stuff an || true in there, but this is being
invoked by dh_auto_configure, so that option isn't available (plus, of
course, if there's an actual error other than unknown args, we don't
want to fail).

Maybe we should just not exit with exitcode 1 on unknown configure
options, only IIRC Gentoo actually wants us to. This may be the best we
can do.

> diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> new file mode 100644
> index 00000000..58bea538
> --- /dev/null
> +++ b/dists/debian/patches/debian-interpreter-paths.patch
> @@ -0,0 +1,107 @@
> +Description: fix interpreter paths in tests
> + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.

Honestly this one I think we should do upstream. I always thought that
/bin/bash is universal and /usr/bin/bash less so.

> --- /dev/null
> +++ b/dists/debian/rules
> @@ -0,0 +1,24 @@
> +#!/usr/bin/make -f
> +# You must remove unused comment lines for the released package.
> +export DH_VERBOSE = 1
> +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic

I suppose without -Werror this is safe :)

-- 
NULL && (void)
