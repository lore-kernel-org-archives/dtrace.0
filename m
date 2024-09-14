Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117971D1F5E
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337618; cv=fail; b=XQIDOvUFMFIIV2l3aGhCJ4lMq5JwFmjeol7ZLqJpIi+iffm4OA1y8Yon2b+nxHdc3NOLjJlz7nd/KcESY6K0aTn7MCLMfoPxMtB7UCt944WqW0+eGl2JmrTG7O/GNM42jTFmQTW5rWd3XsiuXzOOX5WeMl6YH3nF9y/Bia/yIUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337618; c=relaxed/simple;
	bh=u77Ka9xzLXUhMiyVSgf8bRp/HORlaA4e17FQNBRniYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dr3yuW+ZN/3nudrFd0TibOimxI7uouNvuWxMn6kkQBoZLfWSrnVnumAe0HReM+SrSMo2+58wtXxEUfq1B7uZSRFImMcrM4RV75m8l40Om0Ab3+TiQfxRasAYhpBFprN/hS2wdQMyPOPon4mp5LDtaefy0GDUbFGxu1lzYqb8FlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Oe4091cd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Di7Jcqz9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Oe4091cd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Di7Jcqz9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABcht030865
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=hN7CchNlu70FJtf
	EuFGdTwLJ15K2WbmAlWoPjIdaDYg=; b=Oe4091cdiPGjjiAum7MLgME4056FSfM
	OJS5Kx+LaDU50kcKWUCvx02v6H4TJYB7vvKaCWMSDuyWWPGJErImYA5/ceUROVHQ
	xOz9lFVqt2rYzQV/AT0tRoe3Bz8HPxhPuCKVN/sVMkLC0z1rCmvX6B7XdvUr75yz
	B/4D0uZ6prrbz/gWNXojhBg0wbmsVuuKVG6ochQRE0DPkFvX0wsegQ40k70kBEZR
	sNEUWuVXtJR5OsY2InckpCPPGqw8eTxbGcX7NyPVrLiLOdPae45W+SJrXxTnhSa5
	v9n00GhgQ+9cxlFJK40mp+j5Px6iZh+REsZC4b2DOxwYhry7P283k6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfgnqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:13:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EE3Fit019245
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:13:33 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6dy2t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:13:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd5/pX2lyF3l8112BKmJwxI32zR9beoR+DaqLZTFz3drpbvL+gb9/fPOVc36QsYMJRNQORg7mv6hcRauI6ctEZoZLkpA6n/BCNEZw3Q/ueY2g4OKkgSJsUCbr5NOGhgBxuG3Tn/BZTDGxIKh3m+LPtdWGFSDqWsZHMs9oeNhaCo1AZQsJRzzWBImrXBz8tm+bneBhbjERs6gvX1RD+ZB38YX/X4wZDDB+/aofCc1OBl8O/2Ae6NtY+NQ0MBZGjY9QitJSzJTUcGsSL94ysxFzAnHm5B6KEb+fLPwjPbM5NaC3YqHHhXs/wG4gkIq4NCs/EjCADknsAVF83hpOTY7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN7CchNlu70FJtfEuFGdTwLJ15K2WbmAlWoPjIdaDYg=;
 b=Uv/TH/Pq6qEF2rC03zLlMGSRgDDevZXSXrhfZazbIuFYwMf+yj2NwdhECZ1AgMxKnTwCCs3QgZuos0kRjPxPzzgaJxZ/xF02ve6lTi+V7P/cAIxCfKbUA7DOwEB6Uc+E0w5GP/lWzbIH8jaUrijhrhhqvQjsKdYf82X51EE2hDri2nSnlgv+M1FyepULTcXmImQPDIoBfN48CT2Btef/8gg2ifoM2I9JGAKPgBGiLJtcI+JAkfQugJS6hZnAZaULw6xWnuEwScwthO9wGoIxPP0Mr+tExiaHfG2AnNJXvbuwqt+G0akRY80PBdsWwpXhyCeeCSWt+g4e7CKIE67XxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN7CchNlu70FJtfEuFGdTwLJ15K2WbmAlWoPjIdaDYg=;
 b=Di7Jcqz9KV8X9VnjsVsC3b2j8PBtcTR6lhHeDe5jNHRIl2W1QgcI8sKa0/lRn0F6L7JTyZ+sjkYdUP4rFPAJtwCicW2s3Nxb6rfnNdIP5nvjkkxn+uS6IDy0qCS6umSccv6ZIR7DN8+fw2XDyAZnugmNfSJFthwm5MLni8QGsCQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY5PR10MB6216.namprd10.prod.outlook.com (2603:10b6:930:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Sat, 14 Sep
 2024 18:13:17 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:13:17 +0000
Date: Sat, 14 Sep 2024 14:13:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 19/22] test: Fix tst.probestar.d trigger
Message-ID: <ZuXSOvSAa3iDJY9i@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-19-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-19-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR0102CA0052.prod.exchangelabs.com
 (2603:10b6:208:25::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY5PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 220679c7-ab4c-480a-d804-08dcd4e8e81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FajS2TsbrFucB4bQy8jBCuk/TMvjMkoWDGOSKiUqpyDAJYWU6eJKdsA/wv4a?=
 =?us-ascii?Q?uc6cZn1bo5gVaipP0oYUi/iY5mIMUIECl5C10h1Ugg4hFP5+unfeu4zdWCCR?=
 =?us-ascii?Q?aAcLf+Ll1hEA5rnZBJJbhTJYvKu8GDiy7Jxmm9A0/Z8sFzE3USuFXY5BY33S?=
 =?us-ascii?Q?TCo0YK3SsbsEoOaMWlTptzJRhVthtDFPAU4aovsnRIh3fSwrOEn5l5mOnkVq?=
 =?us-ascii?Q?i4rPq6PHLAxczNdVVsP6t+6z6z0BXy0b6zthIG6PkSg589gJ34/+fV7eLdi0?=
 =?us-ascii?Q?Dx89twzTHiAyYq5xe5S5yQav+msbHsPhPQCMSrGvjMluO4D1m/x/QVwLFQM6?=
 =?us-ascii?Q?TfUFlbbjbRRh0b7jkzNFyWnA4Wec5xbVm54hbTzWhRN5GOXAf2gahNq1D5kP?=
 =?us-ascii?Q?QKzhpYF9COhHj2yg8ljvJr+Nh83hoHtRryujHQiKsgfaRyoevwvBpAi4AtwQ?=
 =?us-ascii?Q?e7YLWkak/rtesZJCWJZ5xhytoVEkQzav215hYzP6mrFZr6MBnUgmSBcjGJ82?=
 =?us-ascii?Q?NjyvbhaN7COg7L5HVylp3ssOJ+MZkziQgOGalm6LuFbLNXUCBX/3k6mj4Buu?=
 =?us-ascii?Q?s/CY3vGFJO4qpYqT9VKkZwVUGZQi9HAZ1AR5Er5m7MCGust/12D9jFl/Bcak?=
 =?us-ascii?Q?Q5GvbIKRhSHpAEhHzx5KJ64Z2DMffBc5nJavlvrHc1f3Z18LB1p/nGe77mhv?=
 =?us-ascii?Q?uvm8Q2MRHpA+hFUG5UgudcFboAOCTPSHGiBzDiuWU3UF01Mj/8Cq5wAnKjFx?=
 =?us-ascii?Q?OJYWC7awMKr+ZW8Mv2VtogHEuym/oSQhy7GrZQJzqoCExK5W7zp0UBM/A9YT?=
 =?us-ascii?Q?aO65O3BDZJQTU7kO1RiQAxTeOpYw5un+viDUdWJLxqUE9J7mY7DO+fcYINtR?=
 =?us-ascii?Q?g7bNW4T91KN2u2jcvEH/a4lizR3P55sVL3dH1mkXXbkP8L9XlpT/+twQ0ZB+?=
 =?us-ascii?Q?FZvXcMu7OZtJE9qF6L9VjjhDfiklVlUwSnJhjuICib49QbTbcMZQrOybVQeV?=
 =?us-ascii?Q?nIMLI2mYM9vwo5+WBmOrVgmJHFtLcOR1VuRenvPmu+RJKfC5cCROsOAhxwH8?=
 =?us-ascii?Q?d5cynvNAsuMqOh1RCm5BBPfA2+zowBqiitpAoFDJnv/76m3Mp4ZX7IA9MJ2o?=
 =?us-ascii?Q?GiOyOyARPJh/i49ahInO/cBEyuVT0U79UlggWCMzooQ+Y3xndbH+7yy6PxSH?=
 =?us-ascii?Q?IAt+yfZKuoMYaT1cthI7lcOHOOOsuhOr3/H61kBHOdpnTV6wdYqE2o0pb85o?=
 =?us-ascii?Q?IiIWpmc9tFwx4pXlNrlBoPF9mnCTQDV+l4ZYPAuObRuWdsZzZT2RjLLoCeiM?=
 =?us-ascii?Q?i1OCHPn32D4PlmYQuBqh0jH2X72fc2J3J5GUaV9xepi+IfWfvrQGRNUVUQDm?=
 =?us-ascii?Q?Fnh6v10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mq/9aRKMq3CS9n2p5NDaUBlUaEkIFfrylS5XdAnTdWGpUhHMYPLMuPwDam6a?=
 =?us-ascii?Q?cuBRnlnhJkb7yh0JCQsU+uQrKq5MBZhj2BH4M4/6MgUQRHReWp/Ybarsi2an?=
 =?us-ascii?Q?u5BCnLWz2FR+WMYqmalzceShXkmUbrMH+0ITx8Qs0bXAP9bANNTf7yAF3pjq?=
 =?us-ascii?Q?vLSUB9SHrgdWziG16Xy0w1KbjpDGiqxgvQgUfm5t43BXsX4TjtLbNX6z35al?=
 =?us-ascii?Q?blht7QRySGFLtxnCFLeS6Ln9flmLyKPvIqvJxAHKpAk3BpZVta6G/4QP7jD7?=
 =?us-ascii?Q?yEFZRyDl6vDN86wJHZy/2XX2rysAm8KOODsRDVax0e5QbOiCkfrEu2L9jaJC?=
 =?us-ascii?Q?K7KC6DgIMyOdUiNrxY/mP507NIao+726xI//k/h7kSjSnx+BK6Uup0n4F8Ou?=
 =?us-ascii?Q?mTB8q9Nit8FrfllrckonNangbW4+XoV5olCKShyNe5cknKuigZb7IxBqVmLL?=
 =?us-ascii?Q?65nW/avb2jy9v7TBHeqjIGafC0ChQvF1CS4E0zalT3TR7zre8cIzXZUn1peW?=
 =?us-ascii?Q?JjMv1pHSjD67oxoaUSJhHO0usNk3Qo/qSXIHXMilTjTBPXdIMztly3u42juj?=
 =?us-ascii?Q?iCoV3tN/JDNfZBto1+24tlh/CLexX5XMUzAnmWagSCnY9UwzLrJOMACGyf3g?=
 =?us-ascii?Q?2hBVck2ILDZoNF85iIVbamjPGDFlN6kl4HOYSvfqYvH4CxpWnyrFbkhhidjz?=
 =?us-ascii?Q?S8NL2HYNufnFI1BgISG6P8fVrtFTpAHtCEgj9opGfalUls7BGeR7ANt1tKKZ?=
 =?us-ascii?Q?w8bzMGjBfsyVBg4mN6Mk5XUMpKzvgPflpnZ0jP9+PUac2bn4K/IXAICr/7YY?=
 =?us-ascii?Q?mC8wI01dXwEPecYZ1sh2cv6tooEORGJickOkuyx02YDLtWB6SjN9n/VCRxgO?=
 =?us-ascii?Q?AQlRbJIoc2dMCnDRQjTfmKD0OnbAZSv3MTNRHlxPaBNLiF9ByQ0GcI+UgF9d?=
 =?us-ascii?Q?U0dtGHcu+fS3eNC6Si4eHd7wDnhS5mgFvujKsxIt1PJIeCPQ4LqmkAmQvtFi?=
 =?us-ascii?Q?Lymfkp7ihyPtUTRHOFMRg6xtF79QB8DMXeCcBuLwquYB24whX7RUoYCaXXBQ?=
 =?us-ascii?Q?ePZxpE3vXNe6i2DdvhVPPASy8l2XCStOTNtuB45Z5oPavOatR6hauARJhw6/?=
 =?us-ascii?Q?0Qh2SH9e7F2zHTDZne+RDyCHDHZWtPpWlsWbdfy9CqVw+TgsMzKXIDGIWs1S?=
 =?us-ascii?Q?pEjyslG5NK3aWADj8DkOuOeSuQtHFjdXImO+8Mk94Q9NjN+Y8pkUoq2BVRY5?=
 =?us-ascii?Q?ghS0vna/rvevllMEeEi5FajbZCX5YSVAWvDdi/DVQit6g5k5sqSwWCQVflEb?=
 =?us-ascii?Q?zZ5A0nqRJHPlJvYpTvxCaaf1CG5RpHmWti7JKvGA2Xkg0hFbJpFR2NY7UbLm?=
 =?us-ascii?Q?P8MqrFaNCs90xC8LXIQEupZI+6pkXJMRuxbREUfy6r01aFcaVxin98TsfoPP?=
 =?us-ascii?Q?Y4hxuGRLqErF7ng3rRr7u8Snma6fKlZBR9fu31e88bnvqgKZTEu8GkFcjxP1?=
 =?us-ascii?Q?MptpjeQeiLcNOPy4iLLO7TIGnraB6F3MeLk6TgOx65d5G4VZL8qS/GBZkF9K?=
 =?us-ascii?Q?tLoUtwiyc9AwvffM77Mr+0yDnXEeWszUEz4xxYUhmv1qWXVtOP2mjsN5ol4+?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Zj1rz0M3808MprG23PJaY14cdcyUw4wWn95iNtry9mnb/4A4Ncgc4lX9VHclmHIOcjUEAtVVM5eJBFGZgf2hy7VRkG2IHLJrBeXyATaaT1qKtGk5JVrp79qCgAsprfjBr/1zNWpWsNVljSUhx9m/QjcNyXdjYKn2RWHnezxJVLviLrLGPeIqielMVtv+RbtGZp/okS37qLn5z4rn0m/3wxqTN8wXzibE+HfNujIRAz/8SsV7GOTuiX4lgRYVe6aE0qQ2tuLNKirIa/sFAKR43Jf5JuHwFw2sKNpXv4t0nUm2NkijpQ8jZ2XaTs8pffMvMDtBhC26GwuMVg+AEMm0slHdMJJens2ieMeZgjYoiY/DaykdNAzQ4uPaS5QyN+BDDPximqEKGJ6PKT+qBSyZ6FldRB7LsXQb2nm6sNlxGpn9ZyIuIxB5SgOvOQTfha3YL5WLUwCskTSDmx68MVVnUgaHIb0LyQiHPUz9IdvI49JD5iTqZt5zoVwRXUv+1vLTH1Pj6KYVKqNGnMjTLoOBGNSyMe7E6oRDEvr3MNXJKE88QUvSaMMOjjxGExaRS87oLsti01a+YvhRct5S8sG2vXEXYR/YkUXhJpKbQjf3+A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220679c7-ab4c-480a-d804-08dcd4e8e81c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:13:17.2628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dAhbA8xrbfNpIgxNa99r7JnV5fTbayT308nnx/Jza2PcigjFOx/8UzNE4oPCnIqe5DrhGuA7hCof+4TQ4ozZxl8W/xEorTryvvVVtab4Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140128
X-Proofpoint-GUID: gMagB98q4-l_1eH7Tf_lJ7LZzjK3Hk7_
X-Proofpoint-ORIG-GUID: gMagB98q4-l_1eH7Tf_lJ7LZzjK3Hk7_

Given that the patch also adds a FIXME, I think that it would be better to
resolve whatever that FIXME is meant to refer to before we merge this.

:On Thu, Aug 29, 2024 at 01:22:16AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This test was relying on a trigger that uses the obsolete
> dt_test, even though dt_test is irrelevant to the test.
> 
> Use a different trigger.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/probes/tst.probestar.d | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/probes/tst.probestar.d b/test/unittest/probes/tst.probestar.d
> index dad7741e..b6da42e1 100644
> --- a/test/unittest/probes/tst.probestar.d
> +++ b/test/unittest/probes/tst.probestar.d
> @@ -1,11 +1,11 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2011, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> -/* @@trigger: testprobe */
> +/* @@trigger: readwholedir */
> +/* FIXME */
>  
>  /*
>   * ASSERTION:
> @@ -16,7 +16,6 @@
>   *
>   */
>  
> -
>  #pragma D option quiet
>  
>  int i;
> -- 
> 2.43.5
> 
