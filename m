Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229D2882CB
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589295; cv=fail; b=S+0FSL6m1Ot1jfPRs5snYZg+H5UJY/4E7VN4lJOZpMc5wdzawh8UumgTvd6u31hYVhEyM8bLJlwUYndsFpP7oZlytDT6nkcLobBxjdKvubBWosDB9CHwEPbmF3W28Qgv47BW1bFixk7dE/fDM9TECvs2Ftrm6wkRjkscxR7o6U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589295; c=relaxed/simple;
	bh=61zdWZz0vQOLR9wqeomu30ywgPMJ3PIWgLYlFgbJ7u8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=nNQ4v/YAAStWGYKmDpRl/2cdKN/EvPlO+HdVobSWjpkGBdUESbOYgoLWFnrc34KDV6L8Rd56TGBwdDgnQM/KME+gKyKsXScVb4QY+wECUmm5FgYI6ohOx0u1iRDDE8cWjI96zLdudOO/JR53Eea0fYM/Rsv12eEZrXYCKxSvauk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hq7sqwhJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lmawCbLk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hq7sqwhJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lmawCbLk"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZDnw017570
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kh9eqhvTuGBboeTcqE
	rRd64TjigjLDHCDQSn64A0dBk=; b=hq7sqwhJ4WaDj/GNsW7zTq+y7Nc3thSLCl
	eEIkYLkWF9/ZgpKdE3loZea9a+vdedXpNQSAU9AaoV20K4gtmWqPj5SWbApbmnvj
	jB4dVahwrnGcZQWGjo6zlzNTEcNHBVdGbPXbD+wNz/SY1yjK/YsOrW/EeBELD3aF
	ZzH3n5FeL48mC/mZV9SLcxolVYGVcaruDv3EvnkdO/H8aP9rAOOSHiy67PKRO4SK
	sAZGr87Qp7v/rXcEfh+ReiNcOKtdNDIP3jKjOAqUrDVDZMNZ5ducLQmx1Fea98Jt
	8FRtk53It6Rgdp8libwBG+OkYmnFKt7csxd6PcsU+JI7TOf/m4Vw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66xgqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:21:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FD9cfs029007
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:21:32 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59sdf4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwOrQvuCQSRy7+AZVCveDib7s21AI+jg3YiTB0y1Fo8n5izkQqDx0490ZfMx4pghzWqGtygVfdFEX+Ce94m89oXlT7+xDH222g+4F1zaHqa1bRb6HSPr7uC2CXXkSCffeEzS1mWyG5nWT8Uz48v2qzX3Gdxzc+FYTFyHl/EKV0CNpBavxoEm1dAa3ddLr+sTH8Jn4A877nwA26XeMD5PwXFwR/aucG6EvHoJAIqFvTbDQ9raVF9wMoeW2yKQ4vaekCZnwlqmhs5jyWU+mfxYISFqBk2GEseuV3di25ay570wd2Pi6VvzIaQe22sCIPS8dPGQFxO7jLgYvV9623tO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh9eqhvTuGBboeTcqErRd64TjigjLDHCDQSn64A0dBk=;
 b=Zm8mo+bXqydQNwykL26VI1fn1h8+i6VMuf35kDW4n22DCNUI4V9na+onIobjiYEZIhv6IjOeUL3DPnRfN8fZDZVCYap5wo+eXmS3NNI4OyB7Zor8UliajOkpzC3EPhjPc63zQeV40O4vpFirr0reniO/igs0UYOLcsPxfuR2K4KcOgTnk23NuAB+eFZarjktyzS47t5L5hsG9u97h4o28hqpSbrEWdsz2fYQFesI3tMh+AglaU/+J/HARJyzHeR+qNe7qJYiT3yXZLYKxWDvKxa4eRn1IZ9slWMbHBlX43y/TBIqRwJ8WW5K53muumF1aGqvGcOuyiIFDYA6BnNJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh9eqhvTuGBboeTcqErRd64TjigjLDHCDQSn64A0dBk=;
 b=lmawCbLkUXM292onBoE63BfJjbzz3NZTVhgX66M9hRXaT4qAlflaKmRdrbASyPnHW3y+Jr/ljbZNTyUs/+/gagv8xg5/dFSgHAiCT5SzieZMuRBDurJjOiJ/KCyPZ68YkKS73ArArnSsfh7OgIj88dnnOiRzXzTgpj678IDEpNI=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA3PR10MB8090.namprd10.prod.outlook.com (2603:10b6:208:50e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 14:21:29 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 14:21:28 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 2/3] usdt parser: handle encoded hyphens
References: <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: you'll understand when you're older, dear.
Date: Tue, 15 Jul 2025 15:21:23 +0100
In-Reply-To: <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 24 Jun 2025
	17:40:25 -0400")
Message-ID: <87ple1sffg.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA3PR10MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: bd457582-7651-4ba8-4cf8-08ddc3aae39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ir8AqgmcAlCU2/RQ7qh+3YQtZAOzpvDpsiiT7z5180CYEh45Kn/DCfk3uk5A?=
 =?us-ascii?Q?bvXbOQU1hyCVK3l7mZm+0fKbbHZMtLnB9TNjJVj3wmYsWIgsZYE+GNkOQ6Rv?=
 =?us-ascii?Q?5l5OpqrmHnTvAxirviSwYvWy4YH+CHIhiDLLWQR5HGuJ+nB9NX3aD9G48ndU?=
 =?us-ascii?Q?xsixWfXKZi5ar8xfEj92H59w0/zjRR62KdUzKaTEkz97u6Qk3VKFVEDa9buJ?=
 =?us-ascii?Q?PNr/bkTIlFi6HDlGLSEQYtEBeIaA+EDL3Bmrh+sHL9USC7HyueO1fp+8zVXv?=
 =?us-ascii?Q?HDRqepPHLiBiaTuKeUTloXaKM5RV79PuRq+o5lVEepvBARMpVHNYj9LevrAv?=
 =?us-ascii?Q?KynYvhSQ93pNMmJPgZZSm8SmNeEJ8JnYACksLViu6yJW390ctewUV1pYfTIJ?=
 =?us-ascii?Q?Nj/2qKvT17c/edhAyXTf2hWRjwJzQTe3hxa6dS+eCFmdAQwkrSfDjqh7DsMl?=
 =?us-ascii?Q?s4/wQQgZWFv1jdeEYvGL8+whf86YXYx5ptWBlE3FbGsuLnPcV4Gh7hVIL9Kp?=
 =?us-ascii?Q?zeeqfq/+PuDRW/qM8CAvbCpLKWY/9pGFipWzkMoEH5zz4ewbDztHnqSaBBZW?=
 =?us-ascii?Q?Mc/Jz7sOu52KacDki0ScERhDDg75Vl6ryVG6SaDYeB5PkGCdmQWCv9B1AJbU?=
 =?us-ascii?Q?YP7TCq5vpta4u1rrmJufrKhF0BGiFzHT20O1Re3BEBA99kdtW0svX+cyWvsh?=
 =?us-ascii?Q?sVGCsBQYchiZiInDq9gl2N0wJ/m1ERDZryEdWsL02A6cwUK4UIq+b+2EdzNU?=
 =?us-ascii?Q?Tyw1KSf1Q7fX5eO6QYZBN57x03rTRFeWigv1bX6jOFjlpMiboi4S6hEhTUFM?=
 =?us-ascii?Q?neafqIJRM7fNu6Xdrg5byxAyH7m9a9WtsduuLstS08GAi21OGIwDCJbJR55v?=
 =?us-ascii?Q?o3kpgUOK6jj1q87PaM/PEbC1c7EI7bNImoVKBWRBk3dk8pzNWfPvuDHyHAS1?=
 =?us-ascii?Q?DF9+yn+VF3QPV0fKGlxQn+MVb3jKcHEDxusGsk6becxT8q4OiYjk67UkhVLb?=
 =?us-ascii?Q?+IOd9ZwvIeaQHYcocDb/ymaJmuTcGhtY63fknRyVhc8gI1Pd5c90SWF+ZMi+?=
 =?us-ascii?Q?ulGJ7dUChkgi9xovxi2SOeWkG+fMFLuQ0u5iCBqoA4CPgVW5S9hjR3aJ4YOZ?=
 =?us-ascii?Q?z1wC3x6J/erwAMMhcl7b/4xGN0xkSV5LE0LX/2HXfLS9HQqE2k4BqyosO1h/?=
 =?us-ascii?Q?9posIf5a2JrKHHeqNoqsITCa+G1zwEIEMavWeEFTiPq2MIKfIE3sENKGpFlm?=
 =?us-ascii?Q?5IF/0ZNlQ+r0tqVyWAnm9Lk2wgfvJwr1Wf9+/6lXmnOoaq+VB7w0/t9LsWGD?=
 =?us-ascii?Q?N0oAoiaCc2PWRspHI0nIcBf95bG9mpCZcKKXlAX1DbtnkCBbniUb01whbXWO?=
 =?us-ascii?Q?sLDHfmhJZDuofr+IDxcfLD1hglSvCUx65obUTrAJ2yuWdyX70fSC0z/KfhBj?=
 =?us-ascii?Q?3rI4sazyTQY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJJSQnqof2tAiJ2cKokmJ8PP+4cDnGSqxcNi3664quFpqCJx/KDnVsADRb0P?=
 =?us-ascii?Q?mEQxMZNLyc5ldM8uEjX5+4ZFHzd7eeJ15OIdpnrqJSzFJieNv7WJ/7IeoNzF?=
 =?us-ascii?Q?swWp2+XdL8NkuV7uw5GgpjlsBuXfmHBMwFwcWxnan2W1eFW9yYFuDn3A2Xrq?=
 =?us-ascii?Q?JG2FhQCJZYAzlMAH7AL++9d/qghtRSRTyjF+FkbiAm1g60vfVgYbxEPPR2uu?=
 =?us-ascii?Q?bRxFEUuQPX6bp7LOqM2PAsRE4vcp9Xy91sRNGvUxsnpxRbA4I6s38KfapQra?=
 =?us-ascii?Q?QJokI9+Q1+EqcuxiI2JNl0vZDOqnrLft781DT04996cvarKpzG6HzW4jpRK9?=
 =?us-ascii?Q?CCUccjR1Ej1tZXJSA3gEYTqPYgk5qF8lpK1mr8YGq9lr5FIfHr0ADJ69NkSY?=
 =?us-ascii?Q?IXVc6aK4rD0sCMeDrVUcRt7Znjplpv5zgwi1JUkiLnuhJKczFVcIWsb9nSYe?=
 =?us-ascii?Q?GlsCodIBnJEBjy5dgnmV1GkL/FFOYK5UtXhynosUbB5sII4cfC/+ZXCM6pkj?=
 =?us-ascii?Q?UnbTlubj/DNXbO4yMYvx7mxi3LGr4wgsVnEm3Ok2+Qt13cxU5NqGMlW6yzH2?=
 =?us-ascii?Q?YDsntFsjuU077cDUdrSgw4YyfrvhT1QOT+wyR8b1mFAs1jSYwzpTgMtdDlDW?=
 =?us-ascii?Q?aldAbHwGhv71uv0eDJEe62ohZ1dnY7xhhpjYhq5AN5yndIeHFUWxcLunCiEe?=
 =?us-ascii?Q?a4fx3fv8WLIuTrunIvQqPDPSTDANJH/GNEY4jdweDQeGKiYopLnLf1UGHXtQ?=
 =?us-ascii?Q?J3O6eqW6TJQhM3ryqfaTTfcJflgTvSSXNj7euW/eiKbiAHlJDjcfoxsAYKyT?=
 =?us-ascii?Q?yFh9l6I6BOF/8LQVUGKStbXZkUNIVc8NPHSlGF7hxxHl/+TSxsLdmSEKpoh0?=
 =?us-ascii?Q?UIZLkoM50JP6ZO3g36irfjIlYQZP9boYKB3MArXiWdVMg08JxTfcNu64eSsD?=
 =?us-ascii?Q?F/BTlVk3Vc/ttRNmqy/Jl4/CnRSYfetlNe9IEy5ckVwykxW5c7mri9v+0M0i?=
 =?us-ascii?Q?f6wvWXd/OfhmoypqShiosxpW2kbst0TnV4Px+OdnXM/RwIFanP9KxC23z7Ym?=
 =?us-ascii?Q?2TFy1PFihcQFG4bRpkSyV+p0hBBsBnUDh+XTU1yhdpN/qB9LznnVW7TlQsbh?=
 =?us-ascii?Q?afTZlEunL65UTKo3OfW/cxHRRmL4DVrSknTrO1KX7f+9UKP1GFEDfTsRzDU4?=
 =?us-ascii?Q?a+2XfutrvJ4oRDTMYi9aMu6pGofXdvbfXpcsJCohqtVNl6jCTbWxNiq266Mj?=
 =?us-ascii?Q?S6ClnuMKLvV95Khq+QNGHcGLOfXB8WvsJU2ARUeNZU4qqeN+Zr5ugO0zyvkq?=
 =?us-ascii?Q?n/jiclCMsYrxQ172mYchCGMuGqPeanwm6Wnwo96i6xlDxCbtvhE/G2rm0O8z?=
 =?us-ascii?Q?jB+8P5HyV3WCq6h5/JobXt4RQx5Zb3AN9DCSo1cgjJmgG4QGEo1Hw4k9LcH8?=
 =?us-ascii?Q?lDfo5U1gnkcHqGYkb9efqLX+fIS8Qj+HuaClqeZUcUwyMK3kyYB+NzyPGocm?=
 =?us-ascii?Q?MnXBWxYE3Ux1OHm1HfEEAutjG1IWRtsuKz9JKE2zczgA1N0XsdhDIW2K5FQZ?=
 =?us-ascii?Q?S1eQ2PIdPsqSiUIizTGbrZVrlfZhmPU8AZOEa6WT1moNamHAdd10BxNbY4Rl?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c6mX7Mpj0SL55+jKK16inqL1A6xzL2FwApWfkpKru8MCOe/scI09iaRfseB7YGpBhbaFuQVntxw5RNRWrWwC+bOsf/qRpvO0c/wkeUzYM3lWchz9T8JWsOE6FH8z2l94KJ7NdYhlqDYPh6rW8+TT+XGmVFWXDplp0p/yc9NckAosDzw79iYLX4ynLvDLifJN9EbvtCIhCG2o3b/ifumlSK8r3wow/fhO+CidZtCh9A8YuENw2UWBGZxNO70fKR4vSEVKVY41gAEe4dn8LxrhafQR7pgxWukCZWVj6t4u9nYBQWyt4oWZrhqRZze7YvxwvF4bL6bRqxdI9d4j1nbFVChKKFVhIDNbGfykM03NI/0RJ2f71qN9Iu6bg04AP55WjZ+Ojg+lUaiuhntm5lXqnq0qbIQhNThttoZ+Dz6aD6/jloFFMhdgbYrckSfvxhe0Tk5rG2fyD8fyulF9IkHUQ9LCyzFbslfmzVgo68/RhkMa6fZlH0CKaCFxu023Rl2BV7B3relmY0PZiUlYLMyFC9H9XB9e62VGvwz38hVd7xCIMvHM7MG70FPPboMbsaRQukU8cDNMNwrSEzkK+0bOrtZ7hpy2FwssctYrfXw0Lfo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd457582-7651-4ba8-4cf8-08ddc3aae39b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:21:28.9096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR8G9bwneF2yKuykATsyNOAwwQMDrAhE7wmYUkQ+Ma+WILcdLZLSgIzjlf14iPiFG7itCWwFyeDKzJ86mumzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8090
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150131
X-Proofpoint-ORIG-GUID: izv-TzJ6GuUFCtmsyELeQg55eVrvUoUw
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=687663ec cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=THyHFFEiLayxk7hGItQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzMiBTYWx0ZWRfXwkMSHkeKUhJ2 xY1eJaPCv2iaF+yBCaG8Y/oujkzdepFytsaooLNa84mxIUkIhi2DqienVUWP4xhqKt8a9e6cXTd 0x2VhdGAr6+S+IX/fH0q00W8LzMYdZd6qbFMGBpmbkefs/0tOgWugGiJ1I5Aq6zqj1GooZKCL/G
 0F53NsB7SuHos/Gp8iF4w3wi1NzDfv20JfadPYA0hCSkVVoJ1FhDk7cPxlR3IYb9TvN+6VdK/Cv IFcxyeemFpwIlP7QIUgObG+lfnjw/lfCJc9c7ogVkeH02T0LLGaKTdYjPN7U874tgC5IN64ms1a xNEkkwpVQURc3cHX95MDcf6ybYxeRSKfRIObmGKU3WJ9xdUgcrjNtza5EJfOXLcGh83UTNDp32m
 EALgQ5yv4aOA48uQsVitrRlN3o8vjgIYSmKuHx6xxfaK3Zn9HAIWj7LaiKL6NGejd+UQS4PU
X-Proofpoint-GUID: izv-TzJ6GuUFCtmsyELeQg55eVrvUoUw

On 24 Jun 2025, Kris Van Hees via DTrace-devel outgrape:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

How did I miss this case? And yes, no probe with embedded hyphens will
work without this (such as foo-entry above): they'll show up, but as
e.g. foo__entry instead.

You could probably make the test fail by explicitly naming one of those
hyphenated probes in the D script: right now, the script just uses
wildcards, which will catch everything whether the de-double-underscore
code kicks in or not.

> ---
>  libcommon/usdt_parser_notes.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index fb57f119..d3d744fb 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  	}
>  	prbt.off = off;
>  
> +	/*
> +	 * If the probe name has encoded hyphens, perform in-place changing
> +	 * from "__" into "-".
> +	 */
> +	if (strstr(prbt.prb, "__") != NULL) {
> +		char		*q;
> +		const char	*s = prbt.prb, *e = p;
> +
> +		for (q = (char *)s; s < e; s++, q++) {
> +			if (s[0] == '_' && s[1] == '_') {
> +				*q = '-';
> +				s++;
> +			} else if (s > q)
> +				*q = *s;
> +		}
> +	}
> +

This seems OK to me. I mean, fairly horrible, but C string handling *is*
fairly horrible. :)

-- 
NULL && (void)
