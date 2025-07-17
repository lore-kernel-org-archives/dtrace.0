Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABF1925BC
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752776480; cv=fail; b=nuwBj/Z9wo3k4C5tc23bC7wp9GFX+TVGn0pIpMwZ3lDVTGuHzaq6LJTJ6kPYS9gEWU535Ip++PTQiBfCZ8Ry1yRTtmj1u8IjiCfiWuUB5/EXEhiY6C/UmtcG7T2mu9HFiTnrD5zypIccNtVbSYtK79G51w9fnBi3CWY/HZt+uyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752776480; c=relaxed/simple;
	bh=3aAfezOzkyjfSoBEu89GgB73dlXWE+4dCzoch3geP00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OvQqj3PaVP+P1Gq+eyaC1ny1U6W+vPz31qrdFzdYGWDhG6gV5mVsth/GW0exMEjEcUZsRiq2nLXgGyqAHQcRyQbEPcC1yh7Ayk9Zv17W28G8/0tMv+tN4gUOOLY6LzNGnPNXMokYOL8UdoqRsFqLI5qY44sPbbcvVAZX9gIPymU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BYyCdJLy; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KMymq1Vi reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BYyCdJLy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KMymq1Vi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HH0vle013937
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qliKRge7NdKfSUckFk0bT/vTp65TLKEYDdVhI1X9RwY=; b=
	BYyCdJLy5LxBdOnSnIFymTuG8yp/IG8KcBTw16GgeqH/nSqCOqTu24fSV9XwW94M
	/E4yPVQkUxWgHrxfQzRtlSGUyVfU+fRibiLNfGOWvCZrT/ve7uhXZWRzkWLBre/e
	urXVCDxQXrtPSmXNi8A3YZ8pJHbTRP9z3KlXbrJVSVIfQttbVHz59wVNmy4IMchH
	9SHW94aJ7sGuQgEV0rro9R+p9LYvlcr1r2CVs7CZx2u4yk661E+O+0EFNp8HVptG
	Mf1PeWT188CfMZUxsyG+jfq5x5t7vFEh2UsDpyL3UYBG+pZP5BR0LRp+jUBf+MvN
	FOeT8UXBchOqGblvFsgA4A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g3sqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:21:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56HH0GKM039704
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:21:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5d54ju-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 18:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdsZYE7r0w+aVcy73kGjm3wTqXbXVeni0uqVD3gvyY3Vw3csci8+OyOLSK/aiOdDm0O1r2BehjbGW9i8T0NRt5ni4T6Q1nKk3ij4oRNnwGTycqtqvCks2aGMe6BgyOALQHNnutqJ8qF1EztE8BQ0nRzmFJqzVtTVJYBPjEJADnG0jsPy8u/L2TXp5OHi8X17ExML0VTY/afpsk2sv6+Bo79dCsOplIqFWN34I86rPRrrQ2gDCRvnqoy0FT/3hH1BM+p6JDvRzwaq++EMLjTRvpxt7yTNECoYbILXbkJIXSashFw0bL5qY1wsnrBvnVKpyJFBA6aznXUNnYmhTcBk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfw5BVmQWPGPVCG6bMi1R6ZBXWlYXlIUZaiPRZcCcYY=;
 b=WzAQBYAyoTa0JDXDkaiCreI5jf5HZyYEKRimTeey4EyweJvVyX0569AysV4Snkti5Ov9JJfGo5UfYGM919MjJ2H2gLlkHcDjwKgGjsrBu2OPokT58bEa9y+vBe/eGAaXHBLF6K1eIxTaFXveNkB2k0q59BjoN9+wBLkMQHmDXisIZomvuM5/nQMLqSmGd8HXC01zm5X1GAHngDz5jpbNyc1SLiICrt4CXeyeAMoktAjxleMrgLr2UlW1K+jw+NQMCYvEQdbSt/+kv2fKFz8YlG26lqgxPq6lJYYjOKrDm4L7sGrvV52jstrL+Y6E94nbgvc+jhU58UhTeLiZh1T0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfw5BVmQWPGPVCG6bMi1R6ZBXWlYXlIUZaiPRZcCcYY=;
 b=KMymq1ViGq/EzjHyITPOUjSAWbxzziovxbz6ZvrxafqAPW5CPM2BeO+1B7SrLJw3Rtxnj9woVvG0Iik/XyM+FRylAKK8U8rkJ3hYeeQvYYtQ+iGUA91foVlqvWlGdRpoDMAj1UDlQiBJJ1mCYFVK2VCPCkZ1q2P9na0sBm77eJs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8590.namprd10.prod.outlook.com (2603:10b6:208:57b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 18:20:59 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 18:20:59 +0000
Date: Thu, 17 Jul 2025 14:20:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Message-ID: <aHk/CIBVzCdVXEpJ@oracle.com>
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
 <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
 <aHhCUiaKDLU9CHEk@oracle.com>
 <9fe85ab0-3a7d-626c-b382-0392c55e7502@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe85ab0-3a7d-626c-b382-0392c55e7502@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e689b69-b554-4b9a-9f55-08ddc55eade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Nri/EfURcPTn/nx0Liq7HcOLrdHK5goaIS05HSzcK2N8CA5gqWV1uPU/SK?=
 =?iso-8859-1?Q?gwpswboMQJ9x/SA+vFsk7E0807geuCmitG8zB1/voQTPY4w4tYVWhxETko?=
 =?iso-8859-1?Q?DkcKaOaSovcz0hkAIJ+WCWSaxdG2UsxsQWMTX9OAMNQ7Rqkl7J671o5MT1?=
 =?iso-8859-1?Q?TeUrOHxFdSZCZoXBbsWljJM5gxrgo+MvppFjGfeF37gVme/ImY/GqaSi+0?=
 =?iso-8859-1?Q?2Ml3//LmVIZbNLWpD5Rs0xqHQKokUiD50RagnapmpU6jAj8kZOpyH/eTkc?=
 =?iso-8859-1?Q?toeLVGAyoKDYGFo6Euk1X0CtadSaBaelSvbO6fdbmGVOEdzigovOWeFqZ4?=
 =?iso-8859-1?Q?wJJw9lCYax7pOzOquLfno4HwiJ8QskdhnQyLKOxKSz7uy28nQonKXEZZGQ?=
 =?iso-8859-1?Q?pHfGRQ+fZmjP4ulW8HI75JI/LhvQ79QnF4c9cx3LtwIVLg41LPVFjdJcKA?=
 =?iso-8859-1?Q?+vl0zNPMQRdY6MK9xhn+Smf+0fPEdhkf8huTmOl1zouYUSIm6quo5S57MK?=
 =?iso-8859-1?Q?I4PlP1zkLVpnEBXIjPT9HlAkGp1EnQnqy/YuAyf3kIa+sgqedrdSB8tq7m?=
 =?iso-8859-1?Q?5y0qmV4RmMW3cGR9+jj1X+RUmqoYi0tm2qkxpx9vZPBnqK07ZGAl+ZqCun?=
 =?iso-8859-1?Q?g0ICFqbAArZFVIEfsEXFI3c40yaBFX9aNopyoeTF1cMwGAEsbmsyfS1pTm?=
 =?iso-8859-1?Q?gHowY/faWo+tEz4vFwRMLljOfB2c8Eiib4e9ShDN4F+q3s9yMy+2NQJjV2?=
 =?iso-8859-1?Q?eiJWr3gYxBE1pPCd26AQC/o7jkGYgX141uchEaw2aMqERRpLWui4QB+Wum?=
 =?iso-8859-1?Q?8eoDtvFM14ZaskDJXBA/SPPaaYlgC4NKT15Yo+4YJvcXXw9HOazXtWt2sH?=
 =?iso-8859-1?Q?7BvPTSMaDLCANH7HrG4MDgIpK7pXsuPTgoUWWcO3YNeVbAdgmzoYZO19oK?=
 =?iso-8859-1?Q?7n4eWxcTL7qEBOeeCGNC03eBNe7wzhpy5vby8zIGgzpNYttpZIpJ6Mj2ak?=
 =?iso-8859-1?Q?/Y4fsblPXMfkYRzz2uKA/5xyAqMK5z3KYS0txVwYGfEJtp6UhrUiDHasjK?=
 =?iso-8859-1?Q?sts9/Hlw3P3gk/J5N0gRI/38VCAXARM2p5/K3j7bKMY2LMQ+WSqVnkaRFv?=
 =?iso-8859-1?Q?XmrCtJofZyp+4gxUnwP+GsGpfdXw5Yz56vEKp8DbRzN5Co2Y/oafOp+r9m?=
 =?iso-8859-1?Q?f5Ho3Nmm3Y59BEdMLtqpd3Caj4mUqwWDgth6SBy5nZiTdRHqJPY24lbnBh?=
 =?iso-8859-1?Q?trbpkE5Dhl8IuqnJ1y/VLz5mrfhiHZpfbKv45K2HvN4fjXq0+zxVRsSKE0?=
 =?iso-8859-1?Q?QdRQStthrA8kPumPDDdkYEMDRVlH21HzkTWg9eAAILDEPZRDL8vRFyLTaA?=
 =?iso-8859-1?Q?lhVa9gCvrOIbRUL4aXqRB9cJf113uz6D41mkls/UsoVWfr0JHbmQgRik86?=
 =?iso-8859-1?Q?2jFcuNGFGE/neSJ21L7gADpc3HGi4rLDrK36ew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mZsLUNgTU/OlikYv7QvtuAqk3qwexYzY8H4QCFzCCmpwPpi/EbNfa8xB12?=
 =?iso-8859-1?Q?MvBooJKJWqxua+KM2YzWTLEkH1LTsANuPYnZ28o7dt1TWXRa4QZoBhXp43?=
 =?iso-8859-1?Q?XT9DP1MxoVyurAOfZiNWOKywQprPzpGIuc2UqNY68A6pAO88Z43asmuJ6K?=
 =?iso-8859-1?Q?l5b6nBKSu9vZfaLwkuwRXZRoFRxkfN0i4vnMAZr/X40ZcRJBtqwQUmrv7V?=
 =?iso-8859-1?Q?M7ehsj4eBvwwfd0rOXqJupLM5Purr9PtmRNvB4SzqPJDugMaIWdobab9VG?=
 =?iso-8859-1?Q?BOVxLAx/vdFtzU7CBfNk4e4lGyKBOavgfqmHYYBBfIpFGYxoSNEovLazC0?=
 =?iso-8859-1?Q?eDV8MpZ3JPeRHsAC8hlMbGyA3WAibZvq8ulBx9LemORCdePrDFd+24UfIu?=
 =?iso-8859-1?Q?YOUlQs0JB2YzBceMZ3+Qhh5kmEWuCsrQBzKKvHtR6SDJ0AYLliK9hgCPhJ?=
 =?iso-8859-1?Q?4Cbx3SOsddIuIcWBfWrpc0Ah057FYHsDO7HP5MP2sICqeixwjbrUfxLc3C?=
 =?iso-8859-1?Q?+mahf8o/iBkyzjwyf9iWTt4WuHdJLmlttMiItj1l2vPGt+7S/mF79Q9OP5?=
 =?iso-8859-1?Q?YOfyLz8JWCL7AVRgf6R8flE/FkO1f0I3PPKki5HntLYLK+wiBen/aRPGav?=
 =?iso-8859-1?Q?0D0iayW+CEMJXJUJbEdsLHtK4hCSnx6ryqtkRPouiYdB5DynNTGog1nJvH?=
 =?iso-8859-1?Q?pypdyMUaoeKmWPZbTYzXIxNLFX3KcTvxlN1FzO78CaBFVfqIkZWOMzD0vb?=
 =?iso-8859-1?Q?0A49Yc+zS2L0+vAmxof+kPCTQIazHFFBBY9ClowX5W39R5zxNwKv88JaRD?=
 =?iso-8859-1?Q?u4yleTaO1u73KDyr0QvtnjRrkxbzvQUiooIlVLmVuD8nuQt3CGcajDBbth?=
 =?iso-8859-1?Q?HWy2C0rmrqstxTB9Pi2CrIV7xH6YYAe9aZ4XCYkQYWdGr+sSaqTk/awW4O?=
 =?iso-8859-1?Q?kpHpeexvwK0TVFEHnEjyxeTY1u7dYNYsjm582dGVZr7my5OaeTlFCEJoZ8?=
 =?iso-8859-1?Q?n5DQDuex+SyU/JT2/E/qJlSL/tfaMZAcrIx16SZNeYqXiIlZY9yPQseZeZ?=
 =?iso-8859-1?Q?WdZoo5JUwY6iz52WcP1y2nDfdzhbVE/NDexBn+KSJYDbVN0niYPOJJeVcA?=
 =?iso-8859-1?Q?gExmyIywOwtIR8H6peXa+GAoRIyITldNAfu7QVyGzrQ4mcNds6y59002Hg?=
 =?iso-8859-1?Q?HrP/2Bo1V5DbdeJwUyXLAmmo6a27CbBFDms1/dcufSrP/vBWkfZ8SRtG7f?=
 =?iso-8859-1?Q?2eHqb9ezFafsK1eoIxvnUt9mSvOQTMl4p87jon2ElvOFSuH9VVcG3ukXAE?=
 =?iso-8859-1?Q?XbPAFZQZI0usVJUfW3DSkSHOIYcz5FAXo1ID6zwiSK/a+dYoyP9YfItbBc?=
 =?iso-8859-1?Q?d5VY/jLpft7ugkHrnKjsj/1Qa3CfuDXeFCQTgK/l0xBqFWILPL3L3iqNaA?=
 =?iso-8859-1?Q?pVbbodamfV/rotCZIwrqgnPkOvNDo+HGWPdgHHmfSR74D/V98zbjLGTA+z?=
 =?iso-8859-1?Q?Cd/OP8Lor6JsoMeWo3RQTxWvweFPvvzDbrFr5czfMoSPq5LUrPELXlUwfJ?=
 =?iso-8859-1?Q?h27VNeszsPixW4FFD8VBkQlEGugNrJylM8XUKmCNT1jx/NMJm7QtsS8o1d?=
 =?iso-8859-1?Q?r7Z64HgmfvnoiTQQ/t4o2N/FFHfO1GPpRLjNcycZ88CZm1bihW2YTgFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4gmxYaNJaQR3Ie2hDjCDxkEoYLNex6W4j15fbXBMe/7pIh+lUmEDtKGGjxJJtx+C702PWgEncWkGpiaxkGwapq07peLtiqr+Sy/VPiMmtObEvaWjSMohvfx+A6av+ZSdmrFaqG69IZwrhIch90nTdfzVV1a1yTspTym9UGmD9gib/60n742168PpRkjiWZqEb2kV6I0D4jvUJZ9XoFGKgWqKsrV4VQY70OH4yhD4GN/TCbkHdcZepoTK5LUgNvWuAy15lez6CEorxU3ticIZx64hd47w5Ij+bHL7xm+xh0nvGm/BehybZVtaguxQTt1kRFT2egVPntXxpLg4+m//num0qPs7RwWt+BDV4+HrY0nDE4sG1h3zmeOSV+HA36ISQH/G6x0LM4+JnJAS90fmtaazqdByCv4XSb4whpS1tBFHbprOewFlYemtrhx14DaoLiAxvvHABnJzDfOBXb5IchYI76nwv11yHNQDYM5RbRTj/egce004fR9J4A+BBjhLFrjCn0gv2sVRmOjue7kikB23RXlngqSVyTHj4KbrIXkhSkO1fWkIWekMZKefxM/RmVMd5IknlIBbH2SuDBbA1zHCpww3ymHZrT0QtJWxAf0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e689b69-b554-4b9a-9f55-08ddc55eade9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:20:59.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jHcXLK6QNUsefYtQ78RESKr9JpYxdtrRsYeCVWeLU1qQXjBMt6ed6cJIPn6ZBJvoJM+Uo3sCTbmuhFAz/Gx5Y/0JjgyJ0aP+T0BrLqPfKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170162
X-Proofpoint-ORIG-GUID: O4TrcdGU9IjmcfuS2X7_vFM4mgkR84Z8
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=68793f1e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=Gz453i3MSzi3oflTVxIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: O4TrcdGU9IjmcfuS2X7_vFM4mgkR84Z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE2MyBTYWx0ZWRfX7XswO8VLfZhy OtTY8gxBtI9LDCsSPZR0ZAC/UaSGRXs26HifKPloEe9G20bwUngCO1KEhhCsNIeFhoGh6RitzVc tOoFb8J+akSBWRvSvVuMC0dNdGq4RNWmRYjVYJnjscSW8to75VfPXDz8AEQV+IidLrlVbTt5XGJ
 gUtXgcjiV2GLeY4FI8haEijT5JUBcWQ9axhxe5gkKUJN3UsXcfTXAaxU1hY2bqEzDy4/NAeUyHK haZyE4diiJ4ial1rOwGzS0RtDdkE1ZnSIz05cdIboM+Gkna//AR+GdTKMn7gyDYXdyGlAOFct8y ZDyokLjANnVi0/Ei1d/g4t7GTjKawRXwGp7Vb4T1sq4GEmWFEK7mRxYY4I8UkGUMWl9arhkki0S
 PpxJi74diUYGZmQDAXQ9Ti8INSesL2B7DndW6WMqSVEb1+/6hJHjREXdeoGpJKsgoB/VY9Vy

On Wed, Jul 16, 2025 at 08:45:19PM -0400, Eugene Loh wrote:
> On 7/16/25 20:22, Kris Van Hees wrote:
> 
> > On Wed, Jul 16, 2025 at 07:07:59PM -0400, Eugene Loh wrote:
> > > I was a little concerned about this patch, but also wanted to expedite
> > > review.  FWIW, testing shows
> > > 
> > > test/unittest/builtinvar/tst.psinfo-bug21974606.d:
> > > test/unittest/builtinvar/tst.psinfo-bug22561297.d:
> > > test/unittest/builtinvar/tst.psinfo.d:
> > > test/unittest/builtinvar/tst.psinfo1.d:
> > > test/unittest/fbtprovider/tst.entryargs2.sh:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-high-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-low-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-no-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr.d:
> > > test/unittest/proc/tst.exec.sh:
> > > test/unittest/proc/tst.execfail.ENOENT.sh:
> > > test/unittest/proc/tst.execfail.sh:
> > > test/unittest/proc/tst.pr_psargs.d:
> > > test/unittest/proc/tst.pr_psargs_other_task.d:
> > > test/unittest/usdt/tst.argmap-typed-partial.d:
> > > test/unittest/usdt/tst.argmap-typed.d:
> > > test/unittest/variables/bvar/tst.execargs.d:
> > > test/demo/spec/specopen.d:
> > > 
> > > test/unittest/dif/bcopy.d:
> > > 
> > > failing on every VM.  (Well, bcopy is listed separately since we skip it on
> > > ARM.)  I'll try to put together a patch, but let me know if you already knew
> > > about this and have a fix.
> > I am looking into it as well.  Clearly, this patch is catching issues as
> > expected.
> 
> I guess, but those issues should be fixed before the patch is applied?  I'll
> move onto something else unless you think it's a good idea for two of us to
> be looking at this at once.  I do not understand, though, why we check if

See:
	[PATCH] tstring: fix leaks
just posted

> dnp->dn_kind is DT_NODE_FUNC or DT_NODE_OP1 or DT_NODE_OP2 or DT_NODE_OP3 or
> DT_NODE_DEXPR.

Because the way parser nodes are implemented, a rather complex union is used,
and various members in it are used by different node kinds for different
things.

Those nodes (and my patch adds one) are the nodes that can hold a tstring.
