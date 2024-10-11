Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF871D12F0
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690849; cv=fail; b=E+PEOcX2qpumDNtVCAoTyVHNcAZmoRsDwnP3jc94lT0pYoyWuW6J6bY1ZaKHlF+XpYnQ+lgsY6AiTTwO6YN++VtfFjVsfdJG50RjjtPu4bR6/hXT/NrrleBo0sIk1xHNhqYrBKYNDj0k1LwPbqVtY2F9Xsf+Dc1XfMhKbTMbTHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690849; c=relaxed/simple;
	bh=xBfK5TJjz9azHpP7NFP+3PD3csN122B6G25LAPvNZnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QDyo5v1v6T2E25Ye7tCuudj36I0p/9TmBM/gTMTukR65NiAsQg46UObRIe8kKN2a/Xza7ub5GHIGew1or0bRuU5+fQHHtyyMeR5fsUEM4rQ28PYRr5qtuYIoJwEKM2qPk9L5zVqddjealVB0AU8KBV3L/yjaxmiS9k9/rvfcVtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o0XsrVBg; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ANBjNsSM reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o0XsrVBg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ANBjNsSM"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BJ9w2V007050
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 23:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=DrmByCI4vOlRE4xqg/W1nDyE4qc3o15F4sKRh7M0yjM=; b=
	o0XsrVBgOjUdSt+9rYPvwcpLfD3KxAJNaW/KRAwrBve+n7re3Kzcgpcfzjgh9512
	54ZH6S0sJe/A11C+TSdKtTeYkdd+I8uPy9NlrsaE7cbHE8b1POOg66B9w+B5KkJ0
	Ak8OVVuzUA+fHY/y7nPE8bH9i2/bbZHxf2GVVaIqMifRzSSmWdrItjB7BfDOgVHN
	vOinFkv8jIzTPP3N1LusoOPtleu6CS+xrvUygV7ba1zQ4frJVouWeoKKq9E2oXoE
	ARtPUXFRxSAGh+PrJY4TT+HJEc1ovOPkCGOgU3GqzruaiqBHJQ4A79j5IIYGGM4J
	6EIBhjpaU1McWMh0bcMIhg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303ynyd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 23:54:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BKSVnT028072
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 23:54:05 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwj5p8n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 23:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skHk4h0N35q47mWxn5DnqT+CGv/FMKpuIp5y4RX4JIQVXnSACsAegfIwDYiC1VpJCPr32+Ql3kkm4rzhl26qrs/aTILGizXp3sgOf2rALrZvZdrkIjySeHbaCjvBo4js8g30ffapJPF6lrpp7g9g2Jnrhg2NWDqygexL2uz70Sbt8N0APvw0tRDuQSJ7+jUSLLCHUHhmLO9OguUVfPD2qPJTtuLffFQ3al+f2oBeX3+kTlBGnLrcHZ/U/sohTt38aMt68BzOS9kjvJ31fZ6pn1ZWF5PsQcZbscsQuT2HB1WTiquku4fU6/3dJFEeglK3AFxdoZDhHYBeZVaBEX0dcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3aO0cwg0XMkAEYXyHfNHUrlNSXPBIuX7Z3PxXB/pQ4=;
 b=wHz14W4cpAid4DSkh24zmpwBE5P0b2ygWp15P0BNJvu2N+ZQ7TwH5jgW5/mhKSzjL/lpEAYFAlDv8SSuzI6tQ+ObWgn0fMHT9qcbpvzZgwG6joC/McYEeJXPVGYeRCF1hZyFTsbAWEBf3kCFwyJUof4yYz2PjdiZKRdoR3S6XAcBGdlWq/MkaV4wknviT3aMdJQSD8hZixvyIAnzFwrXNgSOt68PR9IyuJ9xJKBVjTtob+KlSxwEvFboVOkHMisF/kflNXutp06sWPwiCPA+JzzdvwvhZ34fOmf8wj662b7p0P1J4POksUXgUhUXRt5Y3SxEfh6ji3zyHhjKLbPZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3aO0cwg0XMkAEYXyHfNHUrlNSXPBIuX7Z3PxXB/pQ4=;
 b=ANBjNsSMRjGgHfVkEtxQ4G8RDdNYeR5Gw7grWEwXRb+Z2LoBzc8jjB5JZU3NJHloXIWvARlasI3VrjaV7wd+1VEjnuHau38QTl4aqjlKbcfLwsv4eBCyCA+ah6xgm04nEhXx5qx33gPFo7p/YMipY/9sOFtc+bXWipDfKXUXlAg=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH4PR10MB8100.namprd10.prod.outlook.com (2603:10b6:610:23b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 23:54:00 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 23:53:59 +0000
Date: Fri, 11 Oct 2024 19:53:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v5 07/19] Create the BPF usdt_names and
 usdt_prids maps
Message-ID: <Zwm6lBLQGeFQS2Mu@oracle.com>
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <ZwdeK90de5dmBFT4@oracle.com>
 <44ae36fb-9065-d761-5571-d1d2657e5ce0@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44ae36fb-9065-d761-5571-d1d2657e5ce0@oracle.com>
X-ClientProxiedBy: MN2PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:208:134::36) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH4PR10MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 70785233-c241-4401-3882-08dcea4ff9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?iR0l/jYuI3ufy1Hp6Ep9L+NiHBngvzCjBNKhqaQu4bvFT/f1PiQLVeAI/m?=
 =?iso-8859-1?Q?PtpFI/1M+F5BE3aA1LfXXznVAJlm0UlaqRGEvxXeD+trtgXP/ejxVfR/CP?=
 =?iso-8859-1?Q?hND8Ws7+7hiYzwHDIrit7cpvfu6zV6Rye4diuSGXJzCReYLFqiuG8Jveu6?=
 =?iso-8859-1?Q?pWg56KWT86fs+3PX3ZMYBTJVWV0Lk6u1Ngy9IU13RNOQrpZVzJTi7WWIGJ?=
 =?iso-8859-1?Q?M4iykRxZTKo5e7NrwhjmbilHt66/swvyaFhuGX6gSedCU1oAmM2UI19QEa?=
 =?iso-8859-1?Q?ngn+16IrcUFZve4oXc0uTAYM77apm80QD1cKW1AYyvxC4tc8ASuiNmOiq9?=
 =?iso-8859-1?Q?cEShw61duHzNMOwRU3U5vCbit4VuHhAdUW0e1MxkQwjYaS4Hwcr2vHhorv?=
 =?iso-8859-1?Q?8i05FTiJy4ePMCiGK2C/KQBlpm2+KVNcHQq9T61wnt2Amnd5yAynBSIo7l?=
 =?iso-8859-1?Q?pNsa7Rimcl7gj/4mAgtYS4W+/tTqRTC5wXm2mFqKGNhhVH3rUXCtVAJkSV?=
 =?iso-8859-1?Q?hDduVlpbDtQvqHsk3HVr+j5CK+iAP+/UIyVNgpfMTDZgzvS6Kg01QfCas+?=
 =?iso-8859-1?Q?tkCxj5W3JorAi6jZ3k5AJ9OdlCcyEbuf4T1ZN9+JdYS7g9hvmxtxXOeB8C?=
 =?iso-8859-1?Q?rgKi+IuJhmX6DUHyzSL33EeiMNcq5+LapYxMDN1HAe4G/Yduipy+XUP7F3?=
 =?iso-8859-1?Q?8OEaOxJfXHDzXkA29l8bGVLysJ+W7xCjd55FJs0lNLVKO5loiFH/yptx8z?=
 =?iso-8859-1?Q?MHba9BsYBGvUlhVEuBTCBZXpapVE+BUckDO9yyELyS9WrKz3xPlSuaOeQ4?=
 =?iso-8859-1?Q?NgXhYgpNjUHZHBs/ofEJX5r6i/aboZbmi4Odtnx5hagw3Q/HpM40dDockp?=
 =?iso-8859-1?Q?RVfgTeHTPWy1NqFYUHIY2RvG2XgNEwUxa6X7c4vRqtztfTujNE900G8ZUn?=
 =?iso-8859-1?Q?tuOkUxs4QbPJtnubzq9WhvSGF+L8dExvbMz5jb1POOsR5K2cn4vsetF9T0?=
 =?iso-8859-1?Q?XacWqLdcYkjHSzOwa/MNfjyIBY6/uxoViQD6DU8TqE1Ix3xudAjypg/GSi?=
 =?iso-8859-1?Q?sBhmegmy9FK3vEEMfMOvOSRNcDGCJdL4sTad3YSuNy+NLFLGjorwKL+LtO?=
 =?iso-8859-1?Q?Bg/GfBwtEWh1R0uSbbRlPbxtbipVL2NdYw6MjKBUqUKdBKl/+SiuZrZkPN?=
 =?iso-8859-1?Q?x/qZOZEHZ3FGU0qoJJbNNOtGkrUSXHqDvc/QgrtLseRHeb22BFvl6RMeHN?=
 =?iso-8859-1?Q?B3c52TQWF5BJFD1x4GH4HfaeQMLndLNFAUVRJ/lCDZYgIjkX86lKowmX7W?=
 =?iso-8859-1?Q?1SZJhK+uV2OAwKPqbwbfkRQg6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9cWlayNA/d4y8XNx+H9MkTSo7n5r0h5UgcfMlw7W4XZstMUcgCRSEBVvfr?=
 =?iso-8859-1?Q?56gFBYbUYztwrYy+YLZaPo0ecp26qcYk4p84kZs6KLHsNOSKPEQvRehizL?=
 =?iso-8859-1?Q?rt/SkjkTNxUXykVV9LKU/eBefVqysnMQ2k5n/0rd/XQ0SPwtY5kAvqkDCv?=
 =?iso-8859-1?Q?yIsc+Nn9mxy6hBCC+qsLyzbuC4ajsIoMo8nHGSZ30tXcYE0lqq4S1E2Lry?=
 =?iso-8859-1?Q?enrHZUlbeM/KwGw6bBHH1tUpr0L8z/2FmDplDcMCv+hkHLaBj9IbWcwZOx?=
 =?iso-8859-1?Q?8d73WKmuoZ4hXVTlVINOwCL3ZN60kY4vzQ8rIemixNQNVQKnagfaZ3D42X?=
 =?iso-8859-1?Q?3kzpRUWV2W8OeUYrHMH+u82SNat0PYbh5SGI+Ri0WGDiBWLVvhqIBcJNro?=
 =?iso-8859-1?Q?vjX4B/4IiBjkkL19loD50sGhnHBOYD2VYAdJZHja820F47nLcOQpTsUZff?=
 =?iso-8859-1?Q?rlvacwxSpfrhcb2f+eQ+TSmHhUI6E4FcjCkQwd8dyuojq96UgP4dF7YJ0/?=
 =?iso-8859-1?Q?KI3NZmD0LoXUxoQXA88sZ+lFZJEBZDPT62miW06QNkOiqFB9LVwtS25fAf?=
 =?iso-8859-1?Q?pDzWDYsLv4hIz5vVyQT9LxTnqaYHNNj23qxdDa6ynERoqzAMN9Hdg7YhRx?=
 =?iso-8859-1?Q?7y44ONqezr2DDE892/1QL6dk6sX3CGzgIzDDxRRJ7DUTqKAVpnoiIJ6aCr?=
 =?iso-8859-1?Q?ufSrn9kr9Pcm2TBv/KzqjpzH6OVz0EG+Rff2PMnMJcY3eWEMBnfvSRyQVl?=
 =?iso-8859-1?Q?W4MTdmKKCowB+chD59/6WbNATd7Fbx+emSmJ9uOZK/TrKLgzFnlzUsGS29?=
 =?iso-8859-1?Q?qCCOAjSZQaFv1HwP3SCyPiq2C2LG8MixI7Ed1qWbqWzD9+7KVwTbR2Jk/7?=
 =?iso-8859-1?Q?hW3jNOXEv1g/+r4bmGOke2mK8wSjio4mOoC9nCtxm573Zfs19I0QL079nH?=
 =?iso-8859-1?Q?cvyq1cGsnwKels5AJ7cQMky5gJb6ZBOhsofqOUUNRqqvi+rfVs1XZOLNBp?=
 =?iso-8859-1?Q?oQq+LB1APcSRiNNXmz8P9N879Z8a/dFsmIRTQ2ELRERsCSgnxzjFoAEYNF?=
 =?iso-8859-1?Q?qGX1Nw2CSQym+DrmebLVGLwroCJv88ioiRG9Ph8uyC/74mfUm5DyRom1jg?=
 =?iso-8859-1?Q?QlG56s3nocWfMN0fS66tcmIsng7PB2/+O7YFAzMKC+QnTBHQwZBl8FbBV4?=
 =?iso-8859-1?Q?l3fOhBR9qR1SszBfHFbdPsp7XXyaSMYmrlUU4Yz37+6TnaGzgRuXHESAAC?=
 =?iso-8859-1?Q?PvWZpygLyBlcc5qgbVWvvxyDFkLBdIKxQQDyKE2Ug1Op3ovqKgM2vUhtkE?=
 =?iso-8859-1?Q?jiPL+aiclW9yFyhsnxcydrtoMa6PUyGqJDThbF5HHGUKDI/7lLr7bpiTYO?=
 =?iso-8859-1?Q?68YcRT14mVqHtxLtQYRVVEv0MO+UHT0QduIplCWfigKLTWx2z/Ye1n1rPf?=
 =?iso-8859-1?Q?O0pmtVJZQNMQPFLmDqbkYFJ67uK5qs+MMj4XUPp5ZynIgn7nyegsXcz2nF?=
 =?iso-8859-1?Q?zi4zyGlLs8AFpGq4L2lvNc5qgcYaPtXY8Zc7njFJPgUpEnsJjhv/eVh/85?=
 =?iso-8859-1?Q?0/aSj5rTdvQnWnLKgXGL7PYK5LVbX54nvKbpq2LBZpyDQT8bUAxnoC6vYN?=
 =?iso-8859-1?Q?QWhx6wf6MVmVCf1YVsnWffFm20X5m4dMF8iPrTHvlJCXiFGf14cJj74A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uCmPZ/VZA//yRVFGSPpCJbqB6k9V88NnurwRv1iZm+im8VYeBZmDshZmGrMrlkBGg7yxTJYVFOCWeYJd2eynval1udOdyM7ycyT3PyV2zP9Iz5LHL5t6LuEgW7SMoV5z4PFP/3COFoGRelJHDL6VyTeWfPf0WHEqeWIhf8bjcuMJrqAfIIvWbvARfilNUh6cRDh2147g5ftFCe+oJm9zzLeEfKCPnIh4bS4sIFa5YH05wUCgplDWzBBhhBQwqtZmKeXu9z7uV3LAb5552jS2fiirw8zfxjdg5//oMBItwO3cNif7Ibic29mgvD7DZF/zDh3zsEo7ytARWfql4APrVrqtlvoFPbTXPRa1cj43zSppbt9cH2YhZstHbZfkxuITsLpgV7WBgmDJjCcMcl3boIwPFXRdN7PE2ju/EVedYcRdvcFOFqIZ/9Q6sUTiMb+wfNJTO/QGQU9T+21sAj3uh24tBEoN0GPRWTKgi3r2IOQ08v9SuODN73F/Tf9xxeWc2F+80veK+YESSIS/okuZWVQi9RSkRSIJeIuJd26eXOFQ/Eq4lRI9+7jCqRiQqSwS8aGxY8mL76RLbTBmwvRYtWMKf++i4NytevAS49i30OU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70785233-c241-4401-3882-08dcea4ff9ff
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 23:53:59.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/d1DA5L3Z0gd5hdrmKv4lngXeix2U9Co+reRBdFqfEAQjSn82VJBOLbsbkkqTgxRuIcrePexIgRX3kRPxtlcW1ACWJbPn8n5nz15IrXBeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8100
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_21,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110166
X-Proofpoint-ORIG-GUID: EUHfv7v1ZyYT38OP4xhT5PskvJhqMw2p
X-Proofpoint-GUID: EUHfv7v1ZyYT38OP4xhT5PskvJhqMw2p

On Fri, Oct 11, 2024 at 06:56:16PM -0400, Eugene Loh via DTrace-devel wrote:
> I know there is another review email closely related to this one, but here
> I'll try basically to respond to what's in this email.
> 
> Also, you make a number of suggestions that I could incorporate that,
> therefore, warrant no further discussion here.  If I don't comment on some
> particular point, that means I think I managed to incorporate that
> particular feedback.
> 
> On 10/10/24 00:55, Kris Van Hees wrote:
> > On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > As USDT processes come and go, the overlying probes for an underlying
> > > probe will change.  Hence, we will move to a scheme in which an
> > > underlying probe will walk all possible clauses it could call,
> > > deciding at run time (using a bit mask for the overlying USDT probe)
> > > which of the clauses to call.
> > I think this could be explained a bit better.  I'd say that it is the "set of
> > overlying probes for an underlying probe" that will change.  And I would add
> > that the underlying probe program will walk all possible clauses that any of
> > its overlying probes might call for each overlying probe, only executing the
> > clauses that apply to that overlying probe (using a bitmask).
> 
> I'm not convinced I understand what you're getting at here, but the next
> version of the patch should reflect my best attempt to incorporate your
> suggestions.
> 
> > > As USDT processes start up, we also add new overlying USDT probes,
> > > whose name elements must be retrieved by prid for the built-in
> > > variables probeprov, probemod, probefunc, and probename.  While
> > > this is currently done with the BPF "probes" and "strtab" maps,
> > > the monolithic strtab map cannot safely be updated by the consumer
> > > while the kernel might be reading the map.  Therefore, we introduce
> > > a new variable, dtp->dt_ninitprobes, that records the number of
> > > initial probes, those created when a dtrace starts up.  For a
> > > prid < dtp->ninitprobes, the existing scheme is used to retrieve
> > > probe name elements.  For newer prids, necessarily USDT probes,
> > > we use new a new BPF "usdt_names" map.
> > I think this could do with a bit of rewording for clarity.
> 
> I don't know what specifically you had in mind, but the next version of the
> patch should reflect my best understanding of what might have concerned you.
> 
> > I am also a bit
> > wondering about the dt_ninitprobes name.  I think that dt_nprobes would be
> > sufficient, as the number of probes that DTrace creates.  Any probes added
> > later are numbered higher than dt_nprobes.  Not an ideal name, but I think
> > it is sufficient (and pre-tracing is the only time we really care about
> > counting probes in general - the later ones are counter towards nusdtprobes).
> 
> Okay.  Change made.
> 
> > > The underlying-probes "update" function is called sporadically.
> > > The focus of this patch is the function.  When it is called can
> > > be tuned in future patches.
> > This seems to be an old paragraph because the focus of this patch seems to
> > be the creation (and mgmt) of the two new maps.  Ideally, this would be
> > multiple patches actually (creating the maps, populating the maps, using the
> > maps, ...)
> 
> Ideally, yes.  The original patch series had finer granularity, but some
> disruption (I think the "enabled PID" change) produced lots of changes,
> which were easier to handle by lumping some patches together.  So, "ideally"
> some refactoring could be done for finer-grained patches for easier review,
> but at this point is the current factoring of the patches "good enough"?
> 
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > @@ -940,6 +940,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
> > > +static int
> > > +gmap_create_usdt(dtrace_hdl_t *dtp)
> > > +{
> > > +	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
> > > +	    sizeof(dtrace_id_t),
> > > +	    DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN,
> > Any reason why you are not using DTRACE_FULLNAMELEN?
> 
> Honestly, because I didn't know about it.
> 
> That said, FULLNAMELEN has the funny characteristic that it has a "+4".  I
> wouldn't be surprised if that's a mistake.  Anyhow, it means that
> theoretically using FULLNAMELEN means using a little extra storage.

The +4 is to account for the ':' separator between name elements.  Which is
as far as I can see actually incorrect because the name length constants
include the terminating 0-byte, so when they are combined into a fully
qualified probe name, those 0-bytes become the ':' separators and thus there
is still no need for extra space.

I'll try a build with the +4 removed and see what happens.  I expect valgrind
won't report anything different.

> In practice, the component name lengths are all multiples of 8 bytes, the
> key is only 4 bytes, and the BPF map I think rounds to 8-byte alignment. 
> So, in practice, using FULLNAMELEN does not cost any extra space.
> 
> So, I converted to FULLNAMELEN.  Here, and one other place.
> 
> > > +	if (dtp->dt_usdt_namesmap_fd == -1)
> > > +		return -1;
> > > +
> > > +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> > > +	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,
> > > +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
> > empty line perhaps?0~
> 
> Sorry, I don't understand this comment.

Similar to the previous assignment followed by a conditional, I think that it
would make sense to insert an empty line between the assignment and the
conditional.

> > > +	if (dtp->dt_usdt_pridsmap_fd == -1)
> > > +		return -1;
> > > +
> > > +	dtp->dt_ninitprobes = dtp->dt_probe_id;
> > > +
> > > +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
> > > +	if (dt_uprobe.update(dtp, NULL) < 0)
> > > +		return -1;
> > Yes and no.  You are using the probe name data for USDT probes that already
> > exist at this time from the strtab so there is no need to update the usdt_names
> > map at this point.  The usdt_prids map does need updating, but I don't think it
> > makes sense to do that here.  During program load would seem a much better
> > time.
> 
> I don't know what specifically you have in mind, but perhaps the real
> discussion is over on the other email.

Correct - see other email.

> > Also, we certainly wouldn't want to use a direct call to a function in
> > a specific provider.
> 
> Yes, that smells stinky, but that can be changed once we have a better sense
> of where we want to go.  One solution is to have the consumer loop over all
> providers, calling the provider-specific update() function for any provider
> that supplies one.  Again, however, maybe this topic makes more sense over
> on your later email.

Yes - see other email.

> > > +
> > > +	return 0;
> > > +}
> > > +
> > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > @@ -63,6 +65,15 @@ typedef struct list_probe {
> > > +typedef struct usdt_prids_map_key {
> > > +	pid_t		pid;
> > > +	dtrace_id_t	uprid;
> > > +} usdt_prids_map_key_t;
> > > +typedef struct usdt_prids_map_val {
> > > +	dtrace_id_t	prid;
> > > +	long long	mask;
> > > +} usdt_prids_map_val_t;
> > Move these to dt_bpf_maps.h?
> 
> Okay.  I did this, but this uses types like pid_t and dtrace_id_t. I had
> problems compiling the bpf/*.c files that included dt_bpf_maps.h... 
> resolving those typedefs and/or dealing with the header files I tried to
> include to define the typedefs.
> 
> Not a big deal;  not a blocker.  I moved these things to dt_bpf_maps.h and
> left pid_t and dtrace_id_t as ints for now.  A FIXME indicates that this
> should ideally be cleaned up.

Yes, we should probably play a little with the include files, to separate out
some parts that the BPF code need without needing to pull in things that are
irrelevant (and might break compilation of BPF code).

> > > @@ -123,6 +137,213 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
> > > +/*
> > > + * Clean up the BPF "usdt_prids" map.
> > > + */
> > > +static int
> > > +purge_BPFmap(dtrace_hdl_t *dtp)
> > > +{
> > > +	int			fdprids = dtp->dt_usdt_pridsmap_fd;
> > > +	int			fdnames = dtp->dt_usdt_namesmap_fd;
> > > +	usdt_prids_map_key_t	key, nxt;
> > > +	usdt_prids_map_val_t	val;
> > > +
> > > +	/* Initialize key to a pid/uprid that cannot be found. */
> > > +	key.pid = 0;
> > > +	key.uprid = 0;
> > > +
> > > +	/* Loop over all entries. */
> > > +	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
> > > +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> > > +
> > > +		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
> > > +			return dt_set_errno(dtp, EDT_BPF);
> > > +
> > > +		/* Check if the process is still running. */
> > > +		if (!Pexists(key.pid)) {
> > > +			dt_bpf_map_delete(fdprids, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
> > > +			dt_bpf_map_delete(fdnames, &val.prid);
> > > +			continue;
> > > +		}
> > > +
> > > +		/*
> > > +		 * FIXME.  There might be another case, where the process
> > > +		 * is still running, but some of its USDT probes are gone?
> > > +		 * So maybe we have to check for the existence of one of
> > > +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> > > +		 *     char *prv = ...pdp->prv minus the numerial part;
> > > +		 *
> > > +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> > > +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> > > +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> > > +		 */
> > Yes, there is the case where a dlclose() can cause some of the task's USDT
> > probes to be dropped.
> 
> Shall this be addressed now, or can it wait until after this patch series? 
> (I vote for waiting.)

We can wait.  That is a less likely case and is probably easier dealt with once
we have a working implementation.

> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
> > >   	dtrace_workstatus_t	rval;
> > >   	int			gen;
> > > +	if (dt_uprobe.update(dtp, NULL) < 0)
> > > +		return DTRACE_WORKSTATUS_ERROR;
> > We probably should to do this with a callback function
> 
> Again, maybe we discuss more on the other email, but I don't get what you're
> suggesting here.

Yes - see other email.

> > instead of calling a
> > function directly in a specific provider.
> 
> Again, it could loop over all providers, simply calling an update function
> for any provider that supplies one.
> 
> > Still thinking about a better name
> > for the callback though.  Perhaps dt_usdt->rematch() or something like that?
> > Or dt_usdt->matchall()?  One of those was used in the original DTrace code
> > base as far as I recall.
> 
> I guess it depends on how we think of what's going on here and how that will
> generalize.  My thought was that, unless we have some event-driven,
> dtprobed, inotify() saying when the function should be called, we simply
> want to be called "periodically" and that other providers might someday want
> to do the same...  for purposes rather unlike what USDT wants this for.  So,
> that why I chose a name that was very generic, assuming only that the
> function would be called "periodically."

See other email for better suggestions.
