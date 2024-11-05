Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3470E212EF8
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730836401; cv=fail; b=WF6wxZixYgOZaoQy04rzdKCxHZPRgCYVQFvJIqxxjejmTjpOxMTLzthZBa8PZIXFy0qq3Kc/5V+mmu2JYi6EkKD97x/eIQeSnt/xtmRoWf+h//yh1nrPh5v2Rpsluws8kES2aDGUyEoFqQz+bSX1btAcge6VrF/MMimX+D2HoJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730836401; c=relaxed/simple;
	bh=WxdLcpr2pCIRwpk1qPaL3sHmJxAi0io3Z5iafSaHPD0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=VXojleEOikdE813YBYNC4+Iu4KFyjUF0UYqR9SJi/hT/EjTao+Sr5DlXQLIFrgIr2ahhuUn+YR4XYIuOasVR0rdQm+HhiWESzyk9jeCALUYrBVDxn+Nj29RDBz3Yc4xDYsHwgZcPg0m8wtBOtsZZNMCTqoqgIJlnXVFF3QRVVKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bT3ZxafG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fTdcXZBb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bT3ZxafG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fTdcXZBb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Jq5g6009224
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ub9Ani5Zf4hG0/oWYp
	/MMl/TOHHD0Gg2eyJ30QhpjYE=; b=bT3ZxafG9AVlq0Zwicy3fbJydQHEVFZvCg
	pw/LbOKU+y6zUbA6LtGJ0OCsIzHfxQ7Dxg57f4zx9XMGkiFA4SpPBdZAxs//Q2FJ
	gCYyl9NAWpQgWviWxnHIhXRsb6OZoakFi5svBAgDH+q6VV4q36X+BwF1bgQobjaP
	Y7sh2XzsCohLSX6G3aN6MhsBLYzKPncAYn8StejI2hVlRwKGOdUh5/cQkEkk7po8
	K8Drnm7T81Lp9Dfz80ggOFrs5lX6JLLIz61vCBvTFd0nfk3Baw0uxC96AN1nqqni
	PPjzYG/g9mC5GTjldaA5R0WTtctLM2ZSX2T/KHvpYZfKmOhZwoIA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ncmt68v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:53:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5IIlTK009324
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:53:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdwh7r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z73wuY0LN3IO+ROYGQ/kWMetswB3h3E9ArUFwZ7fZk+RgGgfYVjGlvLctkjdJQWZH6UkxLqBaMl2ZOksglpQ9yOnMjJKqCT+xbqLzPRoarZgd20KC3ZezT+t+jLXdprKFoZcrFrFIzx1VIwmylqk7M+pB8b3iZF16Oyfg18nZpyk7Fy3Y4XGo6Q8OuX281c6Suh+Qc+PNk7WjYTn5TkxJu+Nf4Zbt7WIS517nTTyKQ1MvIOqtBIXmObumIyiyW5sSx3AMy+G+3XQ1wQ0H76CEZ1FibFQyty1HXY4rcBZJ8r/IV+XFXgRAcN75min7k03Kmc+dPk7v/EVfwQ8Q1w4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ub9Ani5Zf4hG0/oWYp/MMl/TOHHD0Gg2eyJ30QhpjYE=;
 b=WpZu5v5jS37FTZAvBb8wXk+qaRqJpcAFmpDK0V0GyP/rYWIpPoDNPmvu83e5oNepdyYNnqosslNsmP4qIRdKwSTziiJB6A+UXjuXzU2MSPCSoUToaAgCqvCD7F3lW3mhOBfzHBPkROxEaLp5w39v+F2VSBul2qnsBdMDirn9+rNV6SERtvwjMenBdLqI7XJ3zn2xsdUyvPZar0b7Qx5ldiEXLVuhRdMyQDbXhvUg4zYI835114e0y18/SxhPopVu7s4V6UKGJ5Q0kHzENwi1QNGNE2XpjJwm33dLd5eZXh7Ft6X11hS1zTXYgQOaUUIGoGMjjZ9HojqKC8I75mt+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub9Ani5Zf4hG0/oWYp/MMl/TOHHD0Gg2eyJ30QhpjYE=;
 b=fTdcXZBbi3RQ0I/ZdZg6STjwwlOuZPGQHjZptUNOh+FVtj7LwS6lRS85bzPCtKw0YUfmXBNDEWaEl++vOAesGIww0NX9ohuv2Z832BCm0smt0GBadFrjH9qtIk97UMyT5AqwltY4lUYlo9YBZBkyEbSKkB1LV89Q0kJ5T8+he0Y=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by IA3PR10MB8140.namprd10.prod.outlook.com (2603:10b6:208:502::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 19:53:10 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 19:53:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v5 1/6] usdt: get arg types and xlations
 into DTrace from the DOF
References: <20241105000608.333229-1-nick.alcock@oracle.com>
	<20241105000608.333229-2-nick.alcock@oracle.com>
	<ZypOQd2JYFq9I0XC@oracle.com> <ZypdcfLQrWI+osnV@oracle.com>
Emacs: or perhaps you'd prefer Russian Roulette, after all?
Date: Tue, 05 Nov 2024 19:53:04 +0000
In-Reply-To: <ZypdcfLQrWI+osnV@oracle.com> (Kris Van Hees's message of "Tue, 5
	Nov 2024 13:01:21 -0500")
Message-ID: <87bjytfof3.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|IA3PR10MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 23592c9c-3b73-4879-3661-08dcfdd37952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A0yqzP8wu0/M8Bu2j6sGVAc9Y8qSqP3K9+k2OSCDqzekAldsZ3vK59ZcKNNL?=
 =?us-ascii?Q?Y+gXGP4ndVqWmCZ9tX7jfEwjfPM4STSe5bMwzIQ2l7JTCtLl3UXy8M7XQ7C8?=
 =?us-ascii?Q?QREFCTEO1iGbIC9aItbPkm09V44TpP8zCRVK2YU2OXDuxRGAVqPg8equGxKJ?=
 =?us-ascii?Q?kxnAsFQG+UI1V4G+hJJias6cVOJEsmNoPSLs+W7wQe6Y7aXpMd8bRBNV+kHH?=
 =?us-ascii?Q?S4/Y35iTUAifEmC3l0/8nrA9KRbLsE7QGKfuKv5/eVBSDwFFUrA4UmNmc3Qr?=
 =?us-ascii?Q?i5cNMMMUf3D4awpqMeujR3nN7xjUUe3+vvqYVWfz+mOYRMc6YaGMWcAVV6Zs?=
 =?us-ascii?Q?chLXhfg8qgcupKIZcB0iJ9AsFw6nf39bLbWYFeirELEjaOsaK1e6LJmV1Z7d?=
 =?us-ascii?Q?i1kvZJRNqDw7mBvlrhAjWQoAg6Kmp42MEK0vZ3gffl/Eq4gjlN8ogS7k7Po5?=
 =?us-ascii?Q?m7FopL26OisDJkh6F4BEaN9OxWu5S7L5r112i96NwXrSxa7W/y7AbHhqaT6E?=
 =?us-ascii?Q?QPwU1SWP8w2Go6XvV2mtfR5TGImXov+IfR2FXYEy6LsTTRa0SikGrA7gvzXS?=
 =?us-ascii?Q?b0h4Sgx2chkKZeNUZq8HaYmap/dDaEK3BDm/HS+A2aCjkx6vAl5/sA2B3r26?=
 =?us-ascii?Q?hQVpji2ot9YLK1lkl2GgmYDBI8ssswegx912GJSYacHc9fZdWGJtpERKp8jm?=
 =?us-ascii?Q?HUU//Ha989gxoxnXjq6YES/6Mtg3Fyab1jzGDd8A+vAxQgXQafallj5r9shk?=
 =?us-ascii?Q?BZ4Vd/25o5GvH63akIbkbgT0o6Tfh22NWXk+eujZcfmyY/pGLAlYkjB9HhzC?=
 =?us-ascii?Q?t9xm86kvxUfYSHH8OtbdZPviMlLcdIuKK+RfUKecfWwn2xhHLB6BJKHM9DM0?=
 =?us-ascii?Q?UVcfrdMbscxqI5oSLy0/pnGswAx/7uJ9xL6Vy3wlip/9VxjOjsHLck1YeK2R?=
 =?us-ascii?Q?rLus5ga2eM7/MARTiU4jl/Uey0BEtK8h9WSXSaX85rzaAUttgdCVPw9XiDnI?=
 =?us-ascii?Q?oDCvavt6zKQGhTLUYmNaZWui9m/cskbiMAyzRPyKfi7Z2hYv7vasriMv/fWY?=
 =?us-ascii?Q?FBBALW5HU8foq6vk1LzgUpIdimDbu3olB/MeAbBMeD9+YoiWhReQExDePnvA?=
 =?us-ascii?Q?ef6t2UdfmvM3FKVPEkm4glVHE4cOcpF+52yspA9bJ1TM1eI4os5+ZpnzOaaw?=
 =?us-ascii?Q?yIuxf4Hu6VVqDvvFr8YvuwL1VIczbor4twLvpWelsp7aAvkC7N1GJ1SM8njc?=
 =?us-ascii?Q?0P9ZtmIv14Z9or8IZEPlstCNew8NS0mhZShnCorii3NSInCQo7sO1CRjJQLr?=
 =?us-ascii?Q?ULgI0QQRjM+oBB3WIZAfWZyZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L73q7H26Om/h7OKuwx0XBQIWiKiNdqN3We07GqehQ7CK+PAqr1N5yE9DB7s0?=
 =?us-ascii?Q?k5yEPnDJzCwX5eVeYSwJL3vDIfbREfkTgF1OV/ITXZaB71MOdJikf2ewQpRp?=
 =?us-ascii?Q?Q8+NVS0DtiHRrlRV20knjQgkItB/JSPy02PFZlod9qRxgR6YFLX/PH7EIo6d?=
 =?us-ascii?Q?tSM3fBDT17WwRi8vxLPLcgm/hYhmhb350q4oGJnwFfsCQBL/L8rRbMr2amsE?=
 =?us-ascii?Q?7ly4WEBeWqGJr5UMi89DKuytykgDjoi+suaqqsrB/Zftqx+zu08HuRxgftcO?=
 =?us-ascii?Q?CCdLXnppBU1zqekb3EDrp2YBnfLOrf2w988kxyHWKSsOjkbEiYiQPz6AKThI?=
 =?us-ascii?Q?cU+qbFY1nVjLBdThDn7zxiibAW1KynRa4q2EOjMgdbVkbcOCvvPfP9tfMTK4?=
 =?us-ascii?Q?1Mpsr79CnHqkxqRDR2B0KPxpghycobkzOTSYML1fFOp+7lOuEYko3kGZzgjK?=
 =?us-ascii?Q?hr5+ltRWcbbdW2k4lwvbgJgkgsc09MiuHK3AS+jf7QOTQ1bd9gdKROrSR1rE?=
 =?us-ascii?Q?RbCC5aXo8y5tUtz0CEv4pceHbgd00Q2OeuKKt0/AkJ2A8YRk3roqDU3eYXQu?=
 =?us-ascii?Q?3YQHiamVAiZf+/Ytd4MwTb8Oienh+/LWH5w9e9GkxnBsppOqvdjy1zizYTK8?=
 =?us-ascii?Q?YR2X13wE5i8vR4VHmB80vHPI+OSVf444LZjbcJ0WTN1IKDCeTcS3EZlidCsQ?=
 =?us-ascii?Q?pXx/VnS35kK65Cq+9hTHlcEjvpE7XWE14vxbS1w2oMAy4GT3lx3EBbWjSyf0?=
 =?us-ascii?Q?PMR73Ec5rdJOs68wxzbRu9SCiMLo6IvrEgE5Ga+GgcHaVrqR6Lxl6O7Rw08Z?=
 =?us-ascii?Q?SFbjNrLhIWzCLgUFrAAl5gcaMJZxCw+lGDgxB8wRmqoI+6SKG611zdinGQ0i?=
 =?us-ascii?Q?LiKzP3WuLeyo1iqWu+ZulMagJIt1mIgqeUZzqyjsoA/BBqXN1DThe44oxubf?=
 =?us-ascii?Q?SFnAXuEedxb+ApTStr23SiYYEfWZDiQAgXX1ZnfdgZwMsEw8JSvKwy8bQOlD?=
 =?us-ascii?Q?V8rUrmxzB6rOJF9BWZqFGmKg6dwyenssrsZlsyMX1Y5op8HJkGcOpkwOUMAi?=
 =?us-ascii?Q?TqdVusFPPZceY5mB421C+FjllSMqJv0biAaljB9xtHRvecH+sFX7GJiDMG6C?=
 =?us-ascii?Q?chgh9A/cgAzrxOGcd4mdzXRrKoBvxfDth5l0s3+aTpqxoJL3/WrEZWpKVPko?=
 =?us-ascii?Q?Z1OxtblSwAgcB++aQuN5cV0EaEqGlzi7UVe5FO4Pa0YRAbeUBp7w4UTLYGuk?=
 =?us-ascii?Q?VjzdrIIWcJtqhAtEMU/yIjNs8ft1oFpX7+Ksjnovof3yxUq11H59y3noIZmX?=
 =?us-ascii?Q?3yc9C5fMIVVgd1Dm+hNvisQf4hF/Gi5qJYU2w6Dlg9NjPUSD9Wso4mTnO4VZ?=
 =?us-ascii?Q?HVtcNKi5L0CDPBl1uVwr17hE1Xw2Kf6PBedQq+dMIwJbFz3iZFihQxcWDOjM?=
 =?us-ascii?Q?4XjcLXWVdhAbcZtWgogNawscUt3o+8f56KrcIrRYgOT+OIk9ClwbVsXQqk9Y?=
 =?us-ascii?Q?t6c3MpORWFFv8jkD9vW+N/s7cVkawQ+CN85KF6NkWmGps85rrkGb/DoJK6vW?=
 =?us-ascii?Q?KazTiGuFE3i5cmd+N3qTLHs7oFoPkm3OnSEaKhEjXRRUikKhdWNidY/50eFf?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wq2f11bOmZzUyej9hAPSi8BZgNczESgNa2sQ1Ih6YX6YvWmH54Wjmm98MLkOVBWxJUete4hO5xNw2fWtC3HfxhLt8cA9kZyzAzrDbGHqoGkEySFTNfbg5zYH8BhO7pS1449dYZFCGFu/sBUdvxtVlO4Jfgtg+WwyBrE3FdnyR38pjvDFsPI9DnDcJHyzw9MjLas91GTYnOa0WomVMHR6bI497HP5YtAdUgOKOrgjHm2n6C97eKvP+fLHD7V57xBvwDHqKNHBl+Y7f+TOfmI/MtvnbT7E0EZJ1+nfaKLBj2t75aq+d0moVb7TFJwLty8e+VdmfWOPb0gQok4A/ZUjOO0rI+AIKgrdFA1AeQA8aEoNcpXFVSPWpVieGywHvkXhZqgd9ekDB+ZBc4ekERa5DZYwTCkK2dv+a3/6gPNILE3oDqsaaEk7badMNt1ZUA6ZlvJ+NCDORnHfyn7R3RFaEoX7qZjKeO891L6iQ3iRkzr0dED+698GOHnV1bWPK8KbKRnyvQtSGve8S3VrYgxbksJItR8u9DvWO7Hftkq2iOc4/RtfVzDUXUZdG7jHuEReDpvkEuENUtBet5oq1hTRYowWgec/+NvsBNWTN+ylTFM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23592c9c-3b73-4879-3661-08dcfdd37952
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:53:09.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8g+jbUXMmcgA+BgfSFIdOeT5HdEYF5pq6ZoSk2O9Pc2CebdhNJLcs4g0wPjKV5kbWXYINZfZvr05Ip4GafqMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=968 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050153
X-Proofpoint-GUID: yrh-m85ezFcLRLv8PAaGFBg7NEzhIl5Z
X-Proofpoint-ORIG-GUID: yrh-m85ezFcLRLv8PAaGFBg7NEzhIl5Z

On 5 Nov 2024, Kris Van Hees stated:

> Reviewed-by withdrawn - see my comments on patch 4/6 (that one contains a diff
> that belongs in this patch).

Bah! Fixed.

-- 
NULL && (void)
