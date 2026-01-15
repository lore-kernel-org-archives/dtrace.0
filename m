Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B2246788
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519894; cv=fail; b=lbBDh67ZrROqvU5eGKpKmVrgZ1Z6O6Tf1f48EyOBpbqQ37YdmodFpAlbHSe6KE2imFGAxeAW8jawukBJLO2bAPYiyNvCAe8T/B2EAXmej+GUsEFaZdqvbwXF8qfD2Z4vJ47GqN8VRDeowjfy/9ZjfuyFSFLZTWfNIPSjS7K4a7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519894; c=relaxed/simple;
	bh=meHzzvB1TdFu2uSng3iOnYJqjw8K5NhY2P3NYNr2O4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NvWPkMqBe8cAz0GDR6E2iuv97FbcmSo05pBSRblqGB1QYAHM9AszLjYDs3jdxkNHci+2XdmBhzgmkvbCX1bhdpB4KljpWYm3VsmpaiYHrEckvemV6hjiqWbDm+LRUU7hg2LrQJqtSxbQ4yM3jO1FxNWcBbjXuG7Ug7V7VsLxtZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iDT4Z9uU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GSzuGpzN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iDT4Z9uU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GSzuGpzN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FNNXZe1430609
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 23:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hfw5I2lCrh2J6qoPlO
	SOhxZM0FEbfOpxm9/1bxUjgB8=; b=iDT4Z9uUMD0bmHBmY2EXr6qQnv7ugNVusq
	eBoXectH+mTJZz8AO+DhSQVXt3py87u1+dfZnzhAr4cyN34MH32kw7bMya3xAmW7
	vCrBao06n+uKYuLRtOnIwVxcy3l/VGvX+PG3Ad0jVEQ/YYz2k0Sv6YmnXCN+Ouwi
	PXgncLmenrBZNthB/XNmdSm6GadCs/rechPqee1qe90HDBDPm6sSUEFTK/ogccBF
	/sNAeYgYaWTO6yMrJVz5S2N/XFfpVZzNsxH8vWATuqEPJA3gRSHtMd8wsF9AFOFY
	pV3T1RSufRp2pf4y0CdUF31BYiBpxgt2ZTm8y4XXdWvRrjSe8kxQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkre411ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 23:31:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMXL0q000380
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 23:31:30 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7fsffw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 23:31:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duI0pGXP3l1GYLCa5zwGjptD5T9LxrtLIeVLlWLy9Npkx+IJHyjcSNuk4XxuBNXqsYhcAAFJjZIa3n+QBaXtZ4NYTHs9v9Wt3J555WT/oRxESTUuICjIakrIOXefezKnbvwJ9rMHliRLpXG36Tj4l5qJkaMGRmONPEBpDQubcyE1MQxII+zVRgd6SOXy7gYidtXoviBzt1E1q+/Bh/DluctNcSkvoHHPvv9IhhGVviLnVbpMH0agpUI/QHRgjw1rtSjn1/l74rc+imbEz7Hs2afn0KEaCWKmpL1fVCBieK5VOahPlhnR4lwF/t2ROmouMXheNicrJmRiTcDTvt/HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfw5I2lCrh2J6qoPlOSOhxZM0FEbfOpxm9/1bxUjgB8=;
 b=Guq0vmAyuj5EDYcqzl0OEd13aWrde8N4J05JIoTHBIMKGqRTwCoJmySiao94VKp3HhL+/j2TMI2saxFHDHpFfyqUL5w/rZGwhQ+C6fsCUCKz6qQvMyi7QBAHOfT3wF6qk2OaRFoYUHomdP6B4yoSPp5D2Vvcs0H4RHD3tx8EKNCrKezDQ7j45zOJOVgzVISKL3hH7PDuIjxR5FMe8kbOjRwB67KgiD4lcKtIux4MhHgBWS16ao+5Tvtnsfmee9PZmO5Y9Zp9sxtLZMaDlElRl33ep81HUAvWNQI84IoQQ8EfBCxTIGEQ5J4OowOoJ8/e0tjo1Y3F2j/uyNiYpyqlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfw5I2lCrh2J6qoPlOSOhxZM0FEbfOpxm9/1bxUjgB8=;
 b=GSzuGpzNicXDwqMuQS7J3PNKcfbGuLHoqq/tdeH3xhuAURdJAj1Lgfrw5xvSQiF/zNlSRwebGHgT+JRlqi4r4GzdfEtOsyffSdwfJ7NM09y5rbyoS+uFxdhEAkazBQUdeulQCT8f1PKty83ShJj23lIvlmrG76iej7Z6/A1uJgk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS4PPF717557185.namprd10.prod.outlook.com (2603:10b6:f:fc00::d29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 23:31:27 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 23:31:26 +0000
Date: Thu, 15 Jan 2026 18:31:24 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] doc: Add include path for sys/usdt.h
Message-ID: <aWl4zEgRcSfaiGfd@oracle.com>
References: <20251126235628.3318-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126235628.3318-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS4PPF717557185:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fad9a76-2cd6-4761-4f20-08de548e3393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0fTp5lylrVMlYltEVrjDXdYvIhFkg1vgrypFjAam013Ho1iYdWlPTWCjFTDa?=
 =?us-ascii?Q?xWfCY6b1NyWfcEAxcMt77Ei/cTAPuusJN9i3ZW+ADFZVS764clMeT2OLGhBR?=
 =?us-ascii?Q?iC9FxjfcE2DiXBGaVbWo2RnkT+q9hiazpusnTSR0xT20th/UoJ1SRE0QkO5W?=
 =?us-ascii?Q?3A36J429RQ1Y4wtThQdYt1bXfpnuvpFkm/h14JfY3Rv3h7MlvREmAec29mxo?=
 =?us-ascii?Q?IYFjlTO9Q3zp1ALn57E3mzAz9P//La6/dec2czhPx4nhU6Nt6J+RBKYqYOdN?=
 =?us-ascii?Q?onCae67EyzTnL43AHBPnR3qJUISm0ohDfJltdGhjBpzyNyjSj/OaQvsLTReW?=
 =?us-ascii?Q?UTC0RFX7N1HS8dqfXFutx6Cxwuv+UPl3h+73JhaHxIURvBdcv+qQwdmZcdBZ?=
 =?us-ascii?Q?oKG7T37seNab3Y6anua7Nh9H7YQeKTcxf/9QUJd0blRLojnnPMqY4FhRwubI?=
 =?us-ascii?Q?DD0hyy/5dlwFi+IfUOWeL8d3saZz5BmyxIIzYOuX+x4+SOWy+KcUIy3F+FlR?=
 =?us-ascii?Q?nDM8QbAJ2VLXWzci+7V0LIXim2Hy/etAnqKLJCcxEefcUsOfgs34wFcqARBz?=
 =?us-ascii?Q?CdsC2AIwj/t+GOnOlDj4tE3vqWPgfm4EknMiewFTC1/zAUoniIVe+A84V2Gz?=
 =?us-ascii?Q?Il9QJ0nDTn04T0uBRxHOIy38MtDMPGF1FyMs8Ah/1pf/6pmARSSAsp1hLx9V?=
 =?us-ascii?Q?ed2gPMAbQ8Cv7CZsjdEwKGLwyBUYZ0Lujeizzf+xiYhBr/w3XWsDrSN0pho2?=
 =?us-ascii?Q?7K7p7mIU4n8eeyV4356oQtAKkOcGuC6VYYQSq/E3qsfcdXdUztGkPVhpEFzw?=
 =?us-ascii?Q?5Gh/sF+d0gtUdpXpeakKbMd6ooMk2J9cCse/15VmaoGAM8Yi8giImQicEA2W?=
 =?us-ascii?Q?U/FwkMachpUuUBBW+fr5V7TeMtRMzZBTGhn3IZGgnj2AfDGOCBu/ct6DwY+1?=
 =?us-ascii?Q?YGT3jT1DMFQAiyatq0S4SVhjl2qFJhIa3i8BxMm2w8+On9yLaZOVDdBvIkUC?=
 =?us-ascii?Q?6YE1ASAxXA+ZTQeuj1IKua1cps1lVj8ZhqOwhK8RlIGHLiXTt0qDtBKxwF2h?=
 =?us-ascii?Q?2u/rR2IKwHurDMoLd8deASu6ibLh7AlwwrS8SWmCd0q+p4WpCBPzZQRzJOBZ?=
 =?us-ascii?Q?xj4oD8pAjpUKBQOWfdxoZJy4ZFVP1xr3s7tBZ5m5aF9QzLeHzOloiywTqmCH?=
 =?us-ascii?Q?6v9H+QcBgWtiujiB84l334zf8H5nT8TbVCnPLqXtRhC+Qk70i5M+YY2E69+C?=
 =?us-ascii?Q?QyyZRClyN/ixWmhk16wNZYoiJwQbje0UGd3miQ3qBJF59tR/Cu+/9cfapqiW?=
 =?us-ascii?Q?+nvRbtm7lFGsokkxPJirS55I+lr+UMksnCQ2FGRBJpb4Hn7VU95ppDNz6PY6?=
 =?us-ascii?Q?LQaMrf3XsVKTTl7fHgh/1sSdapg4oty4FsaF2spruilr4VgIP+s8qNtIhY8r?=
 =?us-ascii?Q?q6NzAahZH6KezSyKZ1a25rlYL/Fyakel/27Zq98H/fnC9GFx4SXCv44IAE8h?=
 =?us-ascii?Q?EG7xfo3+GEIvIGDyq4salh8kbJ0FTd1iwXGwHNJOlJQozaj3T6LUsS9v8umL?=
 =?us-ascii?Q?aWzmrfEKNHRCgWyIM6k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y9U5VjyrGVcOtA1BjLQvrf8EBTAXCsRvuzUpbetrj5i4menuZBmW9fkfe7Eq?=
 =?us-ascii?Q?aGTBwKFVO5IXthdw73+4VYUReNlUuKubFTb5Mq1MuEEv3uT/ROV30rKLTpFe?=
 =?us-ascii?Q?YQHZSCvLcErhLso9mf0+NxeY7fZUHEeY01PKR3vCxgQ5lVx2Q8e30XZCfCL8?=
 =?us-ascii?Q?mohmppEjZaqL9d0ulaTdxtFSkLzkKi4ABnAkt74VXJA9UzCWvg0G6yXT+ZRK?=
 =?us-ascii?Q?nN+ExYTNCgXXWST4Qs8fDIND/iDFetDQff48ArtZ+/2HlcdfQustLwoyszuD?=
 =?us-ascii?Q?7c2IZObI89saWHzTnl9UgXJqknWZHv0JdUe8lEM/33C6n0XeV2gDenn9y6gd?=
 =?us-ascii?Q?yxrb7328iS0nJiMWqUMb87elnG6FY+A4rlNTWHbeBtVMkJBlvO51kFcs8vmq?=
 =?us-ascii?Q?8QXHRxPE79TclAipzxTt0OHHVAqVPupfE20X0IreUA1jxOI76QGkoRQoTwUy?=
 =?us-ascii?Q?Hzy81dLvqaRBnXlLem5xpUyfEgoEYCrfDgpmvZedYWTHwkvxivHMxgDX48gi?=
 =?us-ascii?Q?rDpOSs8jMP8W6x3G/iN1x37m+zsuZ7pZBXUULEVoyN1fGEfx56Um/bAlB1R5?=
 =?us-ascii?Q?TJ3XJNKPxA1MKgsymJznPhSlhXiGl3snZs5gaK1Qo7EuqKPyd71Wz9ooaGip?=
 =?us-ascii?Q?ko+hzmYoTFK4PvkSPjZzip6XRhN8yRP+bCiDCZWdQMzc75S7n9zEDLp/Y+cf?=
 =?us-ascii?Q?MwbfFr3fCYVFJ3t1v10tYEKP8bqiWWzEjhMd4wh8GCP6rw57Oq26VCMVIAVY?=
 =?us-ascii?Q?LtPBoRdnakG/c05J3jguPi/plM5tXuLIF+99P8Darecwo4Yjm821r0U4h5Ka?=
 =?us-ascii?Q?yov8INWq84BNWXVN1+8Zf3kMmDIX+Ck+5ilFtogdVhGoy35I1ZgK4kyqjt52?=
 =?us-ascii?Q?4QDCN0r7M9mpzh8Y1xVcw3/GG6xqyJGTIB7VoejdjY6YCL76Qk5E+Jx09dTE?=
 =?us-ascii?Q?dZjaAYHv3AmLHvHyP13BohdeZ0xSXBUwEb5GHFCZxUJLLtXWbepDMq0jdXVq?=
 =?us-ascii?Q?arSG7Ej7/SleibM9AdYqcZ/e6dBWV/MySW4nyYE6sz/SRsbqSAjIQ5bHo2zs?=
 =?us-ascii?Q?VvLt/x4s0uAzi2t2iSNEXdGtVwCBQt5jKspXr2WAmDrfEISC2rrXRds1KMWj?=
 =?us-ascii?Q?Zk35WykrCN8mKniKYOUv910LRLPgUWxlukX7owChSCheqnKAMruRj/KfWo9Q?=
 =?us-ascii?Q?1Wk0Z3MJrr9nc7O/nk0l6i6FA4+p4tY7+Uty14fDrxfntmzM6vvuHywANKd2?=
 =?us-ascii?Q?6hxohlZxayqo+lCE+7g5taYNnVCE/UC8tYlqhtlHACzdMTVfhgunHfRtlT0a?=
 =?us-ascii?Q?eHr8uSJ7pYiitm0DoKwLDd8G55lnvzQvc5Jw9pm2Tv0A2sV8vpxxcJcrVs+a?=
 =?us-ascii?Q?FhQfEZnK7ENZVz0yjV+t2VTV1hjC+IqohlhFjIU3JXIkjAOj1AUXzF+hm8xZ?=
 =?us-ascii?Q?8TbtrNBbK9k/C+I8g/oHpJSouBwfH/VlzZ4UypB2OwwItGdqeN08Cw0q1XVu?=
 =?us-ascii?Q?vb3xF4w7AXPz1EiyA1l3doZSQDEh8c8aiTawV3Ol1VEtwySm9npMy31xdZbz?=
 =?us-ascii?Q?q2EMLQcVcHjMoGRHRkVKYBrDMru1wOYZuyktq9bDyGvUP3X+L5yZKeO9fzmD?=
 =?us-ascii?Q?A3UJPrEb1bGvt4sVoET+rTnpJNbvtL1jad1uAR40draseDNlKF1GBCORoCUs?=
 =?us-ascii?Q?wr7qSlyqakhnKBmr/9x9IOEA0DJ1gMCzHgxYNHkdjfRy0nBCs/tEh/P627GF?=
 =?us-ascii?Q?67Li90rMzw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mQLVx97WLN1n71+wElKVRd018rvXX8DTCYmMca1ELU0sgODQxnP5RdDer525sLHQVKVAihMGqND7wh9t+7anxUga35Yd5JPt6rvwsU0qd1BMPSUoeUqg7lBEGh8FFjwkGNel85uoq7EUgJRDqwNP0LkPD1ATowUkCybpu88HNsGI34qdtmvB+dKQM2JSb5I71U/4Rl9C4xS2wssIyzaUMgi3gSjPubE8Q2INWMOkUGNfEch+CKm+0nMmd/OqO2Dsa6p/tpX4WWlXv00tggOF/mfhPKXGi2kP6I5t5SYnqfYhwGZqt6E5vw+qKivApU45FHEwHxgNua0Vk4PZej0+o2SsnJdWyTUR9qnC3tzF+ssXjdeI24kL/w9muo1bueRIw/7VbRGpBGgQ3rQVXETtZHangpwiz8A6/hhX9UzYoma6Oy9kEc6otFHk9TXt0vL3iOnWP6G4vlslSqjUPv6JxEScH3Gwa/zHWVz/rANYgqqTzvBPN9ZIO2dGZ0j1RQoyGKA48tWVTpqSK3pL2KDSNJTny48RYXFo/54qmJqo+Q6K3L/Xtl+v8QpdcmDbeoEbO5jEp8BOGfm57Yd4X1YGa3YtphDDxM7BJ4pbAC1uom0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fad9a76-2cd6-4761-4f20-08de548e3393
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 23:31:26.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkdPQEcpQeuffp3kxJQNC0fYwJDEqZhDAPEFWAl7aIEwnF54wRm0lPjGrqGogpLf/ylpxXC9xJPxab1gaTnGXNAuxfSsBGpOSKunxmxp9a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF717557185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150186
X-Proofpoint-ORIG-GUID: AcnBYMpjdHORekP3IVPbpincr8iYcazk
X-Authority-Analysis: v=2.4 cv=YKOSCBGx c=1 sm=1 tr=0 ts=696978d4 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=gy2Ro_FX9eGampgkbCQA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4NiBTYWx0ZWRfX84B9vj2nkWK1
 F6SiiNTWLZPubSLU3/dPs00OYOCKT7WrBVRml2Nwy7acBmHdirboS2MiFw2v1i2Kio/4G8sJYjq
 ETlLz9z+1Y5l8gTEqk0lg1aMQl4hT2eaDL8PSoiwLQsMGDHj4FBWw5cTOzaBWqm8x0mifw4fluM
 zhObIH4cIdkOH0rwHNYOqE5101JGN87FGproUKczDodSkplsK7sQIOFy0odjNn3peZdZdxwOMio
 mYHhDv6N7sczaLqL3ZWi0syNbQ2NEe7X5tp7vsJ7cLb6qD8kzjRJKHG69Hej1KnikN3ZpxgZJ6N
 wNYzqmvg40ll5XNVL7hBUWE19DatlwJB0UXRDOBaG+kwWzhB3rW5Cxn91m1aj6Plxw8JBqbR2lx
 J9dYgAFkC2Je+ZQpduWj/gFFYx48imwaW8A06WbXpOJOrHHIjqyuj06yy+BvH7SBs9zxiZCzif3
 uSqGpx4waiFc6GsmuvCJxCYMNYolq2CHYI2Y80lg=
X-Proofpoint-GUID: AcnBYMpjdHORekP3IVPbpincr8iYcazk

On Wed, Nov 26, 2025 at 06:56:28PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> When dtrace constructs a USDT header, it includes the header sys/usdt.h.
> 
> Add a note to our documentation that /usr/lib64/dtrace/include needs to
> be on the include path for this header to be found.
> 
> While we are at it, break long lines of text up for better readability
> of the Markdown file and simpler diffs in the future.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  ...ticallyDefinedTracingofUserApplications.md | 115 ++++++++++++++----
>  1 file changed, 89 insertions(+), 26 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> index e8298dea8..1ad4f6410 100644
> --- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> +++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> @@ -1,17 +1,26 @@
>  
>  # USDT Provider <a id="dt_ref_usdt_prov">
>  
> -Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
> +Use the USDT provider, for user space statically defined tracing,
> +to instrument user space code with probes that are meaningful for an application.
>  
> -For example, if an application has `put` and `get` operations, you can insert `put` and `get` instrumentation points in the source code, even if each operation is implemented on several code paths. A DTrace user could then enable such probes to trace activity, even without knowing how those operations are implemented in the source code. As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled. USDT probes can also appear in shared libraries.
> +For example, if an application has `put` and `get` operations,
> +you can insert `put` and `get` instrumentation points in the source code,
> +even if each operation is implemented on several code paths.
> +A DTrace user could then enable such probes to trace activity,
> +even without knowing how those operations are implemented in the source code.
> +As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled.
> +USDT probes can also appear in shared libraries.
>  
> -USDT is for user space processes. For kernel modules, statically defined tracing is handled by the related SDT mechanism.
> +USDT is for user space processes.
> +For kernel modules, statically defined tracing is handled by the related SDT mechanism.
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
>  ## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
>  
> -Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
> +Define USDT providers and probes in a `.d` file that you add to the source code.
> +For example, a file `myproviders.d` contains:
>  
>  ```
>  provider myprov
> @@ -21,17 +30,28 @@ provider myprov
>  };
>  ```
>  
> -In this example, the provider name is `myprov`, but, as with the `pid` provider, DTrace users must append the process ID \(pid\) of the process or processes that interest them. In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids. For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`. In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented, even processes that haven't yet started. Or, as with the `pid` provider, you can use a symbolic pid, such as `myprov$target` for the process started with the `-c` option.
> +In this example, the provider name is `myprov`, but, as with the `pid` provider,
> +DTrace users must append the process ID \(pid\) of the process or processes that interest them.
> +In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids.
> +For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`.
> +In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented,
> +even processes that haven't yet started.
> +Or, as with the `pid` provider, you can use a symbolic pid,
> +such as `myprov$target` for the process started with the `-c` option.
>  
> -The provider definition lists its probes, along with any probe arguments. The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
> +The provider definition lists its probes, along with any probe arguments.
> +The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
>  
> -This following example runs command `./a.out`, then traces the USDT probe `my-put` on that one process, displaying the two arguments to that probe.
> +This following example runs command `./a.out`,
> +then traces the USDT probe `my-put` on that one process,
> +displaying the two arguments to that probe.
>  
>  ```
>  sudo dtrace -c ./a.out -n 'myprov$target:::my-put { printf("put %d %d\n", arg0, arg1); }'
>  ```
>  
> -The following example traces all processes with `myprov` probes, even if they haven't yet started. This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
> +The following example traces all processes with `myprov` probes, even if they haven't yet started.
> +This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
>  
>  ```
>  sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
> @@ -60,15 +80,27 @@ void foo(void)
>  }
>  ```
>  
> -This example includes a header file that's automatically generated. The name of this header file is derived from the file name that defines the macros to access the probes. It defines macros that provide access to the USDT probes.
> +This example includes a header file that's automatically generated.
> +The name of this header file is derived from the file name that defines the macros to access the probes.
> +It defines macros that provide access to the USDT probes.
>  
> -You can place probes in the code, referring to the probes by using the macros, which concatenate provider, and probe names, and converting to uppercase. In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
> +You can place probes in the code, referring to the probes by using the macros,
> +which concatenate provider, and probe names, and converting to uppercase.
> +In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
>  
> -An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
> +An optional optimization is to test if a probe is enabled.
> +While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions,
> +setting up probe arguments can be expensive.
> +In this example, `bar(1111)` and `bar(2222)`might be costly function calls.
> +Therefore, for each probe, DTrace also supplies an `is-enabled` macro,
> +named by appending `_ENABLED`.
> +In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe,
> +to help minimize the cost of any work associated with disabled probes.
>  
>  ## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
>  
> -The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
> +The `dtrace` command becomes part of the build procedure,
> +which can be thought of in four parts:
>  
>  1.  Generate the header file that defines the macros to access the probes. For example:
>  
> @@ -76,25 +108,44 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>      dtrace -h -s myproviders.d
>      ```
>  
> -    The previous command produces the `myproviders.h` header file. While `dtrace` requires root privileges for runtime tracing, generating the header file doesn't have this requirement.
> +    The previous command produces the `myproviders.h` header file.
> +    While `dtrace` requires root privileges for runtime tracing,
> +    generating the header file doesn't have this requirement.
>  
> -2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions. For example, for several source files:
> +2.  Compile your source code.
> +
> +    For example, if you have multiple source files:
> +
> +    ```
> +    gcc -I/usr/lib64/dtrace/include -c func1.c
> +    gcc -I/usr/lib64/dtrace/include -c func2.c
> +    gcc -I/usr/lib64/dtrace/include -c func3.c
> +    ```
> +
> +    The `-I` option is to find `<sys/usdt.h>`, which is
> +    referenced by the header file generated by `dtrace` in the
> +    previous step.  The path to use on your system is given by:
>  
>      ```
> -    gcc -c func1.c
> -    gcc -c func2.c
> -    gcc -c func3.c
> +    pkg-config --cflags dtrace_sdt
>      ```
>  
> +    Note that `<sys/usdt.h>` is also in the DTrace source code
> +    directory `uts/common/`.
> +
>  3.  Post process each object file using `dtrace`. For example:
>  
>      ```
>      dtrace -G -s myproviders.d func1.o func2.o func3.o
>      ```
>  
> -    Again, `dtrace` doesn't require root privileges for this step. This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files, linking provider and probe definitions with a user application.
> +    Again, `dtrace` doesn't require root privileges for this step.
> +    This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files,
> +    linking provider and probe definitions with a user application.
>  
> -4.  Link the final executable. The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime, for example, when you use the D function `ustack()`. For example:
> +4.  Link the final executable.
> +The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime,
> +for example, when you use the D function `ustack()`. For example:
>  
>      ```
>      gcc -Wl,--export-dynamic,--strip-all myproviders.o func1.o func2.o func3.o
> @@ -152,7 +203,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>  
>      ```
>      dtrace -h -s myproviders.d
> -    gcc -c func.c
> +    gcc -I/usr/lib64/dtrace/include -c func.c
>      dtrace -G -s myproviders.d func.o
>      gcc -Wl,--export-dynamic,--strip-all myproviders.o func.o
>      ```
> @@ -168,7 +219,12 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>              tick-5sec {exit(0)}'
>          ```
>  
> -        This first example, runs the `a.out` command with the `-c` option. The `-q` quiet option suppresses extraneous output. The D script is on the command line, and it prints both args for the `put` probe and reports the `get` probe. The example refers symbolically to `$target`, the pid of the target command is specified with `-c`.
> +        This first example, runs the `a.out` command with the `-c` option.
> +        The `-q` quiet option suppresses extraneous output.
> +        The D script is on the command line,
> +        and it prints both args for the `put` probe and reports the `get` probe.
> +        The example refers symbolically to `$target`,
> +        the pid of the target command is specified with `-c`.
>  
>          After five seconds, the `dtrace` job finishes, ending the target command.
>  
> @@ -184,7 +240,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          kill $pid
>          ```
>  
> -        In this example, the command is already running with process ID `$pid`. We refer to the specific numerical pid that interests us. The `dtrace` command doesn't, in this case, end the process of interest. We handle that separately.
> +        In this example, the command is already running with process ID `$pid`.
> +        We refer to the specific numerical pid that interests us.
> +        The `dtrace` command doesn't, in this case, end the process of interest.
> +        We handle that separately.
>  
>      -   One more possibility is to run the program using:
>  
> @@ -196,7 +255,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          ./a.out &
>          ```
>  
> -        In this example, the `-Z` option allows for zero probe matches at first. The probes match later, when a USDT process has started. After a short delay, a USDT process is started. At some point, the USDT process is ended.
> +        In this example, the `-Z` option allows for zero probe matches at first.
> +        The probes match later, when a USDT process has started.
> +        After a short delay, a USDT process is started.
> +        At some point, the USDT process is ended.
>  
>      In each of these cases, the output is printed after one second, and looks similar to:
>  
> @@ -217,10 +279,11 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          tick-5sec {exit(0)}'
>      ```
>  
> -    In this case, not only does the `put` probe not fire, but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false. Therefore, the `bar()` function isn't called. The only output displayed each second is:
> +    In this case, not only does the `put` probe not fire,
> +    but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false.
> +    Therefore, the `bar()` function isn't called.
> +    The only output displayed each second is:
>  
>      ```
>      get
>      ```
> -
> -
> -- 
> 2.47.3
> 
