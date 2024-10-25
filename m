Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656A18A932
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824927; cv=fail; b=TegO8gufXp4RZ+YhlTMTghZoJ2MKZk4B2GJSZcm1Wh5l//sAhuVeFPQo5mTaAMiBvZAxwcnnwP8i/k2zmEgNl8fx+/UMxlE3GmYExA9NIwNJ+v3Y+zYjgHPVW2BM6QhhU5BaRD591HdVgOgCncoQfYYEAzK5XhwT5azSUdwHT4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824927; c=relaxed/simple;
	bh=edAtw4Ee/k0LLAHNNXWwujAWUNY2FM6fqi38GZyRTzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a2wAdB05ksHYnauNTtXIPucdyw1DSbvUGuus2EL0ToJI7QUtpYpEs3xoTMP//juwKwl1kIs9d3p3kXh7hM+UpojzswRD9Q1s5IN1tvYJKlk+kgzaB/bSH7FGheKSFAXczLP8DZ7tM6mJEX/X3FdUU1959W/atDZiUNRRDaIsEmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P69tebgx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XffjKl/f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P69tebgx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XffjKl/f"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fhfY005427;
	Fri, 25 Oct 2024 02:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=DRBwfEQCly4XXvJON1
	An2t5jJJQ1CQ9Eh5rcb3jbIlc=; b=P69tebgxMbkfxQrgKhf36SIexWfc90vitn
	25UBOLarSKAmPuQm6JkohK4KuNAbxBUUMhrn9xZb3GxJx2IGY1f5JwOLa4jOzLVH
	ZCj4ynmpPQSPUfA/Xtj3B2zDW4M4lzh9X3DkyYnwJ/7ooQp6bui+YSlDr0ghghTE
	LCfJ1fdCl6mGTn5ezBzSSW8Bttyt0SWg+qS3R4AK7WPRf8o0YRvvAJ80WJuhyrJE
	SmQdAmK+QAwXRJBbO++VF6b8RWyS3YKk9rQeqvxse2TQEvWxTpIP96mG6Hozn9IP
	quom2kA/TczsO4ScrYamu6+IeLbZydO4nI5RjCMkHtqhTkrF1OkQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v41ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:55:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2apZa025381;
	Fri, 25 Oct 2024 02:55:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhbrvyn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBPi6YhicwCj4dN2ACfhbSXCkWa+pOeDgBbpUGJobj2Nn77bjlKWZS5Ach2lmnhutjKzHOBfC1GCC2SQKRiQpwMDaXQ0Dyb/MKsHuyXzUM+hKaSVihK0KJVzDTbzC7U3udKIFZaPfE/AU2iB1qt4Tzd7z0mqqewpXkCRODqQ9X6tNt/lyt6i1JUUDRRNYUrZ7tRKqeScdWMVic+QxscS+8x1QmUUDROVibfqgbOhOVcbuJ6UwvSrW+ej8Q7z7V1C8eNFcDdlxwkIUEZtnkeR6XBT/GmS4T8Bpz3kOMJdyoqBAscMaKVtzNybwtEFZZnaiHphcR+597oVSKRuN6F72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRBwfEQCly4XXvJON1An2t5jJJQ1CQ9Eh5rcb3jbIlc=;
 b=emXUSeQ2mBpIo3mKNEn2xJNEDYNVUmZpoWtDqzKiLhaeuOeEeysVSh2Zd/dRY/jbLKEz8nNnI6955u9tDp/QEIOqB60B99pbLZeBuzxnqXof9KHmszs62172rO2zdcEIiLD64SyM5T8ys3i+Lze1vROnV9NfyxrmQ2F/lvwNXyuWSRtpSw3EhyRtygw+OdFGiaCIlyGahWvnJrEpQNLyRzjL9OgbIKkIaER06Y+rEfjhDuQPx55MJkSJt2+D/VrNppMtfZgNCPzt7AiUZUpQp+lftQe42e9DHsPkltL9QOGxyNiOuUPlnbsZtUIlSdvG+PgBwenrnGRr0gvXTXYXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRBwfEQCly4XXvJON1An2t5jJJQ1CQ9Eh5rcb3jbIlc=;
 b=XffjKl/fA4GFA5PlY6aMkH+A+Kw8S56Q38XTyFJJtEIMN8wxPp8dTjfeYmOOv4ZHjlbdVzdSTyCuDwKwl2g4wFAFiIaohJ60JWn0u8Tdi31JPLQoYZToFWXH69H6SbWVVgF1qQCS3CLvId1Oy3Qlg3Ps5sGJhhg/1hMQfUf7Zq8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:55:19 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:55:19 +0000
Date: Thu, 24 Oct 2024 22:55:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 13/14] man: drop double-\fB at the start of every option
 line
Message-ID: <ZxsIkhgdnemiVE3t@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-14-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-14-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0637.namprd03.prod.outlook.com
 (2603:10b6:408:13b::12) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 28610756-ebc6-4dda-10e4-08dcf4a07638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rkWJq3LSvuOxED8qXxcnCZUET+9jYj/AEhunjLVRG6SvK6sCi+ay159Hteln?=
 =?us-ascii?Q?kZ+YT1d1kQtnT+pWqfXS+FXa1HSOKp88xe9e2CtaNMpjIZdCc2O7IsKHq+6V?=
 =?us-ascii?Q?7+uY0U5WXEofmtsJUqNq/hq0LmZ2tcxMnnfcYa1nbDzA1PxIUnfyBRreasE3?=
 =?us-ascii?Q?A66m88B3dkrsl7co83MeJSn1ekdafqwLb0SIBqzVKXN37PQ6dzQ4cxLJa10r?=
 =?us-ascii?Q?6JIq3P+0q/F94qYEXzJSw2h2QfxJSPGp4VUu3suRr9h+oYw1l53PkZzQZ8rL?=
 =?us-ascii?Q?xoQQ52h5Z8PH7fSl9IsG9vhHYrmNBc+i6lwwA3r68g4ZmLYZsm00hxH8CUbg?=
 =?us-ascii?Q?VkP5MdnF4wNiK+c82f9kQyTpII34OSy1IteYEzqUAO82P/mDI/SHFurdYpKe?=
 =?us-ascii?Q?cVaaRNFv5bL5vcbJyrlpKJvN+j8huECLgbajeCrN3552FKKx1O06Yepwn67y?=
 =?us-ascii?Q?/8TKwQR4WH4UlsOwaR7i/50PLgI1+IXPhkzN0Kx9V1pUl6SKNhtw0R7rbGjo?=
 =?us-ascii?Q?9FirADCJfp0QxA6uijeQw3yGx1BS6A4zQqxLrhKmbSQpT7j+cqtviMUY+5iG?=
 =?us-ascii?Q?ZouAX8oBT4QRsErwVLDoEzaAzQzvCeb4J0D6zG9KFarMOxqT1yaIBELr+6gT?=
 =?us-ascii?Q?D86u9dDMej7XKDg6VBI0QoDT/SWSagNopOMZIFLofy1zTHCk3xZCwDLYljIy?=
 =?us-ascii?Q?/jmL3vxCNc4PprSrrhnJE1Tt+OLdSf3yswC69+0KH/GLciz45n7xJuWQFj5R?=
 =?us-ascii?Q?YNpsxNAtPXHoFFegCNzliF/Czsire4SqI0KVu9X9hy4VkRA+IrJmN8sa0QGR?=
 =?us-ascii?Q?6lbUYucEeNceKgGmr3Wqhv7UL5yeJTCMMQ4xpVyvY8396Tt9RXOIeKV2fmdC?=
 =?us-ascii?Q?h0V/ED6eD4d/i6SnrlMVtsesotdQT5B9WKDTAsXO+G++bqLLa4HhMeFAKCyH?=
 =?us-ascii?Q?193uRDOtPGU4LX9q+F1bJcrnh9EBoJ80hrsehGx5aUp6cOD9Fcn2EnoPeO54?=
 =?us-ascii?Q?ZA15xcfQTvLrYl1aWUuc6JpJn14Uc7GGzuWC9KOgneb12ALc2oBHPtVucfLG?=
 =?us-ascii?Q?Sfh7eP0qAmyXx22hW+rEKp+OsmGHRbUPA995g2wknRRXHlbQ1JETcANdCF6u?=
 =?us-ascii?Q?2oM9zZ7Wg60Ujp6Zgy+Qi+QzyylwEg43ncMWCzOoCcOKXJs0NI2kp/tRC7iK?=
 =?us-ascii?Q?v4QwOIwt5DKAVZAsQXIj+C98LmOQ87NU7fM6cl9rFZ7txqu4z10DpzhmojAr?=
 =?us-ascii?Q?P7/3vhSGqHufSWQd1wDigohaA6NjoXhnGhxIUa4otfWyCUDhbFbm4bnHQ+jM?=
 =?us-ascii?Q?MXOTja1+U0jEoxOlISa9kZ+k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ji6VoLc8FmuDeNI+Uo8RFhOjx0+qzqsczUp3fDjMXq5VsfIfZuvPqHCepO5K?=
 =?us-ascii?Q?taxrvLabb2gMeaiQ7l2RBCvuWH0dXgsble0xDrtzsy7H1L9omHlm+4JPzIyl?=
 =?us-ascii?Q?2JY7QS1nDCA9Ejar/AVL6yyLwofk3YTKmn4+0hY1Pw65obW2dDkc2tMk89jb?=
 =?us-ascii?Q?GicTl4ApoyHAvvMjSjB3j31Oy90w4x11VvEtAd+2KseADA0Nafg361EdzVj5?=
 =?us-ascii?Q?X3Y64nKOLU5vpiMLmni2S7vnVfideXiyhJZapgWjTv3Y/5HeROeDjbPa6LwP?=
 =?us-ascii?Q?+zP1xlwHZYeaEmpOUmoStguA2ESbCOcNGoPN5SadXIEYA5ILghRj3IekB6op?=
 =?us-ascii?Q?1CpFmKKvSZMAlGwJbJDv1OyAPADJNpNihBGjOSVkEe689S/F7oMS8H60Fqbu?=
 =?us-ascii?Q?8Id+R7YY9BU9sFWbjLYRxzbtvncJ8dcE1kIdZ5jc2XpN/jD1hY2BwqzX2WXq?=
 =?us-ascii?Q?7ZLx/TER8cdW787mt4NJ4Xtluu3oPIfazFGn0lq13FTqffZe2eK7mVYrv6AF?=
 =?us-ascii?Q?JO/+PTA1SbD1cXTdqW7vLVbdW/OXLvUUYWy7sxrd2tDS97WBk494FKQcfcmL?=
 =?us-ascii?Q?YExMo8iLc/9AnWYKSPfVtsU7wzRcSG0WcC6TgIDpjPg3TehL/27ebNShJtCW?=
 =?us-ascii?Q?CHXGmlIxNOakNCM8Kxy3pJDouyLqtvVGLXHMbIFdRnmChxdcRPFkBTmYW/fl?=
 =?us-ascii?Q?jvo1WC6gITDlGGOi/n2ihHyctPJZ1M3WgAZuG8tQGF/lncawQ8cEFM+U2zFc?=
 =?us-ascii?Q?NV2wmcNeSOFlam0h2qG7h9nDrAtpSuR0zKFVKmpWexg3vUBvWIeXIbGSV8lr?=
 =?us-ascii?Q?kyIXae0nNMvYoTQuuVfgY8XoAkFLbAPzED/I+K9Rt3ik8GZtG/fqBp1m1C28?=
 =?us-ascii?Q?8A3ACuHICQftEmWLuNIerjFnRaSm5t3aK3x2VECl6Tbs5IdHJy1+hcdshwtB?=
 =?us-ascii?Q?buUbMCa3sSizFuarC1+A3YVXgtXLtE0FpEgrUeTYoeRuqUpGmxCzhq6WXmIF?=
 =?us-ascii?Q?n5m5wosfA368jI0/KsVvliPC5BLDOUJeOzbIpzYSHmT0v+04/Bb9RXufiFBS?=
 =?us-ascii?Q?+JEUDDirfQnTE7RxMHF5ut50ofwX+Kt8EwxxLUlTiHSoCdmgDIy99l4JyuUJ?=
 =?us-ascii?Q?TlaDaSYZGfabdF+qRfwryIwM2soK0ZerURB33NhMqtG0GQXpg2JAQTfAO5ON?=
 =?us-ascii?Q?KwiM9aX45OdQf0ovO1H+EAFoM6Nd3XbckON1hQnDj3Cy1a2iSQz/nwaR6OdN?=
 =?us-ascii?Q?VJTIFUxP5A/KHYjyosl6hoh+SyGkq9xv4t17hWZjpLBl0yoL+YFqK+bm/VrI?=
 =?us-ascii?Q?zTJNoeWF82KdkpK4IMxztNeAeoxjN52BkmOtd5CpZo6RgcR3PO1sYl2va3ho?=
 =?us-ascii?Q?JmJcPag4av6gQOOxKvWS3b3dMMt20lI90qgq8xrs3EQz7PAhszyYJQfjqK2O?=
 =?us-ascii?Q?7wmo6aaPBY1a2TKz6ofkX/HGQCxzn+kOWDvbcV2G3x+JrezOa+8nHMSEhLoY?=
 =?us-ascii?Q?7ZjbHoqCdg98dGQV4TIy05E4W1Duv8S1eTgaH5CO3YGK65c+m5W7u1csE9co?=
 =?us-ascii?Q?kbt6Sk4P2pmTCE/sQwZHmM2A0xYKwYgnVU/SzyjZV1/vpJaXH9VSA29ypJ0T?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GubecxFPqWYrJbQiRyHzy5QM1sZhd14Y3CovLHY/KYL8ij6QOVmPmg9F82iNKMjYzLrQJZEWpMUVkbwB1O2MIZeKznIthTV2umCAMh1pcEjjQmqkrgcE1atJ3kn67FPD3tXWLfZQhtDVQqUnA8bw28eExDaOEzq/o9/p12SIKImJymaLldU9x1YZIeyonq068N/AO4wr4eozsOQJBmFC6xHpqaDApeL+Q40G0IL6abZDXXvf5q19W5/9ML1SqALlemvhlY4GX2+v9TewPCOgR7ffIoahishrgzAutXOcf9qw1HhcMh4h38ADgLzpqeBwJ7scN9Q+fJrTbhZgrKjRhA3M9D5nJCoWgEOCAeIgylYKiLx/clE7lm+Y3D+pkc2UvTN9aJIF43/iq55CJim4csEob1psgqHq+pLFfpx/Pvi9FdWwhAnLX63QcOcWRa1NASsW3klmKPjSVscKa1brgh96TjAWE08bc9NPTPxb/vouyJJvxXGh93jze5kRNOAracuHqYOkwRmnohJyJc/mtndwVVicVBbiANjOHy/D66iQdoEqYgvkzu8xLKRA1WRv0118fw27fYcQiITuPKD4+iAgUYjMRqy2xCxJa8esqiA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28610756-ebc6-4dda-10e4-08dcf4a07638
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:55:19.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT9L5/dvsQKpv1BhKg7iyd3BrhN9kzyCDj5Aqhj2nD4ZMRyn+CmrNUP+ohInpXNkRlp41GLiOMHaNCw8ka0K7kwRT7G3V/A4/tFPguxWhCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250020
X-Proofpoint-GUID: _KR_tec7a_U3ZaMpG-Ff6CeNQ8QqK-TX
X-Proofpoint-ORIG-GUID: _KR_tec7a_U3ZaMpG-Ff6CeNQ8QqK-TX

On Thu, Oct 24, 2024 at 12:37:57PM +0100, Nick Alcock wrote:
> All this does is stops \fP (which goes back to the previous font)
> from working.  (The manpage looks fine afterwards, both on
> the terminal and typeset.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 56 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index c299073239eb..355484bd0d34 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -64,88 +64,88 @@ The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \f
>  .LP
>  The following options are supported:
>  .TP
> -\fB\fB\-b\fR \fIbufsz\fR\fR
> +\fB\-b\fP \fIbufsz\fP
>  Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
>  .TP
> -\fB\fB\-c\fR \fIcmd\fR\fR
> +\fB\-c\fP \fIcmd\fP
>  Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
>  .TP
> -\fB\fB\-C\fR\fR
> +\fB\-C\fP
>  Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
>  .TP
> -\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
> +\fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
>  Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
>  .TP
> -\fB\fB\-e\fR\fR
> +\fB\-e\fP
>  Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
>  .TP
> -\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
> +\fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
>  Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
>  .TP
> -\fB\fB\-F\fR\fR
> +\fB\-F\fP
>  Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
>  .TP
> -\fB\fB\-G\fR\fR
> +\fB\-G\fP
>  Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
>  .TP
> -\fB\fB\-H\fR\fR
> +\fB\-H\fP
>  Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
>  .TP
> -\fB\fB\-h\fR\fR
> +\fB\-h\fP
>  Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
>  .TP
> -\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
> +\fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
>  Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
>  .TP
> -\fB\fB\-I\fR \fIpath\fR\fR
> +\fB\-I\fP \fIpath\fP
>  Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
>  .TP
> -\fB\fB\-L\fR \fIpath\fR\fR
> +\fB\-L\fP \fIpath\fP
>  Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
>  .TP
> -\fB\fB\-l\fR\fR
> +\fB\-l\fP
>  List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
>  .TP
> -\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
> +\fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
>  Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
>  .TP
> -\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
> +\fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
>  Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
>  .TP
> -\fB\fB\-o\fR \fIoutput\fR\fR
> +\fB\-o\fP \fIoutput\fP
>  Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
>  .TP
> -\fB\fB\-p\fR \fIpid\fR\fR
> +\fB\-p\fP \fIpid\fP
>  Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
>  .TP
> -\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
> +\fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
>  Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
>  .TP
> -\fB\fB\-q\fR\fR
> +\fB\-q\fP
>  Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
>  .TP
> -\fB\fB\-s\fR\fR
> +\fB\-s\fP
>  Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
>  .TP
> -\fB\fB\-S\fR\fR
> +\fB\-S\fP
>  Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
>  .TP
> -\fB\fB\-U\fR \fIname\fR\fR
> +\fB\-U\fP \fIname\fP
>  Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
>  .TP
> -\fB\fB\-v\fR\fR
> +\fB\-v\fP
>  Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
>  .TP
> -\fB\fB\-V\fR\fR
> +\fB\-V\fP
>  Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
>  .TP
> -\fB\fB\-w\fR\fR
> +\fB\-w\fP
>  Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
>  .TP
> -\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
> +\fB\-x\fP \fIarg\fP [\fI=val\fP]
>  Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
>  .TP
> -\fB\fB\-Z\fR\fR
> +\fB\-Z\fP
>  Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
>  .
>  .SH OPERANDS
> -- 
> 2.46.0.278.g36e3a12567
> 
