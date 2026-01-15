Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1B932572D
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511490; cv=fail; b=Uzjy/E5FM96RkTxenL1G8r7ifuZabtna9B2laKKA5FUPfpnDMfB6JJGrYAb02pUyR3eX4C7l3nWsDsAL0IoTOwrpD163fSyDW9Mtkea/D68L9U1a9ROZM6+vy8icdPfTFLlgXGd3AbZU+lThTpaMrVp2+cfbRrtIyOrXYxwT/gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511490; c=relaxed/simple;
	bh=Zz0ymYr/APKRfTt+3pg66ia3G6fdfzqaPloBRwYE0NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PFo02Z7NbMays/BbJrdQ0j5drSjEscuufv5VjBlujRO3s7OZPqJhuWylt282UqqJKYibM+GxSBh01DgJMJSJwREhJaehMe9MhIl8T1YWNuxtZ8MelIE+VzUpeI7tRH88sxGH/Pjjli110MZYETNPhonvkSaNVksSsJKab1LtOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dzPPBqkw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tan9hsqc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dzPPBqkw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tan9hsqc"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FDN2FN654678
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WdIlBeqQ6IrRRP9AhL
	uw3bz5qXH5yF/eHDchDj43258=; b=dzPPBqkwDfHoeN5vIFlBehFMkeFwa2J71C
	JpjnZTl9krCfvDbu4quIUBnIMMeRoBFIjWyFRltS01Sec8sBj3bZKp9GKQODNJkg
	a/7PXVJabS3jR4XgNhT20lgWjZJL9DWo3PxxOPOOlvwCiwO6afGmJP9CrQUurNoU
	o8pQAaf3O0gnXz7p8pDIAf6zwE9fliWbZnPgNA6+jNIFafwt132zPSu94uGgos7M
	uYL1Y/NtofXlgbfTPaHFOYmzUlw+zey+zZtoO62yl3rfVqlySKaSwJ/57FEtfmNd
	FhmPyUFB9Vhd1zpzI+PoPf9EBxMDWWVD84AvKgRUqi0jrF5XdvXA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq58pdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:11:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FKplJm009536
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:11:22 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7fmad3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgTJy9NOYUqDWosVj12L8e1/2X7CChNB4U/YPEC//hjMVMjMpNkgv1r1zEEDBjURAkTerowVKhTCyObgBsyjP99ZavPtQdwJgtR3zRgoGE8kEH4Xou7bS0D9PiN3Ft2PObND/cR2SwlgRGinOSxcthVDwBJNyCA/t/lI5dN7Lq8WOdNri+bzfshA01U0Gk3v/CapdYqQQPdWQmJmA3Uh9Lv88Md+7J5J+39foEEYWQ4ODJ35PpkTuAl0OYVvgFRkjuC/Iysj3P0cg4HMrrI0BaPxPFibQDH333fkHOpqd6FDIUT1x7mfdf/U+BfzpYhXz+p4gLyif9OIIbvk37uiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdIlBeqQ6IrRRP9AhLuw3bz5qXH5yF/eHDchDj43258=;
 b=d8KEuBvsMt2QYv7iCzGw9E5NAsupKkkvJ176lZ3qgVeWw7eL5gyiqlrtqyOBowu2Y8cc7+5xhmYOHywQBNLZ6REbpVZ9P+epP5AByfsB4mTsuGbe9F09ofLTx5AQixgpjtDZmSAC9qZrHXRhLwxcbnIsrALbTJkdngl6l56sZD4ErTBD07WK7flOTDKDe/pS1MHDTONRx/XVbplBBVTZzpIKASvHIZz9xUnn7Ct7zw+DTRQYOl8l33eSUZIxo4TBBXtYImXVAhCIAJWG43/O+HA4NAl4coMm4xvZ8CYbyJq+Hbm8Li+BovZQrWkEwrbE9MYZEhEnb5QjBUYiUAIBMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdIlBeqQ6IrRRP9AhLuw3bz5qXH5yF/eHDchDj43258=;
 b=tan9hsqc9ysDiOMU8opcMKsAO7vvJSlBiFDnQNwWtA3o93KCMak2H1kzImr0UIL1qPiaDtkVWo5fRc7G9WrQGukU340yqDe/yp0zZ6oAnq9R51khZDVuyD+gMkvtsU7O/fS9tJmav4g7n+tQcjXAKKgTvQzYTxBCAd6RGYqWi0A=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6108.namprd10.prod.outlook.com (2603:10b6:510:1f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 21:11:18 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:11:17 +0000
Date: Thu, 15 Jan 2026 16:11:15 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix printf formatting with non-monetary grouping chars
Message-ID: <aWlX80aurcpZCRhr@oracle.com>
References: <20260114211018.23412-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211018.23412-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 010cf4ee-e588-4972-1d5e-08de547a9fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5kNuS1hjQ4r7XwV0vd7iw/kmbnpa39VPToNvMNYu8/FEBbTmfhV+bJ7b9Gzk?=
 =?us-ascii?Q?HsLbmtmkx2ewa4WYjs7LJGQyu4JDnTVCil6ebfObFSyjZ10AxJp+h50oqMy0?=
 =?us-ascii?Q?rsnlN8UEfLyNNvvx8rrdCNW+rAWKzGgTMbG6W4F1nh4EuatUNs+4DklRdEvz?=
 =?us-ascii?Q?44aiR3/ldBP8HbMylcYextAf1CmZh/AydJRBuvUNkwf3IDjOdz8pqaAE6yoL?=
 =?us-ascii?Q?sFlKd9z2mwPTgJLf2L/90ya3AVCyYWrmZ8Jwj+k8GWpKQ0yetFHgjWGqKnhl?=
 =?us-ascii?Q?ldCRG4cLPTXVfRecakogwnifC9BfAsp1D3Q7+MXW2kHvgjXojcpKW2b+Njdr?=
 =?us-ascii?Q?VivJpEeeeb/7rpVrsS7i06N63BCEkgXyVyOIGIC76BTwTRsrgcl5MnehnMQy?=
 =?us-ascii?Q?NN6l4x3JMPSMfBBrjMq5FZXOeZrJyfcl8CS2kK9dxQp5yXF5qkQtrtyAAJY1?=
 =?us-ascii?Q?zPfbXK7uvgeo6jCJbeXQbQ/jYHBguGwd8quJky/D37jXLrhOCL1EIehDSIm8?=
 =?us-ascii?Q?8umXSkVf7zqJTGyREsBRJqwHKwnyz1eaYZRGcCpGGbierYr0LTNNgTdTyOtJ?=
 =?us-ascii?Q?8uec5uogtvew66FXgCs8pou6bTsS0R0CvNpz57MfmQPa6L1T7lbTnlnPKNzj?=
 =?us-ascii?Q?kYFyFWB8kta3VJeDP47knoPmSFIkYchTN1oSfDtFnOzhppZfckz43M/FAXZ5?=
 =?us-ascii?Q?D4DyaTL2SGzPOHSwn8r1WnjJm8mzu4Vt7UmooFf1k68/hD48bBt9UQ3chcfC?=
 =?us-ascii?Q?ia+lhhkO6FKYL+iVIV7FIGiQLxPt8RdHH2B4aGyy7gcKdrMss+431jW9md3O?=
 =?us-ascii?Q?E3SYL1wRgEWPbdx7coW3YP+1Zz1l9H3ConCNYT571TrxTT+zhrWJZUOX5rUg?=
 =?us-ascii?Q?41XqhmoVc4qynS8Q+R4DIhkAP5LTxnMj16wxLPk1lHTIkuo3dkU1svBwMxcZ?=
 =?us-ascii?Q?WaVVv9N9+I1f81+eC6mZM53Xn+ILL+2Oy0M2XyYv1T+u0w/Y7NrG68OyFc6h?=
 =?us-ascii?Q?SAXNVKC8fXdMIS3Lkkc3BOVEvulkQXN4/6eSA5zTg8Q8BDAqGW0ATzCdnMBE?=
 =?us-ascii?Q?fr/mmU7eUaSstnbbpFNjQH0S4521vJGDWdFPTc0QJBlALjIg3wZnt7z3nzdf?=
 =?us-ascii?Q?oZc3Mp/5BVqvEkH0vnVxpYVHE1YYvmtW6jFrPw8e2F4m3fHEudtgjc9GhVfS?=
 =?us-ascii?Q?DsENKlE7T+o+ewPzwqBFCpos1naNQrAryoX4l/SOi/ZdrWf1t9gd3LLTDx+t?=
 =?us-ascii?Q?xfD4g4QoaVM7I2N928jaHdllDimelSXOKdCdl3KGpDaPLu2874sggEr2kfKH?=
 =?us-ascii?Q?O9VAsAEu0dv0szUhp4NYel3ox4nqtjnQ3Agr4WimPWdfRlM12qaltmpaxUW0?=
 =?us-ascii?Q?zeLij7lROFVf7LQRjzpbjB4gb2uQxGYocJYBTPRXF6U1ZnPSA6r5Nh23IIOZ?=
 =?us-ascii?Q?ez2BWjISK/CtfQRS1Gge2cKUxnZIoWOe7fs1OekAlxhCLoHKlbJ+xqMXqaB0?=
 =?us-ascii?Q?OLNSBU1eQt76PsX9Rm9TINzVnVZl8M4wpJUOiMrYoZp0WrXbrepW6g6bDn5Y?=
 =?us-ascii?Q?pCpcA7f+zNCekTQmvIjph/7WUbKD80JR8WHv9jR2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VW1eNH/4Lu+BJRux54ezkJDWnJ/Qp4/PUAri8t1pO7ItnHJjJVM1AOT7QtqD?=
 =?us-ascii?Q?KBViezR/sUT77epl7U8z6cy9sQADtnsCWn5kIJwNLpEAJ9i7Jj7bLrfehwa4?=
 =?us-ascii?Q?0NwC6Iauc1p1+TjTo/RKWS7MLEDn9OJfjGzROUFFD7r91+5fau1N7jrIt1O1?=
 =?us-ascii?Q?LlqZ51RUf9K6CgWWnBg96udSzvxrc7GZwxtHxze3jvMsXlSGFatSuOwcA74N?=
 =?us-ascii?Q?6WuGlo++IV5E5IziWhw8UWjlBgoej3Tmx9p2iNKGWB4FOhI0iR9QTOHyorO+?=
 =?us-ascii?Q?q/fDACyGrmqz0qggiCxLJBviD2FDcQB/Mbl1R+W9xmNH2Vb492JTqiXrv+0J?=
 =?us-ascii?Q?hDdIRpy/nntwrpZtQvUdLRfIxlFdC94yQD1zI6kuMk2BOySu+Vb/5k5sCX13?=
 =?us-ascii?Q?kIT9KKQsil1Sr8oOF+Qcpq4DZZq3k1Y0qIXGgu9lGnfarHw9koVmvUM2u/xi?=
 =?us-ascii?Q?QWf6oBSmdpVMfOeu4QNB1UmBIqko8HE/MT0ACWB0pyWwTU+kZHkhQ3gMeANB?=
 =?us-ascii?Q?WWEr5q4SGRMEUtbPIUMupx7ua7Ga6Jvojsja4wqZdPemCAXfrBOML57TYBxN?=
 =?us-ascii?Q?1qNNw4j8zvrtYFMgwbUMEsbpms+SbN4bu+3WE5OF2J0HbaEUqAgMkhu/sIbv?=
 =?us-ascii?Q?ukmp3f3ujZIMapuE3fh35RQdElcw/fyrpQ7VQ/uRcbHoIRnpQ6H1MPbhR881?=
 =?us-ascii?Q?+cuikWd+tDv8HxEb7uIc5C3RMoWZmh3m6p6qJWYC6ZrjbhWlggJI+j8Jobja?=
 =?us-ascii?Q?3Kc3dixhW2FV1KNIn8SCT+UtUylAWQ/Z399ALawtr7ZS4XoFY9rW67gQEt+S?=
 =?us-ascii?Q?yYRyFP7jcbk0SPGRFsTFYxkQT7TLJcyLsFphG5VTaFJyyUjAfY18W4p/notZ?=
 =?us-ascii?Q?TspUEv/4tJw/bJ3m63rq12D2rOmS13AUZPRW9T6yWur+wVNlcm6GUUpV4uVv?=
 =?us-ascii?Q?nNsyVGe+zM4YQrhAId6D3zs+MEB3rmwezhjYY8kNGBeVAculf9gu6b2i+ovV?=
 =?us-ascii?Q?gnJcI5wX89Zp1friDJGn8SjI3BWmVVyaNmQL7KRtVrEx6E5zLwpq0vEvGTLb?=
 =?us-ascii?Q?U2214sp4dDPSGchjFunsZqeZLbUUOO5/JBOaXUSaRxADy8wI6peJdP8fuABW?=
 =?us-ascii?Q?trPWZNcNVx23RpewMRYhRkLZXFX5gXz+iRPX0xsc/4YdT9kHCY5rJjy9TXJ1?=
 =?us-ascii?Q?seOhBzq1c6oXCg4KZ3gx7eINCByNwOSc0SF1PR/Rh9SXe8DTQWFrMC55/l0o?=
 =?us-ascii?Q?CJB8xgYTB0er6pkVtG/ygnIFgwEIAAs5WCVilZfhYh/kw2LPxLPBVZFQzSa1?=
 =?us-ascii?Q?vOnSahPDKBhgy75IACy/ndzX2+TRfEDS530CZIjkmaygYBAakC7nIIadEzqL?=
 =?us-ascii?Q?wJ4qyQ7UmUktLbl/khwp+z0wst+C7Wqp3B8npEWPZpNVqw+v8qWODh+XxiED?=
 =?us-ascii?Q?ljUgqZVqHPUZFyyb0Pnql1WS3BiuPhfrxy6ltcrzTK8HmV20hfzYTRQOTVia?=
 =?us-ascii?Q?l1yGRtNJyDD5IiCcD7h4su6YrDa9YlwXuDoW8ztIVyBZsPHsh3dl8mARNlbL?=
 =?us-ascii?Q?5QBemAFWvXNC3c2fScnWDPRtl2vyn9OipY9NM5pL/mSbZnTNp5GDT2oLgjm3?=
 =?us-ascii?Q?ACxyhhADmXyGyV8QhMLUmj7jtYNi+LloG9JdGiSdiANZLUiMt7GKrG6aj+58?=
 =?us-ascii?Q?j5AGvln0g3HGJB5/QZ3AyS3RZ0usYHbqmcwTP55aSMqRkzGGw/wOgbBjw+Z/?=
 =?us-ascii?Q?dWV/QJnKxw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7tyEEmQb/MzqR9Q6CMsDewcZ47ZwPXHzUIYffQ/3svOlPP9YQeXMkG4QxEaX+2KBVgEjMPchY6ZmzxCwuRXpcHLc7bRfVF9PkKfotdcXAlDCeXloPB7BZN7W2PbSo0xNfsRB8X65ffvgd9SBOVOxu5hYW+CIZbkTbEYArPlb4mSerjVjJrfoyDGxv7kFiPr2Y9Awrc1kdlHmfzcdyjucQaNtAOIVmbYqb5AWb4TaMWuAhk+WkDe5B8z1I/UDspt/r7rD0cDCHlLdHvJVJIcG7/WhvL6bol+joNFQGJinEX3VVh4tWcMGCnrizDL2nFCsxCBua+xfsQc//kkl7rEktMlsbehAAhYroKfzS5fInmFaGpVlcT9XYUfuy60l0d/hfhU6n451TkHYYkqCtmdZkEg4mb9SNCmAKmY0LAc19nNkv4MfNYmb/bfPbB5IFeOIlcDb1/9+NmfEf8m7ixotQzIGQB7h1TA7mUmcXSLffq/catFD10vj0koo9V7/cg7LVM9jfotnLj398eajClLWcTqbFrs4RQzOfy924m/7k19j3LTCf0JTJ9IAmt/5aWha6bDUTdXjfZ8otu5FFGWhQpZoOlbHat00beoi9q67BNY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010cf4ee-e588-4972-1d5e-08de547a9fb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:11:17.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SJgf0uI5XEtUNcveqYMKAgCSgYsrYP4aAwpRGFydYRP2x7C+CNuwAugg4QWUgVbK8Jiom9BrVSzdy52lFiQZn4LDzyaEozrceri1ta285w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6108
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150166
X-Proofpoint-ORIG-GUID: k9NS9jucUsycwVTgv5o67_cgqVkweka3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NiBTYWx0ZWRfXzNcBBoFlMXPz
 SrwE6UYFDyuXcE4xTMXeljuhqwEcGxxagsQrVvWs7DChHiLiK+lj2I6VNMcAxn/49XuVN2GQDCJ
 /RQj9B5g/kipVK+kCPo3S9v+6gHQnetMTFrdQW3+MsvlGeuo+Ho7F1c0FysovFQUtgr1/nPCihp
 EaTjpxQVZaRfpbkuSMrnNlVJzc44ykFDKKWSIP9Sn+9nOBeQtG6Vy15twMIhK75hZ1zRTxj65SD
 yX680hzJyhejD9jq65ur5FHUFN7cVRrcRRYA5NjGB6qCFg40J8zpSs369qteDq9ACLIgfk3no1S
 X1KRqvGCH/c814AnF1Pysg2lCdIeV1tqcRr8qbUaaLDZHz8WLnDdE+EdScj4uHlFTmXuA17wvsd
 KYG/HcFyZMw/b6t18T1/GhNJ8vHmR/ow7ihwJ2VuRMtVF1xS+qgLTMNrIytb02OB9dvkm2NGi3j
 2iIwuBl+buTc5n1ZjLYRgGHf7qRRW6O7UwEedqco=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696957fb b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=vPOaHPWTFOf7KfBsHq0A:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654
X-Proofpoint-GUID: k9NS9jucUsycwVTgv5o67_cgqVkweka3

One small change I overlooked in my previous review.  See at end of email...

On Wed, Jan 14, 2026 at 04:10:18PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Non-monetary grouping characters are used to separate groups of digits
> in numbers that are not monetary values.  DTrace used to document
> support for printf formatting, using a single quote, for such grouping.
> Currently, support is largely implemented, but simply not working.
> 
> Add a setlocale() call to pick LC_NUMERIC up from environment variables.
> 
> Orabug: 30430270
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  cmd/dtrace.c                                  |  5 +++-
>  test/unittest/printf/tst.grouping-LC_ALL.r    |  5 ++++
>  test/unittest/printf/tst.grouping-LC_ALL.sh   | 29 +++++++++++++++++++
>  test/unittest/printf/tst.grouping-LC_ALL.x    | 13 +++++++++
>  .../unittest/printf/tst.grouping-LC_NUMERIC.r |  5 ++++
>  .../printf/tst.grouping-LC_NUMERIC.sh         | 29 +++++++++++++++++++
>  .../unittest/printf/tst.grouping-LC_NUMERIC.x | 13 +++++++++
>  7 files changed, 98 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/printf/tst.grouping-LC_ALL.r
>  create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.sh
>  create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.x
>  create mode 100644 test/unittest/printf/tst.grouping-LC_NUMERIC.r
>  create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.sh
>  create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.x
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index baa73e9d7..6cd7aeadb 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,6 +9,7 @@
>  #include <sys/stat.h>
>  #include <sys/wait.h>
>  #include <sys/compiler.h>
> +#include <locale.h>
>  
>  #include <dtrace.h>
>  #include <stdlib.h>
> @@ -924,6 +925,8 @@ main(int argc, char *argv[])
>  	pid_t pid;
>  	struct dtrace_proc *proc;
>  
> +	setlocale(LC_NUMERIC, "");
> +
>  	g_ofp = stdout;
>  
>  	g_pname = basename(argv[0]);
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.r b/test/unittest/printf/tst.grouping-LC_ALL.r
> new file mode 100644
> index 000000000..077a0b7f9
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.r
> @@ -0,0 +1,5 @@
> +123456789
> +
> +123,456,789
> +
> +success
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.sh b/test/unittest/printf/tst.grouping-LC_ALL.sh
> new file mode 100755
> index 000000000..13b953758
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for mylocale in C en_US.UTF-8; do
> +	export LC_ALL=$mylocale
> +
> +	$dtrace $dt_flags -qs /dev/stdin << EOF
> +	BEGIN
> +	{
> +		printf("%'d\n", 123456789);
> +		exit(0);
> +	}
> +EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		locale
> +		exit 1
> +	fi
> +done
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/printf/tst.grouping-LC_ALL.x b/test/unittest/printf/tst.grouping-LC_ALL.x
> new file mode 100755
> index 000000000..9993fbcd3
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_ALL.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +if locale -a | grep en_US.utf8 ; then
> +	exit 0
> +fi
> +
> +echo install glibc-langpack-en yum package for this test
> +exit 2
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.r b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
> new file mode 100644
> index 000000000..077a0b7f9
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
> @@ -0,0 +1,5 @@
> +123456789
> +
> +123,456,789
> +
> +success
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.sh b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
> new file mode 100755
> index 000000000..656fd83c1
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
> @@ -0,0 +1,29 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for mylocale in C en_US.UTF-8; do
> +	export LC_NUMERIC=$mylocale
> +
> +	$dtrace $dt_flags -qs /dev/stdin << EOF
> +	BEGIN
> +	{
> +		printf("%'d\n", 123456789);
> +		exit(0);
> +	}
> +EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		locale
> +		exit 1
> +	fi
> +done
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.x b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
> new file mode 100755
> index 000000000..9993fbcd3
> --- /dev/null
> +++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +if locale -a | grep en_US.utf8 ; then
> +	exit 0
> +fi
> +
> +echo install glibc-langpack-en yum package for this test
> +exit 2
> -- 
> 2.47.3
> 

Here and in tst.grouping-LC_ALL.x, mentioning a reference to a specific package
is not generally helpful because other distros do not use yum and the locale
data is provided by other packages.  Perhaps just mention that the en.US.utf8
locale cannot be found?

Also, you test for en_US.utf8 here but set LC_ALL and LC_NUMERIC to en_US.UTF-8.
Perhaps one or the other should be used consistently?
