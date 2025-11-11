Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA821A267
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762830025; cv=fail; b=axMB9OZx5qUHOBIOBQet4qJ/wOwpCsWlN8UW16YGsHYNf0nMX9vUp5JH4PYBNo5IVdU/lOIGDCDsCLg+6No1nKK6RUWnYqRS/WNFIHUY80KtHTJ95hMyyAo74fSxX4/4D2QOyzGhpb/EURkOMEULwrB9RO9PlUYf1jmla2COvTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762830025; c=relaxed/simple;
	bh=eK44f/HiS5ClU5fGA609eYyjLx6/9vPEUhxmiCrlL78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UCat1gXNXdMW51SKCLsVhhcxe/DM+g0Z0DAES0OBha4DEu6uc6w1ZLsThlc01cRi+7f+yV3Gp6u7YI8JjE8kWd3RoO0TrJ3L3e7+qeWTksVYYL5mSUTD58JJp76tujOXDAwfG0StKEQ+5nAgALofrDNm6wQEufKGKa19fptbbik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jiGU4Ycz; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Oh9x/Czx reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jiGU4Ycz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Oh9x/Czx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB2kmLH003100
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 03:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JNTxX/y8Wnf/GHMdOn33lsIW+doxCVqwOozFiaf7h9Y=; b=
	jiGU4YczkEOMD+ZLlP/Zq7bP+4/U3liGa4Z5Ljd2rH3fLfyG29MWsFSU/5g59mOK
	Rjlngg5u2LX170eFyEtTayVgFM0bhkNQtIU2zYKZP6y8RU38ANbpeBB2UtPDqYPa
	PXqNIRrtHPEddiB8/U7bb8y9PeiYhOZPlYuaaKHMqXZqaH7DoWKuzo+qNkYvMhSt
	Iyn1r87yWYS8/Ub39kEU98rxHRKgj3JsXgY/of6Syk0Na4cObp9IkGsgSWo0nwaq
	T0KlSxTlU/jnpH4PFqBU0Cf+yJWTSpcuvPQzK8Tg1obqXMLW9Mzd8P6IrLDEsKGK
	bhB1ikYaxfLufqey5OnH9w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abu5y03mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 03:00:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB0cdNR040166
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 03:00:20 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va8ygca-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 03:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjzFo4FkovPHOlF6E1RnnoJVxP7uYAtLaL8drPAFfZ1a4lIRjg0uCM+xPny5+hQaOAmfGsXGJZNAoWWXwgI8Y9XzZkwLRaKKu+bKX+GkTEHC5CnrOtRbv2XItRcWrMMnZj2jZwSgBgZ+PvXnGNm2M6N5WHW2yweQ7lVVtsKSzAqkGDvVY+nHLCG0H8Zgs5OSgOP37KOki7gqtXjC4xD3pUHqwR1OFCoVqZmmxnEtZ/aGLN/O9LfC/R5SFD1Fw7Zb+FSfyHtRujuoAaMvJTtKyoEvkZ0pWKouTNgBAqwOGehPsfwUu+ZAiXjrzi2TlMw4Y9K2j2T85Q1HPnTvyJ0wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzrI/XPJV5rmCH5zhTDJtR1xM7syebPH6khAzHKfNYc=;
 b=C6gAuhY3Tg0+grjpcVTQHIPsHmAjOsaH8PD6IXkQz7hXmYxCNoJkfNORaZrUVUNAWHcmo74lNQj2tswqkLH+0tnw/oZstV9BA1SALUe8CAf35QF2u4xd1P1IcpFVzNAFa6yFhpGShN/uIWI33kiyVvG9ySJ3rkan9+hJP+YdoHDIaehJWMVAVIPB9JuD5TK1bSamj6q16SSyBxH2hWiFaSdzYvdOm+pXIaj2KsOs0f0rDaO7viiFKTA4qY6ElY8+7GTtkndoinyVcosnQGcmmBXae9kgQtxJZl5QkeeJbRaAtcBfRSsI7TEIULeLrMqQ0ZWUJrVD+5kRtkXtGHtOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzrI/XPJV5rmCH5zhTDJtR1xM7syebPH6khAzHKfNYc=;
 b=Oh9x/CzxrfY5ewY+EEBnZu9mvVx/VkwU9I3Dp9H3Tr5qgdLDvbA0TaOeGqqzVb7oPNcMTyEwJFqDrSAph08FXmQ6i2YjljDibPecyvMb67jrk5pcUiC+HPyuFe9VrDO3Dzzjok9RiFD23zL1VkkxJsbfOx/TPOamQIwA7mendW0=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH0PR10MB6982.namprd10.prod.outlook.com (2603:10b6:510:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 03:00:18 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 03:00:17 +0000
Date: Mon, 10 Nov 2025 22:00:15 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Message-ID: <aRKmvyBLFPNRYOM3@oracle.com>
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH0PR10MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6b768d-eaba-4e4c-ecc2-08de20ce71c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?FGRc2QHzk1MkNazv70sM56skv2grvH3g2eDet5HMqQHV5bZYV3bZyAN1tO?=
 =?iso-8859-1?Q?7/nPTa7ia0YTloXFwGN0o/8pCVjuiUrEDZHatkyYPM0Q1ibRm5AV8keFhI?=
 =?iso-8859-1?Q?Z4WZptDaoLe9ezyCgvFfCMTu1a0u+lngZ7YbxtpLHkKpW1nRjPoHUi4/le?=
 =?iso-8859-1?Q?KVetOpDRlZcphzKadfSXHzfP22XjeJAibnsn5CgKXPnaLO+4uYElXff7e4?=
 =?iso-8859-1?Q?aF62//0TfMCJYFPSy3gjlMykodnzub6x0L6l8lEaQqjCWiPSrKTu/HLRJQ?=
 =?iso-8859-1?Q?9AtyQSV9FXgpVOdW7wft8SNYdmcCMIlH6VP7OHTBf9vcjvXnprki/PLZDH?=
 =?iso-8859-1?Q?7TOdRDeVbDQenHd+sCK9a+GWYNf31Q5MNQbKglKQd21WByJYLwOsf2WaI7?=
 =?iso-8859-1?Q?bSG0W7InxgtmRHcLJamvdjRlwyKV6lQI7ox5RhXW2RnRhHuBY/L3EFotAl?=
 =?iso-8859-1?Q?mghk1hQhEG58b0KyeAnl7Ho7FOCCP6/qm5fUttpiRKVOd6iE744Ncecb+O?=
 =?iso-8859-1?Q?xCg7fRzjLuZtdwUNwKVPBTbdUJYwgcpEbCIobj0G7C0MwHLMsfL6nP01nC?=
 =?iso-8859-1?Q?OYPTlPkTarpbVOlnELQBkqGvzXD7eu/DfhIzF78i04+ZnvTNVNC/wJ527E?=
 =?iso-8859-1?Q?hJVB8wuMi64JjJn6iZzsd8sDBH4lZFMp5WigKuhbwSEBR3BiP2HoDD4NsB?=
 =?iso-8859-1?Q?bIrv6MZ+Z3RIFfglEDUCY/uCgOUiFhyXQKWNIZjbzOcFCAs2pZJ8oVJPYQ?=
 =?iso-8859-1?Q?Ht0bbuSR88Z9w0kTCLhos5wLC3+5PgtXs8/aYu/OaJ/CjL1f4EOWQ9hRVE?=
 =?iso-8859-1?Q?IqidsxACIohOXwhp7cNjfk3ApbcfEZocqWfLN9QraDEh3hwqeiM9wrFy0r?=
 =?iso-8859-1?Q?Wv+EEEMgKbmwHxRXLZC/ssisc+9NJS7I47tRm/3gTzNEWknK/cMCpZBn/n?=
 =?iso-8859-1?Q?2MBhxC7kmLWXi0QQXR4NImymieh+29JcQl7otlR5HLsN4nP6SIuQKvj2Ar?=
 =?iso-8859-1?Q?VO+x6fbzE8J7XokygfAa1dV7HXjvXBEluLv84AbwNGwAwkAf4yxr6BZ7JQ?=
 =?iso-8859-1?Q?AxMvxADTKwRugDFKrF3zAhQdsFvflDsrXR9I0BkSuxwQGHyQK8j3aL9reh?=
 =?iso-8859-1?Q?fdQIrDjdraq2LSdxVBjm6MVStLdUF5YXMNIe5PRXjG7lVQeYL0KzD0h4jp?=
 =?iso-8859-1?Q?1k7En1MfPqRBM0YAbjHyP18F/wNtmTjx2uz8Pzr8bhbllhi7IHl/doyVTd?=
 =?iso-8859-1?Q?OEzetCnQFxL/l9zBrhlqIxSpl0HlVhyuBWbZUyCD3FlQb8j5amhcO9B/Mn?=
 =?iso-8859-1?Q?+rGh20FnLI251f3xqI3c3emYtM0ayV1bdiUd+0KC3yZyAD/oPeRJhvJ5jG?=
 =?iso-8859-1?Q?5/xF41KaQzQMKGI5Xmfkaq6pj2+rFU2i4/5Xi7tlTDgYth3dfNE0fslUpM?=
 =?iso-8859-1?Q?l/jnBWUBTMisMla9HU7XoU/udug8uAd6Png1PhXTfuVw+QA8E+5pD/QR8N?=
 =?iso-8859-1?Q?kqfnEVLry/fu9i1fRHz6TF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?iHv1AE3dlBOUv3TlrNw/9pxoibvunktGUm8QwQvDQCf/rx0ltll7b2J2Gt?=
 =?iso-8859-1?Q?RZ15AU//G+d/1V60Alz2tjEye3GzERFYflVTI/EJaEZMqgc3Cfhx0hunEt?=
 =?iso-8859-1?Q?ByCXTOi1+Q34ySpivMRi4Z+fRcFswEXh05+BcQhpsJqPBd1FccqTQg7sgZ?=
 =?iso-8859-1?Q?zINBXp+Jq5Z1NKPYvyvDDd0Okyy/4enA+whYOty/oTCJn4X/LQJ32M6QcV?=
 =?iso-8859-1?Q?O4a68wQsZpN8Xw+q+GZ+zC1slq+LXoSn6j26IUWuUz8lPXgfJ/F3/v3m/C?=
 =?iso-8859-1?Q?OEW0wBY0/oc6f2iqQoCrkjVIwTtwFr2TlXFHh99yn7p3OrTKYHbaDwKUqu?=
 =?iso-8859-1?Q?1vntgPcC3GKr0TNviPtu+VFYVGm8e4a88nTA9KUTlUoIr/Tn6niodl6i92?=
 =?iso-8859-1?Q?71vWNKmlnUhLPLeXvRy5Anjo/UJJsWrEt9zRC7Wy3sTargNw8EC80xMKd8?=
 =?iso-8859-1?Q?J8HFg7y1bSTwPPLdHPhyqMegagXBvaTCWu4Az2oahqchcngYdrT3iy5Pc3?=
 =?iso-8859-1?Q?5ChJIq0OG2ffIO7JSbTs8TrXtyyB0bUWlVCLtGORBe7dk1sNkz7cDV3olC?=
 =?iso-8859-1?Q?HxSnbvwjxxLp3k2SoFI8XpRjoWezQpXHbg5gMjueNzyHeyGccz5lodlJOC?=
 =?iso-8859-1?Q?vRen4YxjfcuFfqYuPR5iRuB/rpY/W+GZDQrEYbAhSCE8ZCyRDvSgfsY7a7?=
 =?iso-8859-1?Q?nIld6DyLDdD9cPxbuZuhUNT6EWJOsuNeNq9TKs+MPC/8CqCpJYRml6pGZf?=
 =?iso-8859-1?Q?QgXtlsyibsrqtFjQLxJWrWVpCWaSL10QpjohGg2V7WM/1t1hAoD9HgK+9s?=
 =?iso-8859-1?Q?f4M8YELiHdxOeqmvr5m0GV3UwA6LwxaVgiRzw6ygx7f1Gaec9HLAY0lbYB?=
 =?iso-8859-1?Q?qv4djKRdV2yv0EIwZ14zYEbxm9VdAVrZeOsvqtZ3yDMbkrugh1ohh8I67H?=
 =?iso-8859-1?Q?wBy8Z1tnsMhWeVQQRIfUGihx8slULcOBLftGkZYzixPC00p4CWk2DzGrEs?=
 =?iso-8859-1?Q?O7LUMt24ctOaY3hlsimJwQguz+xa9d+VHiv4uruKhwEWdWInla0lhVfmGH?=
 =?iso-8859-1?Q?fKBBO68Cq4XDAoSes7TsWQddpzn2crmebKkrGkFcW4N17CDqhLZNgSXR6B?=
 =?iso-8859-1?Q?+Wi8rClX5/kledJAlIo/OSvPLNG+839hw5au8H3MqsBYLVB+HZM3Qbmc2n?=
 =?iso-8859-1?Q?p8Rl+2JHP5cbqTj0C2m4uAa+pDZwcMOHzVoKE0CwrtqhvM7Y1l+OuxP0Ic?=
 =?iso-8859-1?Q?lTIaqE1yAmwcf+D3y5FMTt6nD1lBbGTX8dpBs9Gdx17D9gx689QNsSlgi6?=
 =?iso-8859-1?Q?A2DjZ3L4FdQweV79L8LpAmgDlOgwi0+lKpG/cQF5FEPGtKMYHRfSWT8uiL?=
 =?iso-8859-1?Q?YV6avZJll7uBzHdGNwz1kxPgOM38L4B2XzuHV2Tldb9knsTctm3zTqSHd7?=
 =?iso-8859-1?Q?MojZ259KwstCRcWtpauc9De+hNLXTHd6Zvxtlt3zwV/J4R/oEneQRQDRob?=
 =?iso-8859-1?Q?PbIbxXLcYc6pTOKm2Fm5XLu1vDbu/NLZBiJauEx6HF5I0CD/sciWc0AwNt?=
 =?iso-8859-1?Q?q/Fqio0JGVplJ4YnSKCL/DaJtoUZeOMC7HajOGjbDq9z9Nt1PX3wxv1AhP?=
 =?iso-8859-1?Q?ty6LYl4dLkdQsdUYHjuPLFLvlKMva1g+pnbtS4QajvvCno2sTbeoyXtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rzempwysZmyDr1ZGUjA7yg5AAol+sa9IgWZ0VlOX6jd83LFgc6AqL+60l91Ano6JGdNOpgbeAkEe3asMjE4pSKx2gSRMABbQWqgzPOwrdoMnxNeuDfAx3hpXTQsz8KWMADLRXgJRPiWHfoBhILHP6Mt/iuuaJXUwOg6rEDXVdw2xPnkE50i+mi6yZJQKmLkMX8bMPdQxeW2vW4QXg6fIyfuzqkGyq/XrozOVSkYyIs98wchHk61Uv8jlucgehKyspWcuJku9W5Q7AVLOVTIaKUZ7VEBMa86TawHoV1UAgn2OsblzYaIMtF9LO3UJptp8nA+FoJvrINvtCVKsjWNS6BWgS60OJBrYKF7X7JJVkERQ9ghu0aoYE7zyMkGwZwiGFwBYMU8TosmgW7jHISCMGoFTTliVJeYqAk6Hbn/76M+visKGTLW9kPLbEBnUpVyipWGw1TTcemTyQiNBrmdrFt6VM7FYSh5BQU/ygnACtWJpZ9TYEoqaJsgQZ3uLpIS92jD3M62bqbLHKj1ha8NZVSrZJs1dVpHYm7jqYl5Hetg3VEfbpZyUybxKxu9dBC3/6AxgxjeHin2TcEHXJI/nlUF9M1IqYu45P/bkAhGgucw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b768d-eaba-4e4c-ecc2-08de20ce71c1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 03:00:17.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kr/qRqXImOJXbvrCBPPaHSDcXZh43JiCPG2HB6oyWMlHO/feY0OMpCKmKYXOGo2wj/LsESKArFoZnbSLhFYYVh16gIKT00UKcaQLxglkcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511110020
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAwMyBTYWx0ZWRfX0BB1rba4bYQq
 /Jz4GUsAodWzWu+ZiX1KU9+8qcWOJ3NQIUQpalrdL1MJFH16n5jA+zW1ZdiTutTQ1C4p62ih/CB
 l2CytOaZsWytUfkklmbyP94bxar/W9KjW1U7N3W+4m6qtoAouNN4Vtg3jtyu22NBL6AcJPa3TEn
 iGpjY0fXFyk8CQMyDyCUIdrHLsNY9sicNZFcPiEvcOAU9ggFOIU/X4clZBgEE1DQgo/YDPkCJI6
 8oY4ihZAi7KJD41OH+70Re7r+UzX8mzl/XCiFHboYwp30SBRydlfS/QI7MDN4LdMu192NN7QZj5
 TwmQCNFXiAx6KWOvifu+5/H1uB5GvWc9yDhDR5I1PH9/lIlh0ygFDcftfO3hEl8X+S/ktxdkdCU
 O7qqQLO7h0b/3bbqP4bdwptz21LOYg==
X-Proofpoint-GUID: l9uqDvsiC38vHpCWZiPZDsjq1pu-uKC0
X-Proofpoint-ORIG-GUID: l9uqDvsiC38vHpCWZiPZDsjq1pu-uKC0
X-Authority-Analysis: v=2.4 cv=Qddrf8bv c=1 sm=1 tr=0 ts=6912a6c5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=F6a8QqsiyhdU9AiTVUgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Mon, Nov 10, 2025 at 07:10:52PM -0500, Eugene Loh wrote:
> I'm against this patch.
> 
> The picky stuff is:
> - the Copyright year should be updated

Easy to fix - done.

> - the timeout probe could replace
>         tick-1sec /n++ == 10/
>   with simply
>         tick-10sec

Arguably, the two are not identical.  It depends on why one is used over the
other.  Here we could probably go either way, though it might be nice to have
the tick probe firing every second as a way to generate a bit more activity.
Given the frequency of the other probes, not really important though as far as
I can see.  Note that I didn't touch the timeout probe primarily because that
was not the purpose of this patch anyway.

> - the "delay" env var be set for delaydie???

Why?  We are simply using delaydie to have a trigger executable to execute.
This is a valid use of it (and it is used that same way in other tests also).

> - the ustacks for delaydie are perhaps not very interesting

That is not the point of the test, and for that matter, I highly doubt that
ustacks from date would have been any more interesting (aside from the fact
that you'd never know because the test didn't even work with date).

> A little more serious is that all this patch does is swap one failure mode
> for another.  What for?  It's XFAIL anyhow, and we do not check that we're
> getting a particular, expected failure.

The difference is that the pre-patch failure was due to a problem with the
actual test.  But since it is XFAIL that was reported as an expected failure,
which was entirely bogus.  After the patch, it still fails but at least it is
failing for valid reasons.  I.e. now we have a failure we should look into.

> The real problem, meanwhile, is that this patch leads to lots of test
> failures, at least for me.  Not every VM, but many.  Oh, and I do not mean
> on this test, because this test remains XFAIL anyhow.
> 
> Consider a subset of the VMs I run on.  I get these failures on the
> test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run after
> tst.depth.sh.
> 
>         +------------------  arm OL8  UEK7
>         | +----------------  x86 OL9  UEK7
>         | | +--------------  arm OL9  UEK7
>         | | | +------------  x86 OL9  UEK8
>         | | | | +----------  arm OL9  UEK8
>         | | | | | +--------  arm OL10 UEK8
>         | | | | | |
>         v v v v v v
> 
>         x x x x x x   tst.kthread.d                 FAIL: timed out.
>         x   x   x x   tst.uaddr.d                   FAIL: timed out.
>         x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
>                 x x   tst.ufunc.d                   FAIL: timed out.
>             x   x x   tst.ufunc-pid0.d              FAIL: timed out.
>                 x x   tst.umod.d                    FAIL: timed out.
>                 x x   tst.ustack25_max95_profile.d  FAIL: timed out.
>                 x x   tst.ustack25_pid.d            FAIL: timed out.
>                 x x   tst.ustack25_profile.d        FAIL: timed out.
>                 x x   tst.ustack95_max25_profile.d  FAIL: timed out.
>                 x x   tst.ustack95_profile.d        FAIL: timed out.
>                 x x   tst.ustack_max25_profile.d    FAIL: timed out.
>                 x x   tst.ustack_profile.d          FAIL: timed out.
>                 x     tst.usym.d                    FAIL: timed out.
>                 x     tst.usym-pid0.d               FAIL: timed out.
> 
> I think the problem is that tst.depth.sh -- with this patch, in any case --
> turns on a huge number of probes.  That causes problems for this test, but
> not in the sense of it FAILing since it is marked XFAIL anyhow.  (All this
> patch does is change the FAIL from one problem to another, but we still do
> not specify what failure we expect to see nor check that that is what we
> get.)
> 
> So, the problem is not with this test, but that the system is left in some
> whacked state due to having attempted so many probes.  As a result, the
> process "dtrace -o $file -c delaydie" is still around well after the depth
> test has finished, the load average remains high, the pid0 process does not
> run, and many tests time out.  How long (how many seconds or how many tests)
> does this effect last?  It depends, as one can see above.
> 
> This raises all sorts of other questions as well, such as whether tests in
> our test suite should be allowed to depend on running on a somewhat idle
> system, whether we (dtrace or the test suite) are cleaning up well enough,
> etc.

There is of course the aspect that this patch is part of a series, and the
next patch in the series should resolve the impact issues of this test.  If
it makes you more happy, I'd happily move this patch to the end of the series.
I don't see how it matters, because this crazy fallout from tst.depth.sh will
be an issue either way until the per-PID uprohes support is applied.

> On 11/10/25 10:27, Kris Van Hees wrote:
> > The test used 'date' as its trigger but that caused the test to XFAIL
> > for the wrong reason: date does not have symbols and therefore dtrace
> > failed to enable probes for it.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/ustack/tst.depth.sh | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
> > index dec16a3a..977d1b42 100755
> > --- a/test/unittest/ustack/tst.depth.sh
> > +++ b/test/unittest/ustack/tst.depth.sh
> > @@ -16,7 +16,7 @@ dtrace=$1
> >   rm -f $file
> > -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> > +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
> >   	#pragma D option quiet
> >   	#pragma D option bufsize=1M
> > @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> >   EOF
> >   status=$?
> > -if [ "$status" -ne 0 ]; then
> > +if [ $status -ne 0 ]; then
> >   	echo $tst: dtrace failed
> >   	rm -f $file
> >   	exit $status
> > @@ -78,8 +78,8 @@ EOF
> >   status=$?
> > -count=`wc -l $file | cut -f1 -do`
> > -if [ "$count" -lt 1000 ]; then
> > +count=`wc -l $file | cut -f1 -d' '`
> > +if [ $count -lt 1000 ]; then
> >   	echo $tst: output was too short
> >   	status=1
> >   fi
