Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3E224FA
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771390976; cv=fail; b=iJL1Gdcg2Mtx9fpgWVfZVLIXIn6IMyM/uzO3eYXf71T4DsJj9aOolpSlMsEMcb6hRr4xXN5PcBJpL6xKqvqa/gdjTxJrnzXGkKcL2Trj4FWCJLqNN2Fx2q3Mm7VPqgwJ9qyT3x6twLag0Dq5YrhOJA13lox7aAekqdymVXKszAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771390976; c=relaxed/simple;
	bh=nIwVmwqZa0Gm+XX0uSNhKrf0KYUfz7Ipe9IAmEdEu4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4XlKnzR7XoG7RZ4945BKdRz3++orrPpqEnkdlZN0FT0VlLA3BtHsUk01y/+9u67IH4WL/biBOdeHRhy8Ir2bEtLEJfN9J0V5r/RQZ49qSFHziTdiKwP2bZpIZYSXwmU5giiK8swNLFUZAof1x1TkVPvQ/HZedWOlQMR+5IypHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XdxYGIk3; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GzdQhlup reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XdxYGIk3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GzdQhlup"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I3d9Ow3675776
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fLlIWoEyzH4fuYt6390KzVrD4yhVy7dv1X0mfPeb77c=; b=
	XdxYGIk3TdaxgkBfFTVt4E6u9nge/Cw1PSlbs8nB+meUmNxJKnsXEAzenuzgRlxr
	Yzev5NLJhJ5WScW6Jd1ZZ28BS+QyUS+YJZ15DqELy3YUtLm5X3DlKZK4cNfhLF7X
	Byn++LAWaxypxOEYjGCjXGrSYvSoPT6BJfrbUUlQ6yaMtYHSoWKxrNffn46zsTp3
	nYOLwE/fZyBOj7R0dAm+6NKhqo9DBpzmc6ws6HA4bFsMnNSA4lFIrdZRd7Jr8m2p
	Ai55yuoKxJ9qCzLzEoyAhlgyAJN55w1gvwsxKBP5ktMaeY19ff6l+WsWgCw/GWtB
	3o+FFMTDv5qIG7iRqOxOIA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0avvp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I2Bmwe033196
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:53 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb20mnvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pcmp8o2MUYF44Tc+BxM8A9P9t3hH9JFPs/Yo8Vt9NuhVnijmE6bWfmQYFlyczCFDMIVX+YiC8qLJt675ltg77Jz9W4PBDybbL6QuuuZ+I2D34pCmNdj7SqVgutEH7GD73ukWudOG7QqVBRya/kRE9RT8/2FJP+F6O8joad5XRvQSi1gp5P1DlHDnPoQpuQQXlCIXW/6+uSIowAWqfAJ3dkND9FqW8As8HAAyrYSOKi8WwOv9qwrObQLfqscLJuOT0ITNRGCxtYGD2uKrTmgMcxSa2sFWSogrzxfUrkoV/2aORJ9sqnU3YfRBlX0y/fADIGoCpQU3ZQsZONT4wU9nmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6jBs1rW3tVk19m0NCswI8F9QqnzoODwitGfR9gOGkM=;
 b=vNdEKz2vELtoF6bXCdHKbkahdX8unFzk96nvGSvWX8efBHlix3/uQzGabGNVTa5Vy02xD+7O9oTannBPdyal3pI7aIBC6LQFV3dnmx+8nEznolZ77p23xs6svuT/nJ/hbQTRZoUm4i09pp3yV6DlNQMXZqnJShGXPhASJ8qSKzwcGNfB49AkxMNaKpQrnZnllztmX08MgDEfFnQhhU96w+2e/bbVv1wXhZ9aK8yx9DC/3Np8+o+DcGJz7chSRvdnXWXc9YSCaaW2SOmuhbEH5R3PbF6wOeQmxuk15G3IXC2EnKRVI6M27jF8Prqs6wFb8pOpAq2mQ7UYrEjQ5hwX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6jBs1rW3tVk19m0NCswI8F9QqnzoODwitGfR9gOGkM=;
 b=GzdQhlupwRS2svl/HaU4vKcUmD9QmAEAp4XcYsSb9kqTC9Q/0AtPKYiWuBTT+dBaRA2HVSxxntNjDBcWkPetHWRFwC5bUpneg5ra/e0AiyA7MUAFQhj2ZSF8TEnFjuFQHweQ7zh/8uD/FTEYfGv9n7ewSz3ltFzLOrmblkGTVjY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BLAPR10MB5170.namprd10.prod.outlook.com (2603:10b6:208:321::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:02:50 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 05:02:50 +0000
Date: Wed, 18 Feb 2026 00:02:48 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] usdt: enforce provider name size limit
Message-ID: <aZVH+PfVQS2CQ6FK@oracle.com>
References: <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
 <0ab52c29-191b-10d7-8fe8-21ba28f807ff@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ab52c29-191b-10d7-8fe8-21ba28f807ff@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BLAPR10MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e5c3a8-0883-4cb3-cb03-08de6eaaf726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gMgzDwmcGQ2fAFUxV3ut3IwZOx7FyddvGB3nL9ojvQqagyiNe9tb96g5Pb?=
 =?iso-8859-1?Q?KStapTXH8Mq8TYH2rzcU/40sZvDDc8l+Vas+SNttL1nS6PjcDmBRdlH2a2?=
 =?iso-8859-1?Q?IdJ0EakTo7mJ0Qyhynocm8rUiab7eu12X2n5cgy8t5zyjwhRmH97Oz2+lI?=
 =?iso-8859-1?Q?BaWTZUzF0tcXquUXaUQqlg6COByclyKFfjlT3h9u6D/KSWKesnUJlLoN04?=
 =?iso-8859-1?Q?XtoQvBwYSX46C6jaJhvYDZ41YyuwazlnGkRkUGH/17mHSZprtgji4pmLJi?=
 =?iso-8859-1?Q?W/xOaacPPkDBPWkH5T9tRb/UnW+a37fRXpE93Q0YTpCIr2OKoYrmRkUHhE?=
 =?iso-8859-1?Q?qZ5wVUh0j88L+mgCstsoCf/mNEUrPcXKTf8uMCoi8YCmXQEsQwKiT9kaqu?=
 =?iso-8859-1?Q?eYTMpzXvb1Ec2lId5B4QZaAFUBABNdO+Pl9xMS4OFM0zlzKHHBFmfNZmjY?=
 =?iso-8859-1?Q?7Vuosh1U5jF1ywg6kabfavpLuhI08yE0sY1SFppRBKHzuX3tNqIgSU5CrM?=
 =?iso-8859-1?Q?Z4okTn7qtJAAZU6pnbmLtOCAGWkqw6q1grFlli9uPs1FtcGteDAHza76Id?=
 =?iso-8859-1?Q?1rQB7q1jol8QjTqy/Dgmosm3uqa0mfTZ6ReMvnRPCRb5aZUjNf2qtcmiWE?=
 =?iso-8859-1?Q?LK1twkbdZ1JKW3d5y/gDw/iQC/G0XMJRepFxePrgo+i8BtuIDAwAB410C4?=
 =?iso-8859-1?Q?c2E7h4TaeQAEnfb+ywIsPAR4OEmrIUVv9DUMrjDUo8XDaxQ83O8bEPhBUl?=
 =?iso-8859-1?Q?KTgtFobpNipqb3HfduJXPD8dLBupOsV1UgoBrxbJ+j06Bd2mA75NCOLP8x?=
 =?iso-8859-1?Q?jWRazvjuZby6uh39eQTRw9zSGQubr/fdK5CGmTuSR+ykrdLQYDU/kX65do?=
 =?iso-8859-1?Q?codXWUXsaz0IuPgLqGBNyY5xJ7l8QrrbRjr8mztsxWEFkt8T3x16tvRUyn?=
 =?iso-8859-1?Q?5ec85LgCF0x4ke8BCU0a5dNTif3IgHodZwnnBcgJmz6S8akBhkqkrYvbYF?=
 =?iso-8859-1?Q?+H18lK52lfyBTOUDCwaemc2AA+1NuP0m2F81GUvor51CfTPVhBuJ3cCAKn?=
 =?iso-8859-1?Q?+AFkKVUFVvc7zCdl0mp9SZoKI2rDXEeuzwt7czzRkccZ168GAcR1eO4DI5?=
 =?iso-8859-1?Q?naSCuwrLA9y3VWyffXZFCSCoEXuQ7TT58sQK7NOTlLEAjJTkuMRb6iTfAj?=
 =?iso-8859-1?Q?3tv6YO7CLFtMm0txBkyCGJUSlCV/nKJm16mciWcB8fatnxXkgkcuCPJVTp?=
 =?iso-8859-1?Q?EE7M1cNAXbzddZHwkNe8rTehFMQEnCT52MLNtASiHI0zMoW96Lqh/eoojy?=
 =?iso-8859-1?Q?ATQr5S8KZrUTglFb1dbg33W6au4pKSYIOGNjjSwppotCGi0hSBZ6ICWIX3?=
 =?iso-8859-1?Q?IpsGkGeFrdi1MsWQ5ltUrkFDjmALFHKdPw24LeimADxwAUSev/iNJ1UT79?=
 =?iso-8859-1?Q?W5DQlxptAsfn2d6ccBwZFfbjFG6ZRROxChZA+Ujf6JOOJ2w1UwjX+r6Mvp?=
 =?iso-8859-1?Q?nj7CR8NfzOsCW2N+IiWO00fuiEKnVoThr79qFbzjJlGxkTs0qH/gduMHaj?=
 =?iso-8859-1?Q?pZQiixENkFxVvMsDEfPXJvyu+gBi8Xc81WWlaac0mpQnqNZ6ozaxy3ZvnD?=
 =?iso-8859-1?Q?Z1TLXGdc3KfB8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ryQElJFmKzaz78mxdYsZ8G0mhYgIB8os/hI5RgaR/NwhqaVmFygi24ZsuC?=
 =?iso-8859-1?Q?qgWx7lwSmzq4/Y5mOVuxm4Uwcs5w0TENDFQiD4ZbEOjTe+YXEkkCbi3560?=
 =?iso-8859-1?Q?ZX3NKNRuR8FStrGhCU3bX/TS+yuJ934mgm2W7KR8b/rCpxLcFNYB574uIX?=
 =?iso-8859-1?Q?e2oH5VcYZwQRIv/vDk29ocEVMp5UjSFPJnPSkuOs89HURM690CNvzQx9CT?=
 =?iso-8859-1?Q?kRI5vtfr59x17PevFOgAzM0LOHMM4VPkU5zNvhPRtFwsgIa0Te+7reJbEp?=
 =?iso-8859-1?Q?BDb6uLFIPOdGEGORQo5hZt+KbJj/XOJQ7w70VR3RjTUBlLgTFq3g3QdW9C?=
 =?iso-8859-1?Q?KavdwZXtGVmGVnUi/YXlB2hwkyYaIaJ8/lIBdK7eqqFDY1BRNMipV/gnVW?=
 =?iso-8859-1?Q?eX7y3IewuIpIlO6jX2+5PUIiFui/+5SlKMAgXisEq8Z8vYcM3I6RAgelIs?=
 =?iso-8859-1?Q?VE8F71XPq/H3q6IC/vI4fy48YVC2TRGVc3PaBUOkPu/Q8FV6fNbGb13l0y?=
 =?iso-8859-1?Q?XHRUyxzmEy9R82FrDh7cyMR1r1FAow6HNv+M+S+lyU65OYFNTRkRkZRtps?=
 =?iso-8859-1?Q?m1KeYu7FGRNIklYju8IumGUXGlAFr5dw2GR+mw0l2Vcp6cf1FzzJ9gHqC1?=
 =?iso-8859-1?Q?MOmJF9EAHvKdeqET5f/q7FWL0EnmhBBwA3TjjmLzAkdZVkd69446ck5jKC?=
 =?iso-8859-1?Q?Grx4shBUK74qtIUyqjnI/BXe4twcdul5Oe5sctwM8cwuPVlIXMYu0M1P4e?=
 =?iso-8859-1?Q?6GZmfvKyaD1uj+HwH8tshK3kWEVsOmb0TMiUVjAhrJuo3n5zpSvm8DloXz?=
 =?iso-8859-1?Q?iaNd/fDIdPj1PIA9jqE7eg2T1gCgIJRV8RF2dxVgoHLd0B4Kajj8kf2iSL?=
 =?iso-8859-1?Q?zkY8zr2rNnHOpM+KFY0Eo+vpwf1jQUIuxyds7i7d5HvVUUozKhxfVF97gC?=
 =?iso-8859-1?Q?cGcBu4Q8wGmTmn5JZbbLiMCtRbYF7QdRS6g1q2gOUIkGXpJ1UE/yEOl6JW?=
 =?iso-8859-1?Q?wZeIEOIRv2EYbNZ3MB5r9pggnCfARRQBFOAQbFzEQd4vw25tLE/VBD5Ycw?=
 =?iso-8859-1?Q?qoL86xZItzbcJHnbtRdQRfH10C/hE3BmYGiDEZEAv05STBjk7jWTUhW7oc?=
 =?iso-8859-1?Q?p6F/y3ZrFvhuQrtf90rCOSd6BeiaBwkVVABxkrglogGU+vRGk5CujafG2L?=
 =?iso-8859-1?Q?CjpSpUT3WZXzZwq2/txMA2RFImRNndK4l4EnjXihcviPfYsFw6ifpvb+DD?=
 =?iso-8859-1?Q?PFtTsNJkmH8fgpD5Rv/9RYQS27+MqruB1f+cV1UvPp/X9ZosShEtsEwpH5?=
 =?iso-8859-1?Q?AmZAK15FKXJI8T2Bd7CXZGOy/KzmeZkRpBATN04LvoxGfzztaW+B9Hk2mQ?=
 =?iso-8859-1?Q?p9T2sK/AM3WtGzQkuxx+BaByv26tBJ3a7JT1HroVWk/bAw+r4HsHJbNXJM?=
 =?iso-8859-1?Q?6JRSeHchTRTdN8jGElrjZmFLB6D1ODkJQ27YwJKMIYcQmV2auL2osZA6eD?=
 =?iso-8859-1?Q?uFYuVVa46gPe3eBlR2QWEGQUaRJ1KN8opXqpqy+guRBCSLLve6rsfFVu5p?=
 =?iso-8859-1?Q?3C/HwuEmDzfhmasw/s6g5Vu4AOTzpw7iegdKhTZ6BHj5iHxqTxO0pm67SR?=
 =?iso-8859-1?Q?AB81nTYYQQZE4dWhEu6fUFhAXC/di1iQ8ZqppwbpChw1p0gC7aKdoNpwzU?=
 =?iso-8859-1?Q?zowbpUXM8X5cYa2PoX8mqlMS4ELEHRnuWY0oXQv8WWee6DyXsODyDNPUJx?=
 =?iso-8859-1?Q?yo7AgJJ6eD/fdwH5D9iGYbxXu18uHxSkpYzqe92TRpfW3tIo0gxwuCgNIu?=
 =?iso-8859-1?Q?qinOTm1IxQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jI+UW1C26Z2r8lI0ztl0EdmB3M0FHReRj45aDeibm5MqX4oOkPE4XNYUL7tadj8uOnWKqdpea8scwAHJGGRqVQRMdz29Divx1rAurlzLB6JAE4ckh2i+mudtVtK2j0k7+uY8eaFGvJxVkMMdakb+qVXYcWL2f5tHFa2iyHDznpUHbNzorH+a5zxBwOrQhRk+1xcRB6pGaXY4wuj+7KkejJZCEdD6vupLOlwYMAvq0x5DJeF1Ucq0NA1VAvY1mpAFp3JwOMjE8QZ3zrVrER3Q3BGi9+QwxWybh+zfWeFPoThKjGzcAOyYxeP4VtH8036c9+xqudxzJH3z5azJ4HaIbYUDJ2mmyjvkPGMcY2HAK1mJ+L7YPYCQYc/VhPKyjBQki26M32mwFmDC2/ectWeKYG7Li5HLR21fessGoZj+wEkPtJzt71FPFgLM86aQy6mn6xLrDp0jCoR9ixKNPiQp2zrmKVoTeyYBSIUV1FpnYaZbOkKRZ9yT8xRw3OMNVjPL3ureZUVMp7Es5MJM9HhxTxw14VQEqC3O9XsL1FVrHTOMOze9O6jTQ/CWQ9cvMqDipAweDpEx8E5ngDYOFHsl7Q5w03As7Mpti2pVZkJAPfo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5c3a8-0883-4cb3-cb03-08de6eaaf726
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:02:50.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pA6d2nHmHP+ydjLl4uqrMHEwYjA8oSbSXwTxve8dcjDqHX9qBkhivO0TVaRu3QLbSsXHFNDhvtBZw4WKwFn0Q+Bg5roudAEO2DDUnC6Ey5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180041
X-Proofpoint-GUID: xUUsJuS2ogu0RJ9Q-1ija34HBaUAQRMA
X-Proofpoint-ORIG-GUID: xUUsJuS2ogu0RJ9Q-1ija34HBaUAQRMA
X-Authority-Analysis: v=2.4 cv=UsVu9uwB c=1 sm=1 tr=0 ts=699547fe cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=oTCggHKfa9XTlaMJGT4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MiBTYWx0ZWRfXxtuWGeUPs2ji
 I/dIJG+LiM+MkVN56cLeqLS4c7zrj4cW72EklvhgZOehU27Tgr4sCCx+XKkC299SPHoq4tU6lHL
 4IntgdIaZCdseA9kt3vvsKV123pQJTdftxiPMzAU2TMfKIh8LnF0nsNqgim+on2tqVwxK8C96+g
 bLDjp9/OY9ZMgmZNdeJ2UohHgkppoyMmhR6z9+QdusIISPYdY3nRdy/qRIL4qT994BUDzYzcRol
 jmZjdemttKlo/065k9ER99Cyk8+n6PSnft5YqFQo+5Dr0/YkEAixD8CUHGrSGe7DTHzXGPQmsxN
 pTWCq75B/xFZ/1CFxfch9qqjJWCMz7+P3UVXwmKYYUSv4YqFefXWmmmwnAYnzA+ozg0b39P7stL
 fPngBhtC8ydMiK+k4jPH9BJTyoPIomQdj/mBMBbP0cSz8m9c+8HJffu+PJ0N2CK1E0OezvxdNQM
 eUBVypinBzMnrr0rVpg==

On Tue, Feb 17, 2026 at 02:36:22PM -0500, Eugene Loh wrote:
> Just going through the rest of the patch:
> 
> *)  Stylistically, in note_add_provider(), instead of having "- 10 - 1" in
> one place and "-11" in another, how about sitting to one form.

Sure.

> *)  In the commit message, maybe add:  "Also, add error handling for
> note_add_version() and note_add_utsname() while we are at it."  Or something
> like that.  Just a head nod to the fact that some of the changes are
> incidental to the patch.

Sure.

> On 2/17/26 14:21, Eugene Loh wrote:
> > I'd like to understand this patch better.  In particular, in what sense
> > can a PID take up to 10 chars?  What if it isn't that wide? If by
> > coincidence all my PIDs just happen to be narrower, why must my provider
> > name make space for a PID I'll never see.  IIUC, a PID will "typically"
> > (whatever that means) not exceed 32768, well, or maybe 4194304.  So I
> > might even be guaranteed that my PIDs will be shorter than 10 chars.
> > 
> > On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
> > > Since USDT provider names have a PID appended to them, the base provider
> > > name cannot be longer than 53 characters (PID can take up to 10 chars).
> > > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   libdtrace/dt_link.c                     | 24 ++++++++++++---
> > >   test/unittest/usdt/err.prov-too-long.r  |  3 ++
> > >   test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
> > >   3 files changed, 63 insertions(+), 5 deletions(-)
> > >   create mode 100644 test/unittest/usdt/err.prov-too-long.r
> > >   create mode 100755 test/unittest/usdt/err.prov-too-long.sh
> > > 
> > > diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> > > index ffa16d9a..e77f06f7 100644
> > > --- a/libdtrace/dt_link.c
> > > +++ b/libdtrace/dt_link.c
> > > @@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt,
> > > dt_provider_t *pvp)
> > >       usdt->base = ALIGN(usdt->base + usdt->size, 4);
> > >       usdt->size = 0;
> > >   +    /* Ensure there is enough space in the provider name for the
> > > PID. */
> > >       len = strlen(pvp->desc.dtvd_name);
> > > +    if (len > DTRACE_PROVNAMELEN - 10 - 1)
> > > +        return dt_link_error(usdt->dtp, NULL, -1,
> > > +                     "USDT provider name may not exceed %d "
> > > +                     "characters: %s\n",
> > > +                     DTRACE_PROVNAMELEN - 11,
> > > +                     pvp->desc.dtvd_name);
> > > +
> > >       sz = PROV_NOTE_HEADSZ +
> > >            ALIGN(len + 1, 4) +    /* provider name */
> > >            6 * sizeof(uint32_t);    /* stability attributes */
> > > @@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t
> > > *pgp, int fd, uint_t flags)
> > >       shdr->sh_addralign = sizeof(char);
> > >         /* Add the provider definitions. */
> > > -    while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
> > > -        note_add_provider(usdt, pvp);
> > > +    while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> > > +        if (note_add_provider(usdt, pvp) == -1)
> > > +            goto fail;
> > > +    }
> > >         if (!(flags & DTRACE_D_STRIP)) {
> > > -        note_add_version(usdt);
> > > -        note_add_utsname(usdt);
> > > +        if (note_add_version(usdt) == -1)
> > > +            goto fail;
> > > +        if (note_add_utsname(usdt) == -1)
> > > +            goto fail;
> > >       }
> > >         dt_free(dtp, usdt);
> > > @@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp,
> > > dtrace_prog_t *pgp, uint_t dflags,
> > >       if (!dtp->dt_lazyload)
> > >           unlink(file);
> > >   -    create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> > > +    ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> > > +    if (ret == -1)
> > > +        goto done;
> > >         if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
> > >           return dt_link_error(dtp, NULL, -1,
> > > diff --git a/test/unittest/usdt/err.prov-too-long.r
> > > b/test/unittest/usdt/err.prov-too-long.r
> > > new file mode 100644
> > > index 00000000..1305f434
> > > --- /dev/null
> > > +++ b/test/unittest/usdt/err.prov-too-long.r
> > > @@ -0,0 +1,3 @@
> > > +-- @@stderr --
> > > +dtrace: failed to link script prov: USDT provider name may not
> > > exceed 53 characters:
> > > test_12345678901234567890123456789012345678901234_prov
> > > +failed to create DOF
> > > diff --git a/test/unittest/usdt/err.prov-too-long.sh
> > > b/test/unittest/usdt/err.prov-too-long.sh
> > > new file mode 100755
> > > index 00000000..599e461e
> > > --- /dev/null
> > > +++ b/test/unittest/usdt/err.prov-too-long.sh
> > > @@ -0,0 +1,41 @@
> > > +#!/bin/bash
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights
> > > reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +# Ensure that provider names longer than 53 chars are rejected at
> > > link time.
> > > +
> > > +if [ $# != 1 ]; then
> > > +    echo expected one argument: '<'dtrace-path'>'
> > > +    exit 2
> > > +fi
> > > +
> > > +
> > > +dtrace=$1
> > > +
> > > +DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
> > > +mkdir -p $DIRNAME
> > > +cd $DIRNAME
> > > +
> > > +cat > prov.d <<EOF
> > > +/* Provider name is 53 chars long */
> > > +provider test_1234567890123456789012345678901234567890123_prov {
> > > +    probe go();
> > > +};
> > > +/* Provider name is 54 chars long */
> > > +provider test_12345678901234567890123456789012345678901234_prov {
> > > +    probe go();
> > > +};
> > > +EOF
> > > +
> > > +$dtrace $dt_flags -G -s prov.d
> > > +if [ $? -ne 0 ]; then
> > > +    echo "failed to create DOF" >& 2
> > > +    exit 1
> > > +fi
> > > +
> > > +echo "DOF creation should have failed" >& 2
> > > +exit 0
