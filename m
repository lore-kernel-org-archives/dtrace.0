Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64631064E
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681496; cv=fail; b=E6gY4YwVsyDkbMHuzHV65ZohRMyyH2f80GL28/mgrZj+l1yjLFXMClfCDbGPIM7mKqbUo4n38qqA870NBoO8LhwQKgL0u0cOv6Fo8/qz5z/dTILPt8Gb+8ad8W3RD45AeQ07bt0ntFBSYKtB9tqlO0rT1j9Jv8bwq3X6NSPVSpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681496; c=relaxed/simple;
	bh=XpQn9nnRaF79wfhvG+CVkzI+PWxe/spd7PzQZL/yAw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tfHeiVtQWyYcB6kIXy+xG4KJI9lDzoUv0IR+qYBVDSqZD94lNpJa8A3m2AHIAjGXexwYNaSXu/5DeQykgEc1Vt2MhZ68/e97yqPKS4uSx1nWhG8+H/SpzP2O6W15yuB5LNAXJGauESb631WvTOBgzGqTdwETaTDk67P+wTaQtmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mY3GsiU+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O27XO4Rm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mY3GsiU+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O27XO4Rm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLuo30024126
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=j7brr/6OgCGTJZGr9Z
	iVf73a++rYWGWLw28UvznTbbE=; b=mY3GsiU+q3NdgrdP+aoug6ElDhH+EEIIsX
	ktbtWr9Thnzdylu/+kMqYX5Z4Xo0uiabrlXwkSGWhUtHfMgBlFR5U6+cREQDM48Q
	kN9CZs+yRDsZXaDcIreBR+EePO4ddO3xX2PA9ADO8I+l89E1FAVWz8xXhU52MJC2
	HZPZNU6+IAS+ZMDeINqQkaqGN92VLOeWaBtU5vaPKr5NdFoBxWKcZG0eLdViioO1
	28246qm23YLuqiurFCYdxMbpVYUn9UYcHPVPgTy/1AsorhwRYjJKivNQKqZQss2p
	PjoK+0dLalv09Yd+yR0OHe2ayabF1ZDD0AbOfS/BhxIeOf6Soerw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe59jcd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:11:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59H41KEb013693
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:11:32 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpcdjc5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:11:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyqGkfHii39Plfq1MNeE/J7CAug/OjlHiumSpSpLF91GngZSnXbMf2fW7nWRLNlfXouhudIZyp4KtFiBHw3HDbyr8N8qYoxK8aaWXB3gCVlkD2q0TnpFDmYrE1hSyXWsx949DCvjU2dD8TUkMbdHUIlaH/XF7BrSzTRvLUyLd1iL6+ZbZJW5khqXxfBNYVqi7P5JWrpgFZjaCqVY7E5MdKs5PCCbBxV1lMrbHtq4UK9ZsGn3rQfkC41QN1bNK274GQI40InAdPMyQImyWlSjVAZqAlzU6lt6S4EN/e9zPJC+gHEI5xAjpLdYkoAM6CErnHuZa7lTuouHQ0u9kbLgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7brr/6OgCGTJZGr9ZiVf73a++rYWGWLw28UvznTbbE=;
 b=dQjqZfQkO+9ApqhjwKvUvpGWfb5ii/TKMHdwlX8Klhzv0l2W0g+iSdcrBVe15RtEVVZ/dlDn4dMBVoNgjM2kATzOK8vMNCrtVgnXt3Y72nMbJtcDOoN7JY/B++abQ53nD5ZMSq71QCjdZPH1zYoQ36+70omzgSXEbsQ3kd2BnFqbzmwVfR2Ek5q8QPKwCkMpHElP5/AMycFyNhJ3yqi0YydJy89Nfcu0vy5RhPmRMysMRNCmYzAUQ6quPRFsOKLpVpagkZmAYShE2o/ZcrKjMXrk+TroRrWn9LZVh6a9EXXvhFyK4byF96B3pDPVjM3Vru+CRBLTpFB3WbFs2ffy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7brr/6OgCGTJZGr9ZiVf73a++rYWGWLw28UvznTbbE=;
 b=O27XO4RmEHzpRLh3Z8qaORMkAsoMUvTSi4Exj7XaXPtKUKTFrmT8y+bULZcaatbOUg+v71t17oTWRw4L5umHIyZ90LMfJkPhbGwuW5XdDZWPaJrSzLwEZUPLrYM/+0ToCDwY8+vbw1gBnWtEsG7+0psCfGjI8VOVmZngmu14kog=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by MN2PR10MB4350.namprd10.prod.outlook.com (2603:10b6:208:1da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 06:11:28 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Fri, 17 Oct 2025
 06:11:28 +0000
Date: Fri, 17 Oct 2025 02:11:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Use copyinstr to copy string from user space
Message-ID: <aPHeDg24CHniVOcP@oracle.com>
References: <20251017022113.16738-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017022113.16738-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|MN2PR10MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: d468b02f-bdf0-4f59-acc6-08de0d4402a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y9d0hVd0FMrkb2cEtqYBmTGWF+dI1P/H4Rt1XTz6qTyV9vYgfd+qKwYJpmop?=
 =?us-ascii?Q?LXgAWwWrUYxgjfJYCmg/mclnSBgPsniSoyzusI3wA9w8c80cP/oxcoDMYtzx?=
 =?us-ascii?Q?cqw2aW96siX5c+SXJtbQTMSLBonjRIHr7yxJe2c/p/BXdS5FA1hxJ9kl0VD4?=
 =?us-ascii?Q?9io5NDOMFi4WpRFkgNtuGvGlhPGjIhNj9O3TVp6Sv9bw5y4ewlRhGkAzGn/z?=
 =?us-ascii?Q?hMra+wT+fwEy0uqif7qpV1cBITTsGx7AWMQO2CyMMXVTL0cx1IA//uGxuEMs?=
 =?us-ascii?Q?P2SvqhlPOmWR/QqDnqA4nQbA93lIcOdZpTTRfMlCwisAK8mvugq1K0wYec0q?=
 =?us-ascii?Q?13ckKdZLDNRsqUPIaNGfZQ0bKzKDSwdsF2ckUQM9DC87rmMC0KxrNg+QiBPf?=
 =?us-ascii?Q?pzkDGHVw+lkc+exRVFG7aOUW2h9Ur5/6zZdiXuwK5yPz7ngLAbc9IarLYRuz?=
 =?us-ascii?Q?WulFXG3HtfUKvGo6STMAT+5SzU3JkPF6Q8xdnuHWt0eOq66f7aHidHtrf9no?=
 =?us-ascii?Q?kVlBE8bXCoxedPmqgwmecPCZBsvqQAczwwrKDgc5XKUt8PX+M9mlJjw0+d6S?=
 =?us-ascii?Q?RABtr+4nWaE2uYI8CNcagw3RCSaGp+fS7wxqTwGYCYGrRW2caUSeibdUAGX3?=
 =?us-ascii?Q?Bh9/rX1jVS9gFUfhv+iq5OQHcxQ8Tz+jSKkzqjVgszTGOASi4Ac72tOJA3J/?=
 =?us-ascii?Q?yTucCA9N66T/A5QUa7Unz/0EBE9Nmo/wV7/NbEfKcxl8AkwUWANMBa8nZCu6?=
 =?us-ascii?Q?tSxc65zHro45Q754kO2qqnlcYCvHayra7noYOMjjHE6tImQVsl/ciJvtMeTW?=
 =?us-ascii?Q?ZuMq1Pk0Id0vLqgjgQaaDma/bCqFhvqb6I+9KMVmMPe6Pph3GquNEA7CjV3L?=
 =?us-ascii?Q?HXqZ2PU8+h6W0XROlucg0cnJ63FpuIFm2OBdJNTo+rRodWvpYuoJ9mH5Dm+O?=
 =?us-ascii?Q?OwkY1A4bdNfjRSBwYJCknUioCwEN3vNC9OnL02UnzLXDLktL4aRnrNoKw0Mv?=
 =?us-ascii?Q?Co5LziogCKWUya/5PY+ShpNbTQTHBNpGcYXd9+IRqO/aCTLCVVqzsIwn3yAM?=
 =?us-ascii?Q?5llQIKtCSnPgwh/wdS+1MK6pVY+7V6GZy7enuxYPSa/cPpt5g5NPiBcb0iRo?=
 =?us-ascii?Q?HLm1OZLvaGbMLHpnB29Q5tn+/+7+2vrW9U20HQqyFGJ7gM/YXjI/wAHzJ92Z?=
 =?us-ascii?Q?YbMD3++Ms8T4DsHHW2aPLdPawEbLL/rv1KPEwfdbplj/UWLF0hunR0N+iukI?=
 =?us-ascii?Q?36P3HJk/cZgrc/6IOmfZJVKC996w/Q1Q6j6Od+XgMJ51bivBizqPWDPHPRhd?=
 =?us-ascii?Q?BN9j+1OOxwoZOvc7uawk1ivBGJ1ZJHozkzXGNuqjrHxVdWBECoA9zzVLLBZG?=
 =?us-ascii?Q?mZoOgRMgss82/0YIJAzjS48E6BocrlTCzuVfAGfYzKyNapja/Z05ru4Sw3G5?=
 =?us-ascii?Q?emITIf1p3zCrA5eZt3MfVXFfr0jsSwYf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJli7dpfmPbIdeTdXxuyo7shp6GM9oNe0TKsfkezIGHZ5InIvE10IcUy/vY7?=
 =?us-ascii?Q?V/DVYKaLhsK/kTqQZB0qDp5pU36unkpYDB4QtBZXW485DCvCnCbyM1ettbmz?=
 =?us-ascii?Q?0s04qkCMYrv6QVwzdC6bWKYCcSqDPkqoGPMQI/qehdfeB8l/MUo2AYlZ5vxM?=
 =?us-ascii?Q?HPQZZQKpuWvqJUI9udLkrnsY7Vb5nUl33IYB5bDZMWo2GK+x2XOBpTwSOljn?=
 =?us-ascii?Q?uawLjmX70By0kplDd5NtIsBr5XE6P4Ji1TAznFGavQ6bQJgeNVcvIi/Vnqxn?=
 =?us-ascii?Q?RD36EyE3lE0kpvBjBQ9LTo46Cd4+cMhghPAtZ8EIEV+U7BmVGgxJoMkVOfcq?=
 =?us-ascii?Q?0TZ39/M6oaclWBh+EsOMoVG5ILoMeW8GOwiYdCWQfdVZn3Oa9hH/M6iPgYUD?=
 =?us-ascii?Q?p0RItN7MQ9Z2kwxsUZA6rfjZQNYDovWCIxns8MCGMvv676f42GiS+8A7nDTL?=
 =?us-ascii?Q?pzfBakn00wdQRcl+RRnEGHeV1IQ2GRw4inxBc4bszInzPq3mNdts/q6R1xFc?=
 =?us-ascii?Q?ND/Dhh4soECHQiVuU3kxCqhLCas206uk+8ylTF2fEyBL8GA47HSEOK5TbA3A?=
 =?us-ascii?Q?+n8u/CzofgBgxyQ2HxlA5arcM8OP/nKurfphcoscfKlgZ7YqD3Mo9AcPlYf5?=
 =?us-ascii?Q?he99dYm2Z4iH87um+a2Nx7ME+sGgYoSTQt0l/6/GDNYlRDo2+aEM4fXYYWqe?=
 =?us-ascii?Q?SeddHYd37kjVE+tbQYUHIw7P601wi58J0DWD5nlppP4uxrme5NzGkcT+bcuP?=
 =?us-ascii?Q?4apGszFpQNVq6eXlsOQSbZQph0raqTOellm1mJYz6rVEdt+psETAdnRV3hMd?=
 =?us-ascii?Q?aP70o8YvzCUliIEsjHkFN+yZFAXXN26OvzOuF1y7DT+cqAvVelk4wI+aMRT3?=
 =?us-ascii?Q?M+UEyMSyRyjxvFAWWOvyMPBtCVEIUM6MKNKXtZQ1v1y/TtvxChXFC/pmW0cm?=
 =?us-ascii?Q?NCImHF2tPfT7HIm0qB7kWDC5dBKGNQF0WH54ZI/Yp4FhDSdZeNLdolEgVRLY?=
 =?us-ascii?Q?wMLTGTKDGEEEi14CA1GDpijwsIGqJSXIycuQaCw8CNwi49dD86BFYaZHTfMb?=
 =?us-ascii?Q?EWUHVbtXP2xqrydZOxFEo7By/+GU4ZUxXq2z34NxAnu07wjd2HDAPb8fs1hI?=
 =?us-ascii?Q?sxyRHuqP2TEbzFOQChcy846FXUOErTuEiteRVbG5MsUUZylbg0Si+Oio8cEs?=
 =?us-ascii?Q?wwUHRn8RbCUoWnbAK7Ng8wJyCIt0hYnyB9C9aWfSIQAksjnkveWwMIduJBXQ?=
 =?us-ascii?Q?z37afna0VpR5KjKt/2IPoZBw14NU4b3MJqKdu2x5rWuZxRy3rk1MR1WY5q0O?=
 =?us-ascii?Q?ttXhqlLDxPG/8xWsW4tKOlsL5YijqkusM4fAiuoZlK0Y03dtoz/U6j1Xb0C/?=
 =?us-ascii?Q?mrgUCViqN51kNjnyexAkN8vd7bh7Z72XWt8vpVbyfEClCOXQGp95f/y/OmWy?=
 =?us-ascii?Q?+fcOvxN52WCfQ42OwJv9dR/ilWAPm1rDdA89LPXP0ZQxcFtoCeCKJ7hAUDaH?=
 =?us-ascii?Q?hrKP5iaI42PmX0KDLABhjTlgjyG1/OvtU3/yWnnvEg1/CMHxc4alsvtXRH91?=
 =?us-ascii?Q?tH/QMI/3+x+t55iVM2/sMgjOfwyg343mP/SeI8sgLVI0KnXD8DMm4z+/vnvb?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vy0Ffx/GQV/KTpUjsTrZO3oyWTPROnGGheyuqZbq15zK5KOfLXls5BuQ9Tv4P27f/Rf9X4WxWb4U5a052sMXSsPWmxExFLEN2GFsFmGhYHn2APrwOUQ3WSvhab5EAY0bi45lK2+TLHtgQvsN0AdQTElEQrljhcEiBCFN0pdlnsUTRzJJfJlc1Qj8J3wgpgXKSnP+sjyKb09PnB3oiqmcox+Tc4MzT2pOeSQ8sI+zY8+/CKlxqL8bXAkxkX5oVTAsR2JiVsWBvTIbGhz3kB1c7Kzkbq1f6V6sUYAvM6TBweEfcDz12DRLy8faQvCwZQ5IWFMz900CZtaKW49OVa3XSqfxzPP4ruA0NTFzew3sIK++1KSL/eq6rW9CNZmK9/RZ/R9INy5TwTB4MlQIgHTMA45TgVbtfVWAo1gDLPU7kyK6/H7KoUTY2uAySjm0oXEZFaCuLZD/QnoC8z/+SlqTFzTM8BNEgBeCF1brm2VquFhLrNXeHTOyO3jKGQo5hhdYr1FikcfT7ag0nuZNeqk4LwhGg4xeoa0su1L/NdouwfqqTebLyOzlTB6dsKr40+MpZjouzRcPaOCfAnNNljUUXD1U+1riRrLIa25B3HX8HDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d468b02f-bdf0-4f59-acc6-08de0d4402a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 06:11:28.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYmBnVvliHntGRZiulInqulgd8214W5wrYZXcrVcWVKzRSdZsEwiftCLPCL73O3wxv85915yDA2asCJ8oR/KTchCTWzHJZxYrEm5GNdoQ7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX3g1m5ofeu5Xv
 UswdvQ3/d/q8jnzVMnzVrOpI5zuHRdWpspoDkouBGOHr3WEhBC50CGInl78XkzMHgbQQlfT33kK
 QzeFCz38ab08uQZgPK6I7LsGuSgCdrW346sQ5PPy89U9hOXOcL7Gb04d+A4kPuh5SPBrF+EwN5n
 a9UQfjt63cWblVCIgbWv/KfT87gfgdezW0Hp9fc0E8jKhe75BzytwvMrrUiKohSL7MFt4UQSxAt
 vDz7JBrtUZqNOqjZuPVAyDyl2FZlSve6SdzplGwrNWEh44XPfgo0MCqS+A4e979Ichj9JQU/WZN
 6rir74zHx6nr26KbWkFSrDQMKUmX+Vn3Wf8dsU1YJfbBUTutLGLl0bpe+QMywrRXUXQ942GnBkA
 q6LQQ/WEUlBkL4ndAg1T/SvOn08oMPy44OVo7RCIpvFazY6SR6o=
X-Authority-Analysis: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=68f1de15 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=8LATdj-Ah8OcnwY2NbEA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13624
X-Proofpoint-ORIG-GUID: CTaALcdZ9Y1kkKM0RMymCrI_SQjFYbc6
X-Proofpoint-GUID: CTaALcdZ9Y1kkKM0RMymCrI_SQjFYbc6

On Thu, Oct 16, 2025 at 10:21:13PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/proc/tst.exec-execve.sh   | 2 +-
>  test/unittest/proc/tst.exec-execveat.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/proc/tst.exec-execve.sh b/test/unittest/proc/tst.exec-execve.sh
> index d3f84e0d2..b70f0a6ea 100755
> --- a/test/unittest/proc/tst.exec-execve.sh
> +++ b/test/unittest/proc/tst.exec-execve.sh
> @@ -42,7 +42,7 @@ proc:::exec
>  syscall::execve:entry
>  /ppid == dtpid && execname == "parent.x"/
>  {
> -    printf("execve      %s\n", stringof(arg0));
> +    printf("execve      %s\n", copyinstr(arg0));
>  }' -c ./parent.x
>  if [ $? -ne 0 ]; then
>      echo ERROR
> diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
> index e4b9dfa5e..09a3d9338 100755
> --- a/test/unittest/proc/tst.exec-execveat.sh
> +++ b/test/unittest/proc/tst.exec-execveat.sh
> @@ -44,7 +44,7 @@ proc:::exec
>  syscall::execveat:entry
>  /ppid == dtpid && execname == "parent.x"/
>  {
> -    printf("execveat    %s\n", stringof(arg1));
> +    printf("execveat    %s\n", copyinstr(arg1));
>  }' -c ./parent.x
>  if [ $? -ne 0 ]; then
>      echo ERROR
> -- 
> 2.47.3
> 
