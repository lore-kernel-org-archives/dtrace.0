Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE93195FD
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202817; cv=fail; b=m1dQGxlkd82VvSCgia1/NsXMr+01SnTJntsnIQt41Of7QjxmSzhB50sc+l+x2qmZufUoo0TziO40B6cStrLNZVF5ukcyBNlw9Yh1j9GPkzU8mvXk2Q5NJQsvmdigW7jL4uZBItnHEejGrYamMmg54pXIWRE2BdNaLl+opWR0M7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202817; c=relaxed/simple;
	bh=LmDa0YGVCf53XSrHLgT7noQkzVBmVEeL92q2cd4d4S8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=nKDCJWWth2h/A7QZuxRedoG6e8XUKUW+fioLZmeH5ybPTaf47ihMQNO3cuKE3RbghM53lP2+lppvcl+h/9/1wyKuz6Q5eaB2Ht36TBtimalwNbH3TlATEGya5Hgmr9x6ZtetmpdCY8UQV70dbkdgt1c7NscBEH1zD7kcQSWwRJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nT5syfvS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fd/3uz0W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nT5syfvS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fd/3uz0W"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHBvu91404878
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4LpiKEDk1/Pl8hxhdu
	hlhpPb+A1Ndr5bMfZGHvBqKug=; b=nT5syfvSzPkLsjovhjjos6qKU+PbkjBpA3
	cAlQfo4142CWnPoSuGnaEiYffjFzwvhrNhrhO/KXp76gFkCVN2YrboJl7AGLVKBE
	Z1aIZ1I1U5/cNJYsF73lCc9JnO04/rlpUZ22l3/GpA9+kYnimgHyP1l+g3B/IRuF
	YfguSM2TpErcMuPegb7mWP4tZrDG9BpwCchbosnacqjmxn+7MLExycUWFS2bSY29
	FJQ2hOi5nv6QaeNAcW7M93EriqwDtwi8f53LCnkXuu+3Q83mDLwwPJwuaOsKFaT0
	4nOScn4sSeeNTcBuWouPyRrSNqI9MhUDrvVE4zR1ceL8o1d9OyhA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh8683v03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:40:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELdOMu015385
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:40:14 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nksu8n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:40:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNORqjkH/hY9IWLPB4JksKHkuI95g5S6v7L2jItz5jXyl53/cf3gWt/vLMY1ApfwozPgASW15BinfwF7Xhb7AqQrsZpt2KELLriHuKp5Kl16KCFAGcqrSFu2rzShRWO8qkeAyBMQManyJh7z/fyXd5qMHatVlER+g9S6YfdjvpNSpGxB+si/fPjFnfEcr+1D5yMjbsPFkH4MvhQyJJNv6pDknXv3UzKzvjv2QAkvUYiXZuYcpyHXgCWwL0gtGOTPIgZcViIMQLoLzKWptXwX9+0U+VM8SSyXKGq8G/XKWuIKDeq6mNNxnG1uwLBjz+s0YJ+6htukrLoM0ufb2hOa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LpiKEDk1/Pl8hxhduhlhpPb+A1Ndr5bMfZGHvBqKug=;
 b=F+VA1FgDbRufwPUp/mvhbro73KV0cVVpg8xuiHD5z3arHnV4IRnzLx5ShyXUwneuilVhnWgpRdFaSbXRTzxAPo3NvoiDMewrN9LibZg1KWRoCTsVPsrlmFQO7roZPbqWFSzFjcl4kQOvwNX7sDLeazuqF4gvO8fbjIciBS1xlHopEoLzvFHFCcDNUPmOhT5c+DtX0Sc8azlPA4f6e+hPhFmKdES41xKxEyZ4AxLnwWejCweXLo93CNDsEH0DNmcUpJo+4Qxm8aXvP+CAqd9qY1KWFQNmOFDGmhKEb9dKqWA6vkPs0XkBHVKZfCvIXW5nsDGk3NWuosIyxdjXP58Dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LpiKEDk1/Pl8hxhduhlhpPb+A1Ndr5bMfZGHvBqKug=;
 b=Fd/3uz0WqneU0HgLzkhRV12Wd3XaZWnGH1kRYAepWPbGBQLu5gJmvJHPi+1ia62PUGebmfEdTLYS5r14RI6LtmoEZYi199roUI3aXkTMdralwOy8XFK5nFy/YFVJSBjDSAHiwZNT/c+PNDqeygKKoZTvR4TgtOFEHc+9skXOy3k=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SAWPR10MB997791.namprd10.prod.outlook.com
 (2603:10b6:806:4e2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:40:11 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:40:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 3/6] Check if the BPF PROG_LOAD is either
 -1 or else non-negative
In-Reply-To: <20260331010224.16165-3-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:21 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
	<20260331010224.16165-3-eugene.loh@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Tue, 14 Apr 2026 22:40:08 +0100
Message-ID: <871pgh2pc7.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SAWPR10MB997791:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e81050-2fdb-41dc-8a75-08de9a6e67f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0Gm0aGZBWj01/qdDyPwxazPNgkFH+M0aqQCVizyAo8V5DnHSgeeTpfaskzEWM3F5cN9zlXOy08dzHsOeEGbZs2zOIIApGZdyk2EcI/JeUWuGXPfcLX2Y6wShiUicFuUCVXcspxU8yhrgIP2FghU5B7amyXrsPgoD22p94M6iLa7hKQwwAPf9ZXsccIsAo5lQ7hBAPa1QnpJo6Myq8HlFMvchxkCKXot4raV/u0QsClkwyUg4CyJlFxF78+K4pTYeUuzyLQf+J0m9uavoADjalyfRxWm82MCl+qFc7s6WDzeGmV2zDCBXtYuPBFN3WObbIrhcpdlL3sb/DLg6daguEUeEYpwRAfk2iOW+lUeBimq2kS2eoT39mpHdafGLXCQxlV/RlAn+wypKZzop1I/hlseX2sVuo5sSd/n+NS/AMl5NU4FeS6lr3gLiGGC6rBS3l14Ra8+Z7xatV9Q2n60u96TVAkrt7+PabesKI+DJ6BFn7/VkbpaOanvTI6XJeEPXDYQzTj0QCl0XVo2dQcdIVKeiNQ+2kodsA9xs1Mt5LjvNoF6fum0w5zO/h7DNmETUGKi3VKK39Pq+qqSzTnwZaUJpQglyPuKIOaM13gDtFUN5sCBUEEIxdfJ0ZCWnJIixaVEf0FCPrwDHctGHQ7EePeg3f157uE2Ha9BUjTQ6+CLWDmakMZBrj1sPLOxgdQiFDulcUdyOLdne3yPBi15iQR1jeeBCri0dEjsTjAToY9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4l+aeH4PoBXzlMoayFvoyvqr+6mbDuftgvmMEwAfQ6FNCwn5Xb62xUwVPdYl?=
 =?us-ascii?Q?MKHt42h4U/yT4Juup6n8H+WbABOIkqG94ypC/l92uUg77KC0Eoolq/e82RJS?=
 =?us-ascii?Q?nY8w09DW7LPNbtsvWC0I1PNeXVL1m27RrkdY70YAK0nxS/1qOngNCWvgMm0r?=
 =?us-ascii?Q?rCimINTD2vewu0pz7+Hs2l49Ft0v5YjswlvFQZDrakXRYsQoq1QbbTg1Awfg?=
 =?us-ascii?Q?PwR/vdR1otkH0U+zVh0CArQ+MM17XqrCPC7iDaH0Ihh4YfI1nuEHmZBgXXT1?=
 =?us-ascii?Q?f6TkPQD+N74ex7DLAJJ6loCHShSrAEt6hZWT5xlkT1IFB8Q/PU32Wmk11Cwk?=
 =?us-ascii?Q?3nakNVlJT+5mshjMCURooAuxWaY2J9JJ4tP5bELScIpWSSl4HKdxcDh+KMmv?=
 =?us-ascii?Q?OQQn92DCGWb8p0N4iVjI6eE9xhDX+PaN+c4y20M/KvlcP39FtXfmfHlbZ6F2?=
 =?us-ascii?Q?jFwffT4PAgJ6GF4Hp2pILkkd9Mk2wXu7d7kRtPQ3XvHnJRCwUjXldRBOAgL+?=
 =?us-ascii?Q?BoLRVTPuIBENsp/baN+m7mliipGVkx9zO9R2XstNHR0aFUK2cbjVV8QI6KLd?=
 =?us-ascii?Q?w+0Kggrj/xUjEWlH0zz/opCx2LfpQ6IJyq3Xz62+94TkpMwFoSbeITmfUh8a?=
 =?us-ascii?Q?7+DX/H97RSsNt2+mOYD2XKC/54+q0pWA1q/e491XZzP5K71+LSqD2vCilqRY?=
 =?us-ascii?Q?5FdXigsneWGQLOBwUrSktP4wdCgGLjIlvLS9eVnsldtxbVWBKE80XC+ulWMo?=
 =?us-ascii?Q?fNWV9t5M8nYtMpteU3JJVszualCdqgxh5kGaOIoaUY9vEJoXqcLcfMF4KCHO?=
 =?us-ascii?Q?rMdWgZeO8yo9XMUVQlwi/x8fVbV42HJDbzwWJH1mWWuKG/kvFwXvrS8bPiWT?=
 =?us-ascii?Q?iD9G9ANHWv4NcKInCShiV8GoPXmMS9GWPBkHnCBW8macUwhuTwJN9C6c5WpP?=
 =?us-ascii?Q?UN4CZAOj/b4pFyheVGlSKl9FaOV4HZerx2UyGwtYJiS6DJiOzDb4jIbJ9Auc?=
 =?us-ascii?Q?ZY2cAdA0mwdQXHXeTEUjHyI5neO6QJxT+amsICc8jJUBl3PGpNJJU69Zx/MZ?=
 =?us-ascii?Q?zS6r0w0pvkavFB0DC0ehAESDPTnvBUpbxPU9Qmkz+myPJZFueLEV04krJCjk?=
 =?us-ascii?Q?ptICVh7PSsMNbJ1A7Cvcc8Uon2loR8s0EVA520q0OTr1eE4dmYMRdWO0xnNt?=
 =?us-ascii?Q?XO+oL8VdOfCrANWzWYNZ2S3XMOsFUTc+pKpdV2HBl2fjai6mRIqiSPKdC7dj?=
 =?us-ascii?Q?0dqlR2f9MD1cgr0BLcYYCwIDhUDVUpm3yt4/knsQqMz8TzHyOEH7AuM/lSxj?=
 =?us-ascii?Q?2M4xWH7iR3JqsUp9EfJFXCxg37ivnaSMMLqiroh1iqgbPnVI0Tv2gc64HUMp?=
 =?us-ascii?Q?xqYmX3B0gZ2VlqD7Dpo5yfD5nbHxpzuwKGO/SCmT9y8iOreTaAHqvLroKiv6?=
 =?us-ascii?Q?qJecih7WWndUzeghW53V9XE+QtzJKctao691H8ENaUdFnsaErVTAz3f9s/09?=
 =?us-ascii?Q?QqZ4fe+EB8srxHj6LYaQ6X2ytV2YMrQlOD6qAajWtIZAAgVcQCd5XA5xnJIw?=
 =?us-ascii?Q?g5QyrOF9OcObDtHt0zQ0AVgoJqiKWuc50cDmq+RDTNYWEU65FFw1RK0/+ATh?=
 =?us-ascii?Q?rG1luLqp12evclLR8AaP+/DshpT1d8bq4p6oQW9GqNIG3g4guBQU3iEco0JD?=
 =?us-ascii?Q?bF0szZnEdBh9pv+7FL+FqBbS/Wg8ZRci0u1MfStEWDLiKnuAU/p5ZcVx/u8Z?=
 =?us-ascii?Q?tzJ2fRgn8g=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	bnh9FxoKogtXobcZLmki7y9EYMBmPsbjC14MRWUCvC/mxfPhGDrqB1q/xA6f/7TSOIEozeReh9FjjCMY/qT+4Hg0AkyTUUYkNzJuQ/f+Wq+1t5wCPQ5NM9BJaK1j06XjmYhuwpOPhGUvaetKbj5sJZz+NvNg2FrKlfl0bx9r75agoC1++PPH7g+WDZaIFwpv3R46FD5wQqDu7PRWwcD9rfUPX9DCESgGyrj8EmdOThp53gPLMjrOfRwC54+r9Y2/cKVdtNMKhCL3vVOwthtx9On19NalBlT26A0k4sVy8jicXuYvNo/SlXuTizvPYUrofTOc0zcLlUpeW0Ztd9+lvw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ofl7Lj1Ehf7X21nx7BKya07A3e+aaX2ZMQnnVXnfG/UYXUn+JbD3NTR60j1Akf6X1E8Tf095SM+/4efwuMGOBaj3TSWwuF9hfLYpDqgFkt1kyTunHcJCHmIbvrwyryu1LO7LkXjXYSAzp9B01bQ9ZuYWyVyaHo7nDPINbJAQwhjLbXNDSbJ9ehtY+9aUioS4RUeRzdbqfstWcwNT/ynhpBKAI+Pu3fzMXIErlc19jK0rbi/qh5SvktdFW9E1WoLc3T8MaqNv65OvXEaLGSWVKrgl5PxrHpkgbT63WLeAANwzpdN1G1EenM9qvKXEOgQ/JaxfMv8ZJySY5igIsOk/ok7e3dzsNA9EPYPhR8tkpY75zYfi/8C2R0DSVWUJgjXosHce7WjeRSLbnoWueqssXc1lOuH/tgjVVqULg8Z5OagpUNcoDP1XwjV6+aAqyR/1v/EnfCFtdj3yr0aSstNf1gRwuItdX/czz7E2qUkCyx99Ox7xLMEPtZOaoj1MCik+g3g/Bzr27QiROgHMF8pTpoM5tBpoNCnNI20xaFGfDdP6h45uM+1GBp2r7/V0zKr6vM8WZvE8hRXJVSjnSNSXxF2nh77ejEKdANDFaMba0do=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e81050-2fdb-41dc-8a75-08de9a6e67f7
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:40:11.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaFwVc/OgTyrBLsESV/psKI7S8URlT1pE5WkOTEJvsGO6ExnIxlzDrAm+rGbW3sqxY4Kb608a91e5PWeBfh72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMiBTYWx0ZWRfX3e/MH6l6y5l9
 smR3w/ihvt4QeQyzJ10zk/aRJErXXs1Wgv0TIuqfm30BON1QkK5xvbbGxnA/C3I1G79XewoV+34
 aCngEfNRcSpmlrDr1Nc2V9/zCEsExnnt1it07WD/ZyuzQrEkUxggGSjelk69WEPoYcI1Gw0BXmi
 +Vnzym+FZbgNUl2A5eTVGU577wXia25DLFKoD5G4s0dbCBxRqTXTZUqliVsa+dowNhLDKcIi291
 1w3GqaphYtV+4AzZg6JSI1J5cOZ5qUyKoZszQK14tgHLUjOZElu/am/Cs/SrQO7joUt5jb3i53k
 PsJ1iHZqvD3xovaITX0TyQSxa0te/JkYzlxxQMFuLikuAVSXKHGO9H8pvcP5ugYJ6/DON/q68kS
 GRpsxc1gxjhrebOeJDjLOo8gY8DLI9WIYKUiNTSRReptX3csNg3SY5XKKf+ENeDS63csSeKzz/s
 pMyA/cENIShZE0+ZNJA==
X-Proofpoint-GUID: xEaNDSEliTEiJWpkjW43IejkA-MYJi3h
X-Proofpoint-ORIG-GUID: xEaNDSEliTEiJWpkjW43IejkA-MYJi3h
X-Authority-Analysis: v=2.4 cv=JY6Ma0KV c=1 sm=1 tr=0 ts=69deb43e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=4_O_wfsO7llYUGw_zzkA:9

On 31 Mar 2026, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The return value is supposed to be -1 or non-negative.  The current
> check lumps 0 with -1.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
