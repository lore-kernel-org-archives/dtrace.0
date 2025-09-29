Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D89228CB8
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759170131; cv=fail; b=Y49MYJY1aL5NqjzP7sSz0Sfp7X7IBwTDiuLdcxAn6KQJQ0DjzDFiMFCOCDa6nTFWqQWKLBssWM9/E5UFcjPR90Euygr4RgYCz2i2aXjU6JTVnowP4Cc/7CfXt0sMq+rMV2X0vD5NTYsF5V9IOYVtTHS8yHD2mDBxyYXxycAtFfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759170131; c=relaxed/simple;
	bh=pkLce3p7hMf7Q44BcjgAbhUFXMhci6RnfSaYbUOSAgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AdVW1gB/WD761f0Jn2qVP+PXtAwizjoqDIpCVkO6uhAvReQ8ttf+t5B/AfN6KXj/ttvyjvfEXl0G8n+WX6kbM2rleorkTkmNQlZEE58VsGN9GyJke33nj44sCTEG1YKFOetIWpTzi2bVNyfnkpE4GE10SoNZCvoOFcV575qW4pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iU1ycrGJ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SSjG5gnx reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iU1ycrGJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SSjG5gnx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI4Y0N006163
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 18:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=OCPWWa170ImLS8zQ+ec2+H6C/pKIiG3FjH+cEW3vEnk=; b=
	iU1ycrGJpSawUEBJ2LZawlgSP9MyFh+GqBWm1JDEGBcfdxDQmo9n7m5iu64L/Jqx
	fvwFOD9h5+8KcWkhIUmHPV4aU1n8cS1IO44X17DM5RRVvFih6H2u6igUW/3mC2Lb
	WqthAm5UjA+AypasxdfC9Jkg61DRCmwDw6LBQq5IjjX4SAOrg+69L8ggr8LULZwM
	DdTuqzaWwAF7sSO8D9Z9zWU7uS6arc2haHaBZt8RmFpRTIm7hOrowAvk1+R49Jyn
	XkD4etNrlzKZXhH61W1kBQx603IQqZ01uwRqfsyXThdoL38ytZp8YWHCoC3Cmibj
	Hxc1mVbThZjOhXGhHnCnzQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fy2p814m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 18:22:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI24UA027167
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 18:22:07 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c6tfj2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 18:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sddoFk+Z9XADHwmUvJRHjiLQeBLT1hG2Js8VXKEIYfcyLNgLQepPICLMqd+kfAiecXQbji0TLbBxMwGTVhChPUvjSLbSGD3ZPM6i17in3ygSxSr7VG3p1QRgtj+2TCCLvexxqe3PxrwCMo0W+TNeCsFKhiJf4BCgi/GqGi3AUPCq9UtzRVA86ow2t736hYHfaXo73Enuh/hOlp6DLxmmloDxHY5cqoIh8ECBFqZ75UAP7XL9KX0fBjW956VBf+3fnk82fREtq1Mv1WmxxQoh4kTPl5ap7It9AvbO60q5YVP9mcYaIK8TbujHVNe1v3ALbm66NlC4+429LWJfyWokBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtbIwUGQuxUfH8HvDpL0R7aibt/rSoGfaiXPNYzV9nA=;
 b=UZV+fLZVoAPghMmwSUv0bAENxT1050R0w03YCLqKqF1B2Zj/JSeFfNcyaDKtdhzbEL22fAx+7quiwYIxGONQaI/ahm2HGQ1eGLe0NjaSzyclirN33aZ7N6BbfTuOQJlSJkpHWhEotlqeyGGrrCYhEn5crEcD2dA25s6r2byzm7PvJVdgVxg2hg88oVnOO+pY2ERlGvfdcIDf4NYOcuY5gSkBfHCG5DsgupwPibtQkElrh/S70r6jukdPLqiCNfvuBdSItoyYwrat6ROelm7qn0p8ewblHHOcB81mX0T3oueITyCImFdMbHjii+UyRh3x3h6TGfHUL3taXAIfLTYlCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtbIwUGQuxUfH8HvDpL0R7aibt/rSoGfaiXPNYzV9nA=;
 b=SSjG5gnxVYCTRPWTlsFX34BTPzrJj3twt23+yZ6/gYlqqc1Hudf7P/g+4/9mVAHiF6IN/BnAAuwJDC4sPAw/PK6Gehdt1nSlh2chc2ggYPrO8VmDloEb9lz9GdG+8ria0MscYrdqEndc//e9Mu4pSJEKjc9r93Yyq63xnnCO5uE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN4PR10MB5653.namprd10.prod.outlook.com (2603:10b6:806:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 18:22:04 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:22:04 +0000
Date: Mon, 29 Sep 2025 14:22:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] cg: transition [u]stack() from action to subroutine
Message-ID: <aNrOSNsN3AZEvqyh@oracle.com>
References: <SJ0PR10MB567238538078DC5066122BECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <92809454-e92e-73c2-84ae-8d63e792c8a3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92809454-e92e-73c2-84ae-8d63e792c8a3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN4PR10MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 65992978-4860-4c2d-b35c-08ddff8516f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jNwolcW6ok2fKj2XMH4xfE6isQ59i4FenpZOMyOmBmptwJ7zvwgU+T0y1l?=
 =?iso-8859-1?Q?OIqZT/cCuTkMF7zQ29EsjyeW61CCzxwFZHmM98WvKSv9OKEOj+8VJXQX62?=
 =?iso-8859-1?Q?/UNx9hLNBFuIKVYTrFDWkEluF3J0l2E1rDQx+/euMpkyVPqqFG/OY4f21p?=
 =?iso-8859-1?Q?2pvNusImwxqv131KgipOYVG67242urGhC1OH/lNfdmugDKniD3jl6P5kPk?=
 =?iso-8859-1?Q?KDAGiZqEnMJEOa0OVKW6xS38gh6QLGoe22PFmWo38y5NDPv95rjFIVC29o?=
 =?iso-8859-1?Q?VZz6bkbHZHTe0vIwMKk2H+lMfsoP618nchQHBDbSNtVlyEejk5UbRFY/Is?=
 =?iso-8859-1?Q?5ooLkOBJuTg+T1a9fnc1FMzhQ3iqXeYxyjZKPtlpiyRu/ebrovHIbU/LG/?=
 =?iso-8859-1?Q?Cz58442MnK/k5XIsFVI543hwVRbwYbV0urKi759zaZFJLdJGieFGi0ve2q?=
 =?iso-8859-1?Q?W+8+g/EzaiFyDvx7nLjDBn8fZD4FDR4GecchBoa+lOvugmmiyEhkDHIL/1?=
 =?iso-8859-1?Q?4Usvp98rUsaS+c5n1xw1yLiWFoDf/CnlKTo7fLJPk0VBZwuqbiYIvIWJx4?=
 =?iso-8859-1?Q?Kze9hexsytJLwOPhSKup3kOi7eOJj/nPpshw7PR343R51JCUEYWs7ybM2N?=
 =?iso-8859-1?Q?Mk3BzO+pLwOnh2e/PdcS7AKTwxnKCKAuT3VAZpTPVUOuC4PaKHeW4JJecu?=
 =?iso-8859-1?Q?+Q8O3lW7tkUwQF7U+vgoLmyPTR5Qx1qgNw6MYIJglZvf2ijHNVAKtc8l1G?=
 =?iso-8859-1?Q?iN+Sf/zxHoD3VppNw9GgZXI/RJK6UonaDmL+9VtjvyW2TR5hWRF8qBOzQA?=
 =?iso-8859-1?Q?QSvdaD5ZCsYM7Bvp7GHb/yHZzqqsb+njU0rT0IK8TwXtOIPYMyqBknpupa?=
 =?iso-8859-1?Q?yBAQrmX+BqC2Wq2+W71JDygf/n0o9ZWhqHwoDJmaAaOl48Katd6Fv/U51k?=
 =?iso-8859-1?Q?p0v2J6ZkjEWvUUlCBqR9tFWaGXTgEi3aqY8M4mbU59wM00MriTyQUTYGiO?=
 =?iso-8859-1?Q?mHlAe/qHIylR/2TpMkLiVwAHaLtYefcF3pKp6q45Et5HwiKyZ8U5td+xEQ?=
 =?iso-8859-1?Q?LPQ3VpRD8iZa8p/GyLksvX+ttHlrZHDQpIiC1u6VAbsfiCEgRf91kSpWtT?=
 =?iso-8859-1?Q?GD75vzUkifzxby95i/0A9/woWTDBD3ka6gmvGaeJMHw+MBQu50hBDHX3xP?=
 =?iso-8859-1?Q?87r08Bg/Qywn4BO2qh7joFUb77S6IIVFthsumyhNcBxQ3MPWdrIOpyLThJ?=
 =?iso-8859-1?Q?BUvk4Q5E916IDQ7PpSV+aHh5FCD/0iWvQoc0ARISOZImMFIQfjURLXyS4u?=
 =?iso-8859-1?Q?lgknTrr5xXAkjyob4EAL/+GdW2KDx43COZGRe70yj6L5C3LKU7lU0UKuf9?=
 =?iso-8859-1?Q?zn4koSoJPMJ+YqBCRSa8gsitNHezBi/uj2G0DjbJ7R66EQSEH5xnC21f4I?=
 =?iso-8859-1?Q?K4GoGguOjjYiADPz3yJHaIIPbS1A3Pb5qc7L8KRAegnod2q2YdXgi2Afnx?=
 =?iso-8859-1?Q?haiwU7YWygmBnmyvBjhRUU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9Gj3D3Cw0/e7TG/iC2p5EiT5bhrKz0l7ncDx7bXcQol5q6POhvNI5TXbLf?=
 =?iso-8859-1?Q?uJ/i8/oMqWfla/NG96QydQos2tOSJoRMTO5ufK+547MnU0cNm9bHQngQ5r?=
 =?iso-8859-1?Q?8orF0cFLvwMQsCXytzMJIKTp21wnW68T461RT23SGLg0AXiQF8Ruxlb4lU?=
 =?iso-8859-1?Q?AcSVu8A5UIlpdD+Bl+1ZdRthMvYyrB4LWrPHoMWsvA/D9wJRs6Xslaw+Td?=
 =?iso-8859-1?Q?GxRBGEvZ3351dpD7slOzSaLuk7CIndVjkp0gJ1Miz2kMA7V3Ipl4JWpypY?=
 =?iso-8859-1?Q?2m4s+gsdZqbGzEXoYJdj9fTepsn5qZBx+05oBpgM/gQtDkEHoHdwgo1+0Y?=
 =?iso-8859-1?Q?BB2EQ3qhz0EGUUPa48Yp75Lnm2nh1kze43bt+vKFTfLjpfakRSHlmvM6PT?=
 =?iso-8859-1?Q?O1oLzNvHLsrXIw96PZAf8HW4wKJg39rssW+jwNFy6h2E0OZ6YvAtFYTu9A?=
 =?iso-8859-1?Q?ufAijotxdY0VZVp7Nc/+eKGIH0M3Qnjs+lEE0Mtj+ypK7zbsUhq6vrqhVd?=
 =?iso-8859-1?Q?bcDuAbnsLO+/OYXVcxbMPpgPU3pyzF9v3yWwk4g5qbi0QFdD4ya6OslwuD?=
 =?iso-8859-1?Q?60VlsRiQoQOWXaaaXMo3AdJYHL2Dveuwo4o0OpOVgQmdiAQxUfx9AJhyEF?=
 =?iso-8859-1?Q?OTfo+mME8bbzUioyM7scU92eVHWw3YbDAKrBMZlYLvImWq8+SJYfWxhoFm?=
 =?iso-8859-1?Q?YkwnNc6yIQtuXcZKEKTzSJiUK4Rr1W9G6GpfBUkz5dRWm6GXKvsCIuY/TM?=
 =?iso-8859-1?Q?XOYQkk72UAR/4dE2Veqn8NZw7RJmVaQ09TbIBAwRzrpuexmTLrES6BXkxt?=
 =?iso-8859-1?Q?iHiodSVbeJqhP071gde+T+bYiwCmgsItRSD2s1mHqDuDpQjVNfea0Ng8o6?=
 =?iso-8859-1?Q?Lb4xpCeGevolDcKYuDG8wBqh+cqFXrmp26Nj+18sZfiV5LHGSsmckOZhCa?=
 =?iso-8859-1?Q?arJeRZOxHOvGxLy5ShKJc/mGhoBNLVi7GfsNcdn2Nz/MBIHH482kK9HNkL?=
 =?iso-8859-1?Q?49iHwSXYAs+EUKzyInXaon2AK1B5EddCLu3uXwsGQoGuSx1sECUb9Qtf2N?=
 =?iso-8859-1?Q?SOZol8X/xScaULFUsuoKMIQJimsmWR8ORvJfC6q5uWyoBYJOTB85rizuqH?=
 =?iso-8859-1?Q?suj2fP+oz2XXlmBcw1uUgKKcujFeETT1lsfo90jA6pl1wbPrSrgjvjBIgY?=
 =?iso-8859-1?Q?LZkETLhTc5fXhbuCsF/cyLopigUkAlYbGLeV5USy8IbOkkRWftGG6Pl+59?=
 =?iso-8859-1?Q?BHE3+/99wtxV63eBMx0eXMAkayeOUtq2QPV+GfYFE4cizHGiO1RVHE9kG9?=
 =?iso-8859-1?Q?YnBHpkI3ImxgWjd1DcDPge6xnQnjJNVAL7foY/WfQ91lWi/Ta7sB8eQy7S?=
 =?iso-8859-1?Q?7KDti1l8SFG8aJj363/HsaXvhvz6pQwLwtgWKNneA9YI/1nDjlRPD/IDX7?=
 =?iso-8859-1?Q?Dv/t3pKurtgq3Bip9RG5hho6bveo143uomRQlETrlOL19efz/qbADWmMd9?=
 =?iso-8859-1?Q?iJ+1nxA3i8OaKq40pInzI3/UJO5/2mf0xKXZzjmtkxZ1RcA19yqitbBAzm?=
 =?iso-8859-1?Q?EzFzPr0lVmoLQL2gFAtB7cYVyvlID+MmbxCSbkIxj2gxJ/K6Pu38ybtyUT?=
 =?iso-8859-1?Q?skpVvImgITI1J42phwbcB/ojA3Pc9hevTRAhGNhH2jVw7LaPxz7DnIQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X1xeuYDp/ANTNw7WhN75w2K1/5qvefQytvDNgabUIopvfoy1xBm7cnnTP1i0mvsdK0SL6CHjr0V5srCDeI6GinkO8oyromdRh15XNopWlxgaNtzfRQQt63njkJfDrhfLJcNRzlh/o2KefW4avKyV1+5fEUql/3qYTHYOeok14eJo3JL30KwEZ/kTqto3pAvHhxkKtw9tPP4kPVNQERlf4E6b+xqusCQeMZ9fjbnBVBzgSHCCvQ7dRe+kX92Ssx1IpFebBHrxlT2MlcQew1HvhfgB9zAOQTAQS/RicHENXtaOeXuKoVmr7QwQKc0TXiW66ZQB6qC/V6OCi+ox4TqOkuvxVAslZY12dQZlsixKNjw5Pv/ecB80/931UCuNTkC8jQG7JO8dIOffSDbMsVxD1JSyC38fUDnxUr19o0FPdmo7AyoQT74Bg3IOaApCZvwh9SSvMOsCUX7555jqvI7Vt3XW0HEU7yM2Zz9WCQ7r8rQvMzwKRcvp4DqVpC7aR42sVFmB40k1khZO4skscpy/f95eUkrvfvrbFyd3uqMwLhzLh3Qwr+hpp/EIVT3TEYozw8Os/00BrnVfdbv8r+LncDjCRPrKmdNcIbJMlWNWLBM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65992978-4860-4c2d-b35c-08ddff8516f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 18:22:04.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZx9TDt5VBnXF9cUr/EnnNLqtnPbhWgDm/SU1V24Yy1eBsIjxjPOfRSa7+mvUZYZIClUvDfnks3Nf10bK5T7uVpa2wrOcIJBzfOdCJX2JfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5653
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290170
X-Proofpoint-GUID: 8MH2MeM1bpkK7SiFdbYtSdu4BZ4S140E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE2OCBTYWx0ZWRfXxZia/aaGp4kR
 RvMBg7wkLm6v1GBk/4c0SUyLRUcCyLy+1r37hPmNZZGcjAR4BL5fT6iqkkdSSzVrMe5uFewOZm9
 gUarqFWC43grATocVD7DTf0HHaB9TuEWQUqVWeE0uj1Wb1PIEQg7ztyp1a5wQPFNMiZJagHcVym
 wom8kTNgE8o6I3YvUOZO11/zCUlpdRZu9vHWVnvKOl5L/LTbxWy2LTOBz/0N+xOhehk/b4uHPxS
 uKdCxJFPeZcESiO/ka6Nku53GE1DyAIUNaw4jK3n3RQw4XP4OQkrSyYAabcjS3opDKGnIBauagw
 h0tYTYA4vs3iE+1Lof01TChWN7TCscYUSxiA5mcbkBwF2k2x2EUZ4XBpecnc/lerQpeRy6bFSBt
 mMgB3WcvGMOJpe8Zx8CQFCfGif9oXA==
X-Authority-Analysis: v=2.4 cv=Z+Ph3XRA c=1 sm=1 tr=0 ts=68dace50 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=Ct5_UCQuFelvoDncnF0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: 8MH2MeM1bpkK7SiFdbYtSdu4BZ4S140E

On Mon, Sep 29, 2025 at 12:22:16AM -0400, Eugene Loh wrote:
> I don't follow all the details, but I guess this looks fine to me.  I did
> have a few minor syntactical comments.
> 
> It seems that dt_cg_subr_stack() and dt_cg_subr_ustack() are virtually
> identical.  Might one combine the two functions into a
> dt_cg_subr_stack_common() (or whatever name seems suitable) and do this:
> 
> static void
> dt_cg_subr_stack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> {
>         dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_STACK);
> }
> 
> static void
> dt_cg_subr_ustack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> {
>         dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_USTACK);
> }
> 
> The win is less the reduction in lines of code and more in the clarity of
> what is being done.

Sure.

> Also, a few others sprinkled below...
> 
> On 9/23/25 12:01, Kris Van Hees wrote:
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > @@ -3987,50 +3996,63 @@ empty_args:
> >   		uint_t			nextoff;
> >   		int			is_symmod = 0;
> > -		if (dnp->dn_kind == DT_NODE_FUNC &&
> > -		    dnp->dn_ident != NULL)
> > -			switch (dnp->dn_ident->di_id) {
> > -			case DT_ACT_STACK:
> > -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_STACK);
> > -				continue;
> > -			case DT_ACT_USTACK:
> > -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_USTACK);
> > -				continue;
> > -			case DT_ACT_UADDR:
> > -			case DT_ACT_USYM:
> > -			case DT_ACT_UMOD:
> > -				nextoff = (tuplesize + (8 - 1)) & ~(8 - 1);
> > -				if (tuplesize < nextoff)
> > -					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> > -
> > -				/* Preface the value with the user process pid. */
> > -				if (dt_regset_xalloc_args(drp) == -1)
> > -					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> > -				dt_regset_xalloc(drp, BPF_REG_0);
> > -				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> > -				dt_regset_free_args(drp);
> > -				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> > -				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> > -				dt_regset_free(drp, BPF_REG_0);
> > -
> > -				/* Then store the value. */
> > -				dt_regset_xalloc(drp, BPF_REG_0);
> > -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> > -				emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
> > -				dt_regset_free(drp, BPF_REG_0);
> > -
> > -				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
> > -				tuplesize = nextoff + 16;
> > -
> > -				continue;
> > -			case DT_ACT_SYM:
> > -			case DT_ACT_MOD:
> > -				is_symmod = 1;
> > -				size = 8;
> > -				dt_regset_xalloc(drp, BPF_REG_0);
> > -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> > -				break;
> > +		if (dnp->dn_kind == DT_NODE_FUNC) {
> > +			dt_ident_t	*fidp = dnp->dn_ident;
> > +
> > +			if (fidp->di_kind == DT_IDENT_FUNC) {
> > +				switch (fidp->di_id) {
> > +				case DIF_SUBR_STACK:
> > +					tuplesize = dt_cg_act_stack_sub(
> > +							yypcb, dnp, treg,
> > +							tuplesize,
> > +							DTRACEACT_STACK);
> > +					continue;
> > +				case DIF_SUBR_USTACK:
> > +					tuplesize = dt_cg_act_stack_sub(
> > +							yypcb, dnp, treg,
> > +							tuplesize,
> > +							DTRACEACT_USTACK);
> > +					continue;
> > +				}
> > +			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
> > +				switch (dnp->dn_ident->di_id) {
> 
> s/dnp->dn_ident/fidp/

Thanks.

> > +				case DT_ACT_UADDR:
> > +				case DT_ACT_USYM:
> > +				case DT_ACT_UMOD:
> > +					nextoff = ALIGN(tuplesize, 8);
> > +					if (tuplesize < nextoff)
> > +						emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> > +
> > +					/* Preface the value with the user process pid. */
> > +					if (dt_regset_xalloc_args(drp) == -1)
> > +						longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> > +					dt_regset_xalloc(drp, BPF_REG_0);
> > +					emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> > +					dt_regset_free_args(drp);
> > +					emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> > +					emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> > +					dt_regset_free(drp, BPF_REG_0);
> > +
> > +					/* Then store the value. */
> > +					dt_regset_xalloc(drp, BPF_REG_0);
> > +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> > +					emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
> > +					dt_regset_free(drp, BPF_REG_0);
> > +
> > +					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
> > +					tuplesize = nextoff + 16;
> > +
> > +					continue;
> > +				case DT_ACT_SYM:
> > +				case DT_ACT_MOD:
> > +					is_symmod = 1;
> > +					size = 8;
> > +					dt_regset_xalloc(drp, BPF_REG_0);
> > +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> > +					break;
> > +				}
> >   			}
> > +		}
> >   		if (!is_symmod) {
> >   			dt_node_diftype(dtp, dnp, &t);
> > @@ -6968,6 +7070,7 @@ dt_cg_call_subr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	assert(idp->di_id <= DIF_SUBR_MAX);
> >   	fun = _dt_cg_subr[idp->di_id];
> > +assert(fun != NULL);
> 
> Weird indentation?

I think I added that as debugging.  Will remove.

> >   	if (fun == NULL)
> >   		dnerror(dnp, D_FUNC_UNDEF, "unimplemented subroutine: %s\n",
> >   			idp->di_name);
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index 509f263d..9dd8956d 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
> >   { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
> >   	&dt_idops_type, "uint_t" },
> >   { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
> 
> Add DT_IDFLG_ALLOCA?  (Of course, it doesn't matter yet.)

Ah no, some other changes will make that not even needed because I will be
using the static area for storing stacks rather than allocating a new one for
each invocation.

> > -	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
> > +	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
> >   { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
> >   	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
> >   { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
