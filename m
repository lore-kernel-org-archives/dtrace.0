Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003D1DEFF9
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730133516; cv=fail; b=CYE/xO9/LCvxMM2ZdJKxvwj2L3UiMZwnkPtpl71uUcECP1kSe/pBeUC4+lIv6qXbJBx3csRk9KZMhFAWHcwZAblmmDJLcC16+8VPu7FXOf/hj3j9FFppBnXnMqDehlyZBpKiXS0fHZldwTGohwGjBR2cS3WKgy6+5KjCHDsfBnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730133516; c=relaxed/simple;
	bh=Y2QjEfHd5f1/Puscv8qJ9mQzIzwZedhlw7pfI4Uf+RI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QWbkUelLdpOkK3CmziGox8aqojMgQY5h0p9gogDX7Yzu+d2XeZs3FoBpCriXaV0z/8udsYEsIZ7TwUyGByvJmmRBMJx0eUSdaOTMGejb5dxwugF3ZU7wcn3dPxVeKzvd3/V5DT1NNlfH6zTEX2wOUzMjOM9oelOf1Gc2AduLCTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GkqymxMH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nj65EC5e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GkqymxMH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nj65EC5e"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEte1D020913;
	Mon, 28 Oct 2024 16:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=7MGIMvg0eXOfyZWZ90
	DDoFeQf09Q6hJERnbpMCzlNiI=; b=GkqymxMHSiDbESMxfPWlzvNcj/MxUWR5LJ
	U6ITlFoslaOrjH0Sir+dtLECvNoSro6Mn+jGm41i5URGPFa/pdDVPhMwHNgKIwOf
	ta++7rM5AZiCPrtT8hfRHaN55RUwRCS+Fk3TT+c0858uhUwBO1tyJ07eu+Ttzv3n
	kcIUoU2pJXZYkwiBtOIBWRqXWipOClKo4Jm1AYYoDx36KaPtOT4VRCD74T6zJqxs
	JKLa4UWZs++BYM/ZuVACFUsRtqFV1kcP1xoPQ4wovo3EaQvVqdx3x2dYtCE7+SPK
	vwGeDv81vanTeJisO2MMbqoyNJ3k6275ke+SuXDyg9C4DntT0u8w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys3bmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:38:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SFqsBh004233;
	Mon, 28 Oct 2024 16:38:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2st75f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlRjQEBcANwUJPPSOIdSuXY/LErJI8p17gB9UjzQeAUfKChwRa5070qK5jxCvAXgzSW/KV4RaKIK3gRyLNKAxK2ZONyd4kIAY5W4+7B2YiZsUsPaXcIAyQtOVgdydMTTtVTflJdiMrMgy6X+umsK3l/XcTzZhj1mfNxHVBvY9CKwfL6jmigWgKpIoGX8YxHT6UoIWuVrNONFFNnAVJnumPj/ld0UuGMP7XTW7O47NuhSxtgOWb6KrvUuk4BSc8iGynliX8WlgYq7sGPNDFSI82hwfMWsXvRZgk4ChaBRm7wSeFg1IetPIFPvt2Cs6OGFhenTVMgoIoDiwEskaQdJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MGIMvg0eXOfyZWZ90DDoFeQf09Q6hJERnbpMCzlNiI=;
 b=rqL9R0H/qxVeQKyo4uerlqCSTHy6CsC+Llx7sfGTiv+uQEVyo/A6JMN5WJUtITI7ce0RINzC+xRxyPvNa7wda6NFmHl+Br68glg0MSAcQ72qxTEB25W/piZ2d+lnCrZHtnXJlmUroPoKb5jw++Wk/PrAVeIGBR/R+3UYtxhCvnkvCO48bhnoTE8JJjhC2XYzFUxf+83LjAd7WTsbxqI7IxjhJogQGOfh1cux9nUOdC2tBNOPT/G3iXkErpJ3REs1VuXyCrPrA3mpIR39hHjji1OwWWBv3h2Q7gRIcAiu+LamVkumn+6Sh9ZbAwNY9iZpJhpF2o4Pzq5snfuWjwCNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MGIMvg0eXOfyZWZ90DDoFeQf09Q6hJERnbpMCzlNiI=;
 b=Nj65EC5er2yWj35rIXnRB8K+ZHq+PyJfRHuNec8jPl/o1DHdWPk+BvV/0fLhUZRFjJL5KSBsXaSyAn3a7H6j9coF2LMd5PpJ/YupFWyYCek36OE0tH6y6uSVIogKxlnuVAQDSuslGH+8FwBX9/JJWMPOi6rouwVs5CMCEHDAYy0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6448.namprd10.prod.outlook.com (2603:10b6:806:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:38:23 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 16:38:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 03/14] configure, build: make valgrind optional
References: <20241024113758.182050-1-nick.alcock@oracle.com>
	<20241024113758.182050-4-nick.alcock@oracle.com>
	<ZxsCzzF7JV2iYCJE@kvh-deb-bpf.us.oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Mon, 28 Oct 2024 16:38:20 +0000
In-Reply-To: <ZxsCzzF7JV2iYCJE@kvh-deb-bpf.us.oracle.com> (Kris Van Hees's
	message of "Thu, 24 Oct 2024 22:30:39 -0400")
Message-ID: <87ttcwqj2b.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d35b11-f0f4-4b13-4994-08dcf76ef02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OEsqWOBPwGVgOGdfKUWBvWbdR9E9PBv9ll/1ROFxdPVMsr56sKSFXOicPMqW?=
 =?us-ascii?Q?pTEIUSHPadlbcDwgCE48yQA8DkNZLzrknAwvQ/U6r55OsKrBBJt9ERxDbG4H?=
 =?us-ascii?Q?b62/orzNw+4Ra541h+O8tMEXlJ2zJqQEt4ymeTbSuWR3Wm3JCLGODyZK9vlC?=
 =?us-ascii?Q?lkVybE/tGQ1ZLCC2viCxYArJRHkyVQMEBcmKhfWAJbOG2XbHhRIJrHkYT5B6?=
 =?us-ascii?Q?ZdNAKa5Dyv3QDmGLwQbtBHYkEsfNHIs+/lZl40ZDagDdLZw3iN4MvCJj1c6M?=
 =?us-ascii?Q?nZ/80VGNf5HNkEtkN9VBQtTIG7GvWgTw6kkdxMXz9cwGItq7KVqblvF6U5Sd?=
 =?us-ascii?Q?/WDKFzv2tGKfjPjo1f9eOu/J674ZrN7fXHRoqAJHG7oTjvCK+9dSMV2u4U0w?=
 =?us-ascii?Q?HIyB+LkH9+2pmeOUacYGzXWfu69FKzohQqnY0VosWRc//Y5mn7GBpWc8DkvB?=
 =?us-ascii?Q?Ih72i3uVw6kPGAdgldq+jXLKbnmSePc/MtJF7szrhNo0FO2VKL3kcnjOnpw1?=
 =?us-ascii?Q?lkzSlHJlJhptA1QJLWZZK9m3O51GiRcQM41ja6179xkOwegDEIKZA1CC6ip1?=
 =?us-ascii?Q?1lt/lE1lvXjSPQh0z5MJ7Fb7Q8vnHwdkSYxRXq9ZKf6n1TMi/1jwBAiK6ZH/?=
 =?us-ascii?Q?adpvvHiCh5c5Z5k8IWDufdegVsn9GipZjYK4Vi+vBFZVazNiupXmshrsTBJ2?=
 =?us-ascii?Q?VqVSgZ+oMupBMiipfC3tBzEw3jukq7kNufNN8iyAX8wHPYTkX4E5mqWqqPZ2?=
 =?us-ascii?Q?NF4XzG3gopvdqZ3j7c9GM84kXvKDg21rq+wCF0fiG6icctK2+zVcS69WraVX?=
 =?us-ascii?Q?EMjCU4VQBzBCMTKYUEHqVssadG+azXj4lbehRSmenxFscWkYp/CJNpxHEdiC?=
 =?us-ascii?Q?DZl32Qp8AGU9wvoRNquyMWjxPg2o37aNb0lVuaL8ikr0CprUN6mPeI/BNrSS?=
 =?us-ascii?Q?UoPLf9FLVB9SsNUaHk1t53leCoX4SCBMSUddAVlNFC6PlLqy4oTOy7TkrwH4?=
 =?us-ascii?Q?XZslIU6ZgRcc4zviYrX4+GRYBmcEYSJneiGyOsnjEOsvEJzf7UUQk7pTo0Ru?=
 =?us-ascii?Q?9AJVo2drhFj62RnaX9wZPfM5nNX04vaRUhHM5AIcu8ZxpBwvDIwz9te+q5dT?=
 =?us-ascii?Q?diIKS7XdvC2U1kvt/mcBHct7nT8HdaqsBpFwqRtQWsCMPLEOGwPcHthshSER?=
 =?us-ascii?Q?eKRb5uB8ps+mVDxuZKotx3rmSjQcral113BZNE+R/kFm8LKxaz55UpaDfQuy?=
 =?us-ascii?Q?WAbCk4de6P6GgpZUa7j/T06k4ObAbaBqCxeLeRuVfHh6g3gfH9T8PQuldaNe?=
 =?us-ascii?Q?cuo4ilXyJqDR1aPoL65EsInR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvNBA/kPmVw5TGcLSy87YMS28CoBvCfswEuGX2LgtyCAHYaFJTpEs/jgncoR?=
 =?us-ascii?Q?8hkPSK8YcCyGAIS+CtGed+YHqU8BMgs6hX0OOSuBsxn/XlKK8y9nQIBTMFLE?=
 =?us-ascii?Q?WFoz7VF65C9+8g7nNkKcGFef5SvRSBEOC96xtZGL5BnSJNn4ltwECA0F3/5h?=
 =?us-ascii?Q?GsAYtZSFxtqUGBbrpPxG+nnFATwxgIgyIMYkvxOpzyWaXw2w2/hHNvFPjoWS?=
 =?us-ascii?Q?PapzB4NAlK0ZNBGYZQNeZ0mdhynSbjfs3vB8YLRznzmYxaHszEjltSW943fY?=
 =?us-ascii?Q?eg5DRCTlC2GsQepxq/x5wcN1W/+jiyXmbD0TsEPQIHnbuPHxq0oudE4Cinqf?=
 =?us-ascii?Q?lwLRIDb3Mcsft8dQ0Q+24Tt4TK2a/mFd/uLqu2DaJOwU+lFOOnDR1g8fw4vM?=
 =?us-ascii?Q?S39xYL77A2DQiPKaN/H9pBM3acXn21Zi4nTU5EmoX2swwIABBq+5OjkgYCp7?=
 =?us-ascii?Q?R0bdhLuUdzwDadRWU+Mjg/0Ip9pBCfR1HSqyYAeHHfUAxljEvGpXdHQ7PJ9q?=
 =?us-ascii?Q?y8JdQK94CoyhAfYrNe5NXTY+eqZs8mAlCHTIyRoxP234Bf6Ax8uCwXVeBu3V?=
 =?us-ascii?Q?BEoHIDvhJhGJoCeH9t2kC6+Nms/ivDgx5U57ZRe0exMeGipSNJwIwGYulA41?=
 =?us-ascii?Q?lLaIybccc9r0jHO69buDzQ+K1Lr5aPr+LuZJvqkAtpStaGFsG4EBpMttI95X?=
 =?us-ascii?Q?RLy0f7S0kyfka+Mpc6iY7SMfOS+dviZC9b7RnkmNSsCUd0KWk/Kuy2Bwf+2B?=
 =?us-ascii?Q?hIsNHXpS9dJeHzmKiVS1ztBaQZI+Ww3kHjW4ASCTyBLr/1smu/jLZiwwqifM?=
 =?us-ascii?Q?TsTNmaC1GtY7zGrPuqBJK/hZwMPBKBzCZcliPk6icb+IpjCTIJ4HeXoLuCKP?=
 =?us-ascii?Q?8eqTwn35g5ZYrxMwBS9/MVi4CVmTxhsXoahZQB/ttXdTbVpuEvuWM6SiBmfp?=
 =?us-ascii?Q?0A7PbMMc1hyNzu5OOytPbNxOZhL90UAwVKgbcln78+piRL9buX4FTcMwKIEr?=
 =?us-ascii?Q?JpfK1AjJ90fURxbZZ+6ShAHJn5w5y0R8WSgNOiYyFn/7YrnLX3NMJRcDP7/J?=
 =?us-ascii?Q?z8vuuz3rBFtD7sOaNNqu+urB2IsKLXeSosjq8HzRDcG1KC1i2Q5Pnh/SJOQ6?=
 =?us-ascii?Q?HyOg/DGTF/0GLKzl3rmReDVO3Q3g3el8dpzOBadfKtqXPMI8mUTA78o7qkrv?=
 =?us-ascii?Q?EDoEF1bYkze5m3R9YmkWjTpdW0x9rEWvN8KRxYDJ/IAbcxNlbST+oVnlmXxB?=
 =?us-ascii?Q?lzmE4cxe2eFAJDpmQOZ8xEm/N1cTQHPTGCV1yjtb1h1iQTeb9JJHc3g3+LKl?=
 =?us-ascii?Q?y5k5OZKoZY9Z60W7+IpcV5wEzK+GtuJ1GIGS+124xvmVzd69CQbZruyysVV7?=
 =?us-ascii?Q?Unn2jFSVgKhxpOJjseOeTaPtuwl+kmUoe5D03+C7rvs5wU1Oagh0Bmk//Ty/?=
 =?us-ascii?Q?ybNF8GUtA+78PBFC2t5j9PzJf9f/5IkNTRUPU5G9Kpd0khTFpZz6535AZay7?=
 =?us-ascii?Q?xWnU9d0uP9D2MNbKaM34G4eyBn3Q4jZt5AYVUrV5b/9lalZp5SpVPMiqppMH?=
 =?us-ascii?Q?t5Jrj3JsVrjCQP82usdChTNrwjhS9iYuVyLjhJ/+oxsTPY5w9sIm4nELnGUk?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GUdDmV6rraHiPDLnUTGMOwM83Ii0jJZOQXmuKvfOhmiae26BKP6yj2Ctqm16S5qMlWNRhUJt8v5fDeU5bIcOMv5TYRxKJVF/CJI55rzigjf/uNmsAAMMjKJ7C2pL2mCLWsNbpxxYZek4vmqIgP8T4GUGKLFTDFaMiHsRZ7MRP8+8UqB7czuNRf/zPGXvsaixog2YASzPP702yR6e/iRodaAu3B+4d0oqWFcM4NGbLGWzEU3VyPnymXx533g+MGEZDS4gnJrpgrbdQTECvTf2+1HHe2FksRUVfo6SrN1SEkbcYKnfsA84cWb755Qe0og9KwdJpk96pDIh2lKNlpNuSeVu4mQyYNDszAYkQKSHrT1NQWmD6b3GYby+EbQtA4j9xNvbpYY96p5FnFmaRsALiPivJn3j1X0MravVwbFIv8VKjK5wDW0rCUxlQv8VD7HDXdEJqBrnk1YpePWN6BMg/cr0iJhabZjLGmHrzR+lgVxAQaTLj9g7l4xncO9V61Zb1RvsNlog6Zq3YGDriFlV5hvyowpfz64XpN4GHOC4tzTsrWa0SX2dnHrLN3Se2uTdB+6fD9neumACLXNr03meNW+JcFX/r/u/anb07ZS/btc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d35b11-f0f4-4b13-4994-08dcf76ef02f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:38:23.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFgHa2ocjUpwjEWyXVPgVKy+wIqu7BJS6/rEMtxPDfY0+u7nZvbPxRA+azODhJOJngMdR0nmICGd/dvT+Y5bYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6448
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280132
X-Proofpoint-ORIG-GUID: aQhWQ3orGaZuG9hko_A0_b60HzGVExFi
X-Proofpoint-GUID: aQhWQ3orGaZuG9hko_A0_b60HzGVExFi

On 25 Oct 2024, Kris Van Hees uttered the following:

> On Thu, Oct 24, 2024 at 12:37:47PM +0100, Nick Alcock wrote:
>> We fail building if <valgrind/valgrind.h> is not available, which is
>> ridiculous given that the only reason we need it is to make valgrind go away
>> at suitable moments to let us drop uprobes.
>> 
>> A suitable new configure check (using a new check-header-macro-rule
>> function) lets us check for <valgrind/valgrind.h> and disable it if not
>> present: as usual, defining HAVE_VALGRIND or passing it to configure will
>> also suffice to override the check (though since the code this enables
>> doesn't require any part of valgrind at runtime, I don't see why one would
>> ever need to do so).
>
> I would remove the final ( ... ) since it is speculative about people's intent.

... what's wrong with speculating about people's intent? But fine, dropped.

>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> Bug: https://github.com/oracle/dtrace-utils/issues/80
>
> Put Bug: before Signed-off-by:
> Indentation issue (see below).

Ack!

>> -	if (RUNNING_ON_VALGRIND)
>> +#ifdef HAVE_VALGRIND
>> +        if (RUNNING_ON_VALGRIND)
>
> Indentation issue (spaces vs tabs).

GNAH. Fixed series-wide. (And in the other ongoing series, too, which I
managed to forget to adjust before the most recent push.)

-- 
NULL && (void)
