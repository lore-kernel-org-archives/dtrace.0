Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290431C6B7
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466801; cv=fail; b=rcWf79rM3OUnJej9XDFI6o2tChlTgdmnwnzRnBMYfbpyAP1WY0NQNBwnM7BbTQ2hlGLxr7wsjfvwi6QsEl6M5YfT8lwcw+OpUpjKSg7lzxTVH5pb8CLCSX4PlmX/9R3hRG2mrkX9hGtboU28Muqwm6KvATn0zR47QVPiZXWJw5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466801; c=relaxed/simple;
	bh=cW0zm3VfCqH1eWsHrZWgTuruHt/q5eNNk56R1r5+v5A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bk6tQHdN1kITXszY1hdDTPSkKSTLadP5kiTF3WpH0Cd6qknuhrxqg8GLKw/u6KUfMCFrs+/zpUZ8FV6MCFq+r4+e3y5PJ4Im6pkVVOwLJ/5XqRPOa0W5wroVEB3lk+OIAfxyzCc8QM0nc9GUl26uIcYEZJmJmOewIvuapr8ZAWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fg1Y0m3e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ICuQh2gz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fg1Y0m3e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ICuQh2gz"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMv1i011201
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=8p6htx/yffq4oO
	SJcuVqvL2qOAdOWw6Yr1pm5jM+7YI=; b=Fg1Y0m3e1ej9r1XKZt5XplADK1WPE0
	lWKq7CBLY2hTBdzcbBdZyXWJOhYzmA2PCS+hiUh04mxGcRvskH7dfIBN5fh/2d09
	mTWVsupooWge+pRkgU5p4WIrHFrNxUk3DmkXLIEpqOXAtEzaRQO59qgU2ARfnErO
	eGddvzuIwDfrFoAzgZq4xL/UOKAgoqIUQF007N64HAwdRw1HJXVk/lmaKmSuCCz5
	qLvN6CJzGJO9hZPE2FWC6kVCdZ6eglw694Q1Y1BiewotsEFP9aFIBUluU8IOjRv7
	qzuowCwDDfs9EgQlJj8L0tsKnBl7rrC6pRmk2a0VYDaHgyEuEwW2gMkA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t52x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5GWLi037097
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afhsn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US3mfgIdQu9Y9Ouxvf82ggJV7MR+Rv2SSO3+Uk6MXznTxTR84dG8kDm+NTvmQGfxVwao0WYW/78kh7sIibEQzMJ2+o3FZwbu4BFB5wf6/qcy6o0QfwOcVSoFA99dK9CL2OkzsyteeTh2zxbXs3rcWQbibJ7QFhza+25wO22kV/XhK+T/eApNEiIHhjZfmAz5zNSIWgVvmR5Ys/tpdwoo7JBpJdEWq3iERdM6PAgBG8r7GKkAJCoGYvxSyDCpBZRyrVZf/zxTqjmvUufjW+SZceVrBkwJwyW1ItBm7Kl9dWVWnyt70PTTH28ZPPqHYy6PQEVfT6kMOyFV/yS4sAjQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p6htx/yffq4oOSJcuVqvL2qOAdOWw6Yr1pm5jM+7YI=;
 b=lOV3o+MXx06/0y0ZfyWQoTRxE/3KwhaW5IhNxr/N4t5UKiwogIWQ+YqZfGloVv0MGBvxEWUU2xAEqTP5Lyn6cIainKUcw8/hnBHHeuCWCiMIIwCxaY+ZIoV/J5xiVBpuSe3yXIV9ebHcY1NHrXmfA9lxau4vrGYrMbUuP6YtB52UB5dm6gVbxCiJddVPsdm4VlG7GTES5cCbjr3Golt/tWhEp4ICIRH7x4wikZX+N1dM0lwzOQmZH8p8SWdobxekcAWRTuE6QZJQYhNXE5fVUBYRvH1Y0iWO+G7JJLGSF4ysvaTTzDJGZUZ5cxpchjiTLpDPwVlOv2EM89z4QHkN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6htx/yffq4oOSJcuVqvL2qOAdOWw6Yr1pm5jM+7YI=;
 b=ICuQh2gzllbthvJWd0zcVgTHCLbLURBo7syOzEvm35DvVXD2jWDsd11F7gBIazxVAuJfy3MbXjSr2h08VP9vcUAuaE/8BvOG4ClAPKEM++d9e2+eMNGq8fvjvvHSFVwAMBuIAJTNBzIbk0BBIWFIEyhzRRHYSNRej6ujOS5Rfj8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:48 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 36/38] Inline copyout_val()
Date: Thu, 27 Jun 2024 01:39:02 -0400
Message-Id: <20240627053904.21996-17-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6201c4ba-c5ad-4ad1-b859-08dc966b8ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OS1aqZUpa8A4WxY1dfhaFqseg7/aKyUWuFjisirn7fWf0Mqq//yKM2yM0uDL?=
 =?us-ascii?Q?izE+oIT+lU/MDmYcwx4V8i8sQE/nzP0lu12d+3Br5BXSV2dYCSNUzRMyjKb5?=
 =?us-ascii?Q?Iaq6ZYJyoVtbed9/6Wsbiyd+SWql+0vTWV2ugZTUHUwaO62GzMg5NvDu2Y1e?=
 =?us-ascii?Q?E4IKKjzYnz88wN6YcsvbyL2ySR1sVfPk71UEF+V+uw/pHAteJ5wOJ8jrjp/I?=
 =?us-ascii?Q?VyjxJC1spEGsT13gMs5c9/iq40WMmf1TPuq3+qXGU3XuZITyG8EwVbO1J972?=
 =?us-ascii?Q?+/XJfGRoYJCm9b+JrrZ/hT3o3MMdxhu9xGt3wCW/4jA9Ht+P/VZ8oY691B0B?=
 =?us-ascii?Q?tfvmgU0DFLj05h5iP7OXWwkrlvg2gJ1/CWsmcX2QIQmTZFLWU+f/MR0Agcb7?=
 =?us-ascii?Q?bkJ+4se4FFZLb9tTFwTDZ7sEFKKcaYQ+Bo5WW937gmFEdGgliZ1RJdVryZ16?=
 =?us-ascii?Q?kzbZR8dJP1rR9Dv//wrxx4CzJ00S+FA1J1OmXiHKdn+artXbEUQsLA+0h84A?=
 =?us-ascii?Q?pxHfxNw1jqy0sRsW/D+p/EIYx+q12pStp8m8iggRGSPyhucTygEzcTL0Aab2?=
 =?us-ascii?Q?6dyGEtqzzvxh5vlM7WGf2O/aXRxdCyYG8sPavCbJa2tTmStF3XqlBpOPXMHf?=
 =?us-ascii?Q?Da4Nzb0d62VUMmx0zl9j5Hli68H6ua54xDyRi8h5er3gs+sBCprDQSgadWZH?=
 =?us-ascii?Q?8RSnJdnXKeUR8SyGyZXnMEPrTGu/XWOyNFTuASPxP+ICLjpN+X7ued9LrDC5?=
 =?us-ascii?Q?5l5smr5J51bNKEiTp3Jqh9WNn/uhFvDUiJCpSIsRZMc7HdzrRZxLboOCi1pU?=
 =?us-ascii?Q?67m4YpSRdZIg6cHMjhDPposMKLcjDyp0tKARyxUQcL3Zidx99pAONW4l5YJI?=
 =?us-ascii?Q?hFZXZENOWRBEIV1vZ3T3Y5RnlW6uP5SPKrJ18DZjZR05TCcOhnvY7tMVA1zz?=
 =?us-ascii?Q?LNGQ3Y/+WP6P6TcSDYpje/K/gX2YZOO3fuairoDHZrfVQj9A6v/HxZyqI+3D?=
 =?us-ascii?Q?raZbnQtAdRr1qdavK0cU8zAYWVvsNRrEG/JvGkDx+TSYMbIOCCOgEREmemEu?=
 =?us-ascii?Q?06IL8EuxZe1uQVtuuXNNR0QfgdCFxfPSEWUWTQqoWhj+IFEBrqEKle/TGxvx?=
 =?us-ascii?Q?frbvddQlppdlTsNJnLXQlMD0gbRSZe9ZIcTJu1C6jOy/8Zdevosu8STP98aJ?=
 =?us-ascii?Q?wORt2g/Uu9NcTyM+n3LbumwQjI904LIcs60nkA8LOQtoSvq8PUveVi2Jwv/t?=
 =?us-ascii?Q?JTEP+MyNNi95TDsGeblBcJQGPRKsZVcadcUFuxsppApkCZGKf2Qwou10nZXe?=
 =?us-ascii?Q?5I8+CBaLpWOZcjI/k8wmku9JZ1/8PUfQsYyTGaKhzRwwYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vUz1f8hginlJC727d6SWRGF2bspnPqC3J552hBeLWRo8uh140rsQPNovOn0E?=
 =?us-ascii?Q?JjPx+csaNf84H4udneB2YXUDnK5HPho1tQbJfOwawS3rghaB8tFMdzRRd818?=
 =?us-ascii?Q?kRu8gXnhIwRQs7Dhe+cTz7r7SZ5zBXIwlBwmskM7wWc6NiujwyCqk805MlCj?=
 =?us-ascii?Q?zJdGvCGTnrFXd6Kna5DbhyxfPSBdQNgG4JNXvPE4ikk5nuDUbDFYBXJUeDnO?=
 =?us-ascii?Q?ibcmBZ3H+b5LnZpGj8Tm983rOKYx7nRV3c6YilIO/vZZUW2p+9atalerhrji?=
 =?us-ascii?Q?JJwZQSPrHRpPSoKA1yTAmZJGCrwPtRUtv+amm7tfhI/nVO2TIUb0FJYo9sgf?=
 =?us-ascii?Q?cAEds+2bc1+7MKTKLm7607xbHUBVfHhxtoPkgvrCZfiKW+xds1SHCVDDe9nG?=
 =?us-ascii?Q?8R6vSAFRGBQxVt9OjO4jZBwenP/3HrlmItWO3wERiKAd8jkJ5XUuZ50YBF7g?=
 =?us-ascii?Q?qfNhpWTfT2DGTSa+f/8mu2bDN74D+/FRCzZdDWiL/byvrp873V1YZ255dJli?=
 =?us-ascii?Q?wyOi4twoF6tqWOgHNu/ihX3FoGeQwAYlWg5o3A0lSNjOm5anp8QifKuvV88y?=
 =?us-ascii?Q?6pqap+jmmLwwjvq70LbSbC8qBvNdxUkKXFHqs8/x34KB9hiRdzJS251zQ882?=
 =?us-ascii?Q?aeK/M+I+ZG0DTj4BcH39U8x6iwCNSx6IYspp5XgV5J7aGx/XhREr5nySw+3m?=
 =?us-ascii?Q?TttZNksykIl5GdgkTx7bAf5yYdbNcRU/0QD8Fsg5YLFdogKTZ8K6mFGFJEkf?=
 =?us-ascii?Q?n6d3EmYnsnJ/2TfKrCP4SyEfcz9z3N62fyxG8a8/+u68hP5aJdxHrW/bYPvm?=
 =?us-ascii?Q?CfzclZ3yxj9HIQBfE1GVfZu9zAEpK5JgScDbAkV0dsqrs4FXhhfcxXxNGIGl?=
 =?us-ascii?Q?F2DgOX8BS+ZKdJJ60iqbCoKzg3OeIdXe2BOxjZv+MTZr6YzihTKsvkbcBTM4?=
 =?us-ascii?Q?FOOULkusrTznK3F/cGAJlYRXMnpn+NXfEAtx1cdJF2BPDvmn/Yo0wd+Vd+yn?=
 =?us-ascii?Q?hPQGkuGdrNt9CxQdK6c8EqT+B9rmW0P/5qzaS2IrhqFlqeNL5OU5ygnbyp76?=
 =?us-ascii?Q?CDaOc9LF0kNonnideRBqrplgNqvjLyarRIG9ssPzJljmJjDg2jbVekRWCILV?=
 =?us-ascii?Q?CnsenLcwKxL3Ud0NNlwNe4V1679zoeHIprQXfV2DJkwQ9MHDlL30LEsRiRqW?=
 =?us-ascii?Q?4HfVWoUcb7zKn4YDPN7KDh2CWQyb1zLJ8OHeJBch3fZpR2iqKXkS9NraLXN7?=
 =?us-ascii?Q?rGwJvgr12D26LdhdOCHcUkSqKiV3Z87Q8wH3YHktpnRlIC0ybzcXDFT8gGEs?=
 =?us-ascii?Q?PulpP4+ouLxr5orGTPMKXvdNztFKZIiTIzVaOpafKfdEZp9c6fktNVqXRXYe?=
 =?us-ascii?Q?1FA9lyzeY+Z6nSiDChNn4EASao3SBNGvOzYQ+cHvO0xu6r6mJqqJEf1j7Isp?=
 =?us-ascii?Q?LL2eZ7WdmpAgdlOcGuK2GjD/WBGvG/YjZdb1MpHytrzoQlvr8yAuMDpcnl64?=
 =?us-ascii?Q?6+33k9Xjvxdi6MrulPKWI8LyennKvo3o5dCeeF18Au24Gf3hSnR7KWQchcUX?=
 =?us-ascii?Q?dg7o7VC+w0h4Kd1Vif1FeqJI4crUia7Y1cJKOfou?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SQ9lQMifCRpHOodPCsR6A5v1UFlAzb7pvaCbJx0xTLWpzVI8waTF3SXIO+TgkSVvyzPNDXtjceHEpiZTSpx00XgGwcU9uRQ8bLfPrPIoHuXyFj87FPOe0icQIdMK4lL3FVyKIf2i/GzMx3/134xtAiJpNKYdgehtQGDaDGm27kHfSYZa7o4+eaN3zgc8jZzkPC5dUFJ8w5ZnLxaoGufKnWo5V93X3yxXWLOpAXVIycUsy2SGCAwwq2lz+B9hC1dBln7HjsMOehOdtPeda2StVrHBkr8QmV5hUgiO329UhDVuwy3ki5KJwnC8H9SKyJRecDOUAbm9ejsLEkmmIIlNpMKp/gEAaFy/j4oI9PGsK6V+NbRZPz7B4pUpK7R/mUTtNiSOrlG/yzAV8zqE7w5BPUh5bQkBYLDbE+ZwI1EmaA6+CK6aKZ9P3Vdg3tIHYc0JHAhxWeefSKKH4E02uI6/4Q6oEQaxQxQNb2gMYTk6qg1u44LCwrvQ1o9+h8XV8Bb4GO6ZuRAmfsmhVG6MPvs7cXsY7ds5RnsytEbaWhet2Vj0uXSxm9FqCt0v049sOhboB0dI5pbmMHJHQJS1Wu6omcYuRXm+tFh9VoJyt4yiElU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6201c4ba-c5ad-4ad1-b859-08dc966b8ed6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:48.8330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lErgQ8hNTLZp5rIbjqPL4qVoy5VlLDaVOW9fAWBhsN6Hl1n3MSHyaMUD9xQzXr9HR+TcIhX8TLjtIztT/twxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: QG6l1DbPsREjpvzv6lAMG_iz0lT6k-ht
X-Proofpoint-ORIG-GUID: QG6l1DbPsREjpvzv6lAMG_iz0lT6k-ht

From: Eugene Loh <eugene.loh@oracle.com>

Squash to "Use uprobes map to call clauses conditionally"?

Why do we call dt_cg_tramp_copy_regs()?

Why do we copy [%r8+PT_REGS_ARG0] to [%r7+DMST_ARG(0)]?  Can we not
use it in place?

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 43c77fe4..aa605696 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -604,33 +604,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
-/*
- * Copy the given immediate value into the address given by the specified probe
- * argument.
- */
-static void
-copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
-{
-	dt_regset_t	*drp = pcb->pcb_regs;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
-		val));
-
-	if (dt_regset_xalloc_args(drp) == -1)
-		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
-	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
-	dt_regset_xalloc(drp, BPF_REG_0);
-	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
-
-	/* XXX any point error-checking here? What can we possibly do? */
-	dt_regset_free(drp, BPF_REG_0);
-	dt_regset_free_args(drp);
-}
-
 /*
  * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
  * prototype looks like:
@@ -661,7 +634,7 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 * Copy in the first function argument, a pointer value to which
 	 * the is-enabled state of the probe will be written (necessarily
 	 * 1 if this probe is running at all).
-	 */
+	 */ // FIXME why are we doing this?  can't we use it in-place?
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
 	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
@@ -685,10 +658,15 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
 	/*
-	 * If we succeeded, then we use copyout_val() above to assign:
+	 * If we succeeded, then we assign:
 	 *	    *arg0 = 1;
 	 */
-	copyout_val(pcb, DT_LBL_NONE, 1, 0);  // FIXME: This is the only copyout_val() call site... should we just inline it here?
+	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));  // FIXME: Why don't we just copy from %r8+?
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.18.4

