Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130F2BEFEA
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752615572; cv=fail; b=B17xdYINIL8F6bwm8xl9CIjrhKrMShqmnUbUeCIkU56GFCSCyZF11gJJnMVNRVW9UrbVYLTyCCFyHzxGlCkU9VvfrwtJW6/9jbj01C8XBqBZBpm87Q5DCGNpI4vDekrHYLXCRY8O0KHd5IhoosTirt5mI4IfhcC/V+WvGRqfCns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752615572; c=relaxed/simple;
	bh=HujIDgSXSvEzc0OEMKTvTIdBYT1Jk58TkP8uTosO45U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oOj52fs+hPzlqYjjgKA5IUwZZMCYYnmHvK6/+Pg0MESTuA55ztAjYq7JVqxKiuzHcPWtJd1SuOiRBnVNUbkpZnIMFG/EgRDVGzH/8+tf5ToDGcgOvqy1XBg4t19UrVqzHG6bKUGJZdRMiguyQ0NndLdp6E16ig2W8zULp0dY9EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F4v4Md8G; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RLUMHLq0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F4v4Md8G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RLUMHLq0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FKXihB014653
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lnnRRvhBxoAi3RpRZApb4GVM0Y35elYQHComANSr8Zk=; b=
	F4v4Md8GZ6ruPRQgW2ti21oM7an0xaSvgw60HTKnCWyangWydRiuLfF9P5gP12uR
	4k0hae3kXPgjv4NkexTsgV2KGvdeR+hKudbpw3ACWDq5dIGLukTiaOZKhE+0IgW/
	/1udHUCLf8C3OgsXGO2po+zPMvpjPrETZs5AJxuCA36hPYh981LdTz5/f5NoWWd3
	3mCTifiScQ55yaxHksNWmBjuXgbMYIys9wz3y3kthzQrzkzKY8M0Tv5Kt0b5pxTN
	4KVx0amHblwKAiTYvUShdRe4+sLGC+1wQZwgBcWFfODgK71FKgrBmnFCU/pDvV96
	OplSanZ2N2/K+NAnLXp8hg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66yehr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:39:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FLd7h8040396
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:39:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5ajxfc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuWhce02fu/vcom3NIooqUQ8DDipzVYLzv98spE9TjGtW1ONCzPd4yhlEoLYIOLSc9vzB/to8uok8RHxcGM9nVvAEfhQwyC06u3rz9+3qdAmUGKEZ2fpOfhwh+KNlqUZhs3TellFFpEQuIgmprGUcAGBjGkyMPH4AL/YVTL7hU4KnaBYEijvEohw0ZuLz60EFGKHiGOOuNz2sXvfspnpLeQSwY21sfoEURMObZqAJia4sE9cUGMxX4/sEjwQv+e3TE/Z/tHQFJCMJuLqOSC10pc4nzP2NKleBEBYSEeqXhhkzub5iQIklaz+FBoOX+fwip8YJptR6cDjzXO+NJXFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVWt4B5Ho8UQ/Afb5XGx4eh0gZ3oIfOSoorjSIgvmFU=;
 b=SywHke9iSf+6hAuj/1qpZ33psL+ht70kxCFllQifEsLWYIg1mqhdoj/IsX9t6vtw8PfbRKKuH8bV+kCSGNe1IZqtK7fVFVDu9/AJV7IdyUzAKSfcybND7fLt8RM5XqTR1BMVEA2yJApCsXB7z9sq8kr8Mr730PE5Rg+N340d+MJ+5MrHGzlGXLgcg73Kuihc3Gl2gsTaBNbyUvL3cg9vx5JuyeVs30AeeaSZsXQ93dgOuKaRCOHisj/+AtOeeoMPAGwdg8xPbBs7szX5IDhqXN9tpzXpWYaAzhDTtp+Xb1TTDtXOIgYSNIHdqruYpsGmNnnf/96NBMt4NinQ+9UZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVWt4B5Ho8UQ/Afb5XGx4eh0gZ3oIfOSoorjSIgvmFU=;
 b=RLUMHLq031dq0AfRTq4i/ZDUYIbJltJ3M5oW4B6tMBmJdeiCsGL/BttjhPrUHCmU22fBPh5wXLfawqMQqRZpmGsoIbzp0TUDh7v/DnbnR9YrYeEHXLZofMkU5CG+chfD3pZ59RCUEyglNJvOmS/w/xM1SzE7pyaHPWOqVBX0ohw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 21:39:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:39:24 +0000
Date: Tue, 15 Jul 2025 17:39:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/4] rawfbt: selectively allow return() in
 clauses
Message-ID: <aHbKiXh6TRGCRJbJ@oracle.com>
References: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <97ca9d19-12b9-a99e-4710-414d6dadbcbe@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97ca9d19-12b9-a99e-4710-414d6dadbcbe@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ac97e2-d8bc-4d15-97be-08ddc3e8113b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Z2getaryd8B0fKrjk57aA7EWGeGf2cwQOv0jLqzhcwmcowU/hq6fYlvnIU?=
 =?iso-8859-1?Q?dz66mkxPOYaNVKwN+55J9GCZu74dhoPe+4L472PZ6T8QIngfdJUDuz8TPF?=
 =?iso-8859-1?Q?JtgDxA4gKFaPmudraNX3WDI8J2xGo39rBV5KNmxmzBqJHDDwvlVufU1Kku?=
 =?iso-8859-1?Q?dw0TfrTsqS90NH9w1j9e4NpWcFQamEI+EP3MqY54eMfWRykiO9OW/Sy74q?=
 =?iso-8859-1?Q?vlIkDd/DYF9eHdoMPFsBrosoT6nIqomsO4bU3LL1sp+FkkJnpwEv7DRzcw?=
 =?iso-8859-1?Q?ygqW81hS1bsvJvF+yWKKjHpdw2ovkq3GN6qR/KQWNM04OWW/NrgMU3m5Yz?=
 =?iso-8859-1?Q?Oi0IMckaCZRzEj1GFyJGpJcP1KRBdWADfbAUbAEtmmnUMTeqm9reaKgvX3?=
 =?iso-8859-1?Q?GcDTuP1931zY22Oc+PQba9mTsRmk2VMow6ssKxGw+iLHqzVdmB/md4QtGq?=
 =?iso-8859-1?Q?Xao5/byszxRVrBB6ipJUC8O5bIuwcedJrlSNnlEoh9gR/BuijiMW7ojVB6?=
 =?iso-8859-1?Q?R0RP+keYfj1DVL1kE+nTJFcKPZpaIAHzfkp6P+A1FmXy9xrLU/b17cltHn?=
 =?iso-8859-1?Q?g2zehiTXWxOCDANa016bkbgZc2qVD5lB1pLMcANzuE6zMFP6Y4WqbbOgJc?=
 =?iso-8859-1?Q?RWbDj6mYDjR42z4PTuBwyAFqqEMML58MDo3bKnp8V/ryywFBONpg09wNsY?=
 =?iso-8859-1?Q?2EO2HSYsitVOIjmBr/yq15UCwIIwi+gwbNoGBr8wIsaws/GDx2RGAvBThM?=
 =?iso-8859-1?Q?IuyEgAP0bFfc16aoDjBLrzMfggsmKfBInLH09iiy9RKPKLFn4rf+Fa53yC?=
 =?iso-8859-1?Q?0kUnM9V3d6KAT+kWml0it9V9EUMTPGPLHvI+1hPo4k+KiJBSjjmUyKAHRV?=
 =?iso-8859-1?Q?YXRoRLgMujoUBXpgN6dxPB6ohFzrp3UOVFXZfts4UZsi97RxtKa3xhOe/e?=
 =?iso-8859-1?Q?8yuidCt1qhe9b3NHRSweKEU5NyvSApIo4qeE6P6tY5bczczjbiIOtbtGzb?=
 =?iso-8859-1?Q?Dd4du2N1487tWWY49RqgrV6539jNQawK2UhegExMRBJCvierFr9LfBkjxZ?=
 =?iso-8859-1?Q?ltoqkwewL+XnSkwBgLXLT3mC1oKDkk9eAlkb2tCRPjDwCz5SPqBawYE54y?=
 =?iso-8859-1?Q?EOgw8j+WNuSi5bYcG0aABKoYW2Rh94DOE5ccwizCAcle1azLEnOgKM0mgu?=
 =?iso-8859-1?Q?+ay0EkyuQG4cNSNDXuSQlJzFPJWl5YwgJaCheqzCQnoW+Byzs9jNsIsJXP?=
 =?iso-8859-1?Q?rPKgrYAinhP6eKlUEIvQPTDNGhvan5TMJ55e7H63HFZwdSzUHsVkeVhaqt?=
 =?iso-8859-1?Q?xm5qyKft6jvgmxp1zn9cSQz9wv89m5KMjzkWPWT8A0ic9zfXJbiW9oDx6i?=
 =?iso-8859-1?Q?y1ciRKGmfrZKujgCBZqCx3CKhqXR9VZdiacKk6R4dHyLz/WrE1p+pfrBoa?=
 =?iso-8859-1?Q?mIq9B2FCJ5nqd1V4QffalmV56+pwEWPs3HQ96SokXH1KdQqEfJCYqwhB8N?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?F+ASJHLS7t8t8N0FjpKbroEwbTUI+SiH6uEi0geM/VjkQqaLqzVgMWRZUa?=
 =?iso-8859-1?Q?1HuFnzLX0eA9MNLP+qxMGTXiucGXgEGtdevrOVZ3dy/7zut20nzBke/ody?=
 =?iso-8859-1?Q?IPMOqF3hqxwalyd3lSHY19DCx37H7zGB5M84tby7u67McXn+R+Vs3mQ/Jv?=
 =?iso-8859-1?Q?2BZA7wUh7yK3VLyhX2T4ytXNZHm4pLfzqGGO2TyJLc/WeTPOm9Aw37mdSt?=
 =?iso-8859-1?Q?qdseOzmgPyPb7P/5Yt8olYMx2Bg3thnYTnpOVJUooFjAvahE1nl7wwlQsM?=
 =?iso-8859-1?Q?YsoG+QvVilGePgM1iK9zA+R3GuYTfIo7FrGDgXq4wy7AmHj55MjlUc6oOf?=
 =?iso-8859-1?Q?1rOcpidgkL5CEMPq978KJqitVBcgebZxR/V0y6cn3hUOZ8RSd2m1HvBtQx?=
 =?iso-8859-1?Q?mzgIarrhk8aBR5S03JIcBYJ0RNFOpwHI1UkJ1TSTOcNJi10hdnsmiZro+G?=
 =?iso-8859-1?Q?Qlf3v5w3+zJ48ebqdbqbVaCqbRz3hesiwwhzmQDuiRRKWX0q8OY2n8q4Ih?=
 =?iso-8859-1?Q?PiacLCp3HYj5FSY+rn7OfbAyknSgWRRO5qqiv9YGDOMrk3CsMGKa7b+W0a?=
 =?iso-8859-1?Q?rBz9PmgNBmQaSbNU13GmkX1RZLWEZMK4SZCkc2DCOihSM0jHRT+HllYAUY?=
 =?iso-8859-1?Q?TQ4tbVh9T0/f0J7uWfjoS3CspretiHDbWgtINtecJqnFVyXtkNIQMQT65M?=
 =?iso-8859-1?Q?L0uiV0YXUiWc2uiaEq7Usy9TWsrFPMbgLAvzywYlK5uDajp+qmI11xBAAI?=
 =?iso-8859-1?Q?LqEAduvWHjeB/rMAIsuC9FMX3/tI4WOWkIhXh5+YMhxJjILRVvk03NCc38?=
 =?iso-8859-1?Q?wlzm7GSzwYwW9BUKFU19RuMGzllfviVBhOGeSzHQ8s6mi/z6mA2dCpWfh9?=
 =?iso-8859-1?Q?lVVWaiVE+OzDIAq5eX4pruX4dsWC20EzyKSMr0u1QUIW/QrdOlOirg/30F?=
 =?iso-8859-1?Q?M3Lb2TonDV2WyxwXpszzew6Y8hMMuqGqsSE0+H9PTxGwPiDLJBs/M9CPuw?=
 =?iso-8859-1?Q?IJg+5K7mcfBtlUcLoq3FQeUgV/dPnyV+g3hZD7+27sWOfBZmI+6nZAubtA?=
 =?iso-8859-1?Q?CaW48okE2TKi8vgoqZxFjfG1b/s7aJpSi+R39UqkgFjJMK916vmpjboBVb?=
 =?iso-8859-1?Q?dmXWypkWgJOMtPjCZZZPlRSyuKf0ab3aj+Odk9gNZUDdlV2aZSg0FKTXn1?=
 =?iso-8859-1?Q?8THuO7c8wv6aIAez2ho23JE7UkzbritLxccp0jkolBvhmoqzebhay/OI0u?=
 =?iso-8859-1?Q?6MTybth2AuaJmo6dNAyCD7xOFaAA/hOkdhhgZau7baaiDjZiEJRg9eCtOv?=
 =?iso-8859-1?Q?E87vXbSc5j++ZZ9V2TR/rmVXW6Xh4V6v3pSfpA6fXyz6L52Dbv2OSyePcN?=
 =?iso-8859-1?Q?9FIMlJxSi3/1dzpHRwOlZYM2g0+QAAbEVeL8nnhX4eHzzy30pBNAN3E6XN?=
 =?iso-8859-1?Q?BQ2iVSMgvUeAgtOMrTcPhYfn0Mfl+WmBoGQJ8cyX2Z4SCrHvuQGA4vV2uZ?=
 =?iso-8859-1?Q?YF3lcLpRPt3vdZAnNuk8vCp5cbs/TgkgVZHyVqhsHXCmTt9PMNLRdF54cT?=
 =?iso-8859-1?Q?HDPJjhmNnpIWZca0G+AG223IZJGZQ05Bssg7ONgbaFLFbjLU9Dd9LAUjpP?=
 =?iso-8859-1?Q?576KF4eKj+kCCKSxalD+7PAaiIfjoexZZstGFlZAoaGWRVb/Jq2HfKsw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NMEonBCrGeQf5u2YiYI2fBQIoaJwzKSGXLwLqWV+MROsDYXAknz7lPjnTNaAbvqzo0ngJCVFKCT038+siC7tBUyogKHbLo7P116D2zStcc6dwebXA6kMJmSMBZ+lVTaqg7WtB9jmOF+qtDDyYnwIdk83ei53/vo3dWn3AMSb8gc/MZ3yY8SoHoz7QfSd0OQHyOIhd9l28gUPxQvILqmoaKbxOn696AhODpPfNpa8AYszIAmDvPw3E0PDj0nfAiMlcDnEBEn9zWczNqfCjdvra9NSYKYxCznfkcfDfEhofi9iLyvnugGy/m2XinWgQeUojOkoJ2TnHKCOh8d8iH5TK7+kX3UVeed4rOlfSS6IwT0N4p6dy+j29wzA8kLukjXejsBLb1Wg9X/elQT1on6QEaKcwO4Q6nAtnk61cT7oE4zecDSIRGhTwqSRAhWjxAOHLsSQvQoufi8inLEJuRr6x1hbBQIA1NtwNi1G8LTLpNVrRZXAOPl2n5XNTdRmo1leTKIXRd9IS+lDR2BmOjQusJhIUQUvFkA+yTnke7ewGqjTdS5HuRt+jfjPp0qGKrDLrhUH23/XPuQehpRc/383NzXHYhPa9e/iADITVD2kx3c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ac97e2-d8bc-4d15-97be-08ddc3e8113b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:39:24.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcjd23bBN4pqt7QGHdAAc0f593s5plw/sazdvFedZkmC73w+4DCWz5VeDodyVt2m3e7KdybgI4xTH/o9XnujOE+UprJMMEi0+EVxoFMVjSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150200
X-Proofpoint-ORIG-GUID: dW0bkRaSG5xCyAMMPe7v-xuZkp4bzT7O
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=6876ca91 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=UY3pk_gtXu1VnLzoPhcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIwMCBTYWx0ZWRfX4tzSAf5U33TA HISyGgeO6vGbohf2FiHvvZ+p/XTYZmKYZLD2tfzO0rzacagLWAjz6A/uRYdI5/LHYddMv70aUf5 5EedSGxO75aTP1TIXhzGrsyhu2wYTm98xmnl9IrG3CBOtrDGRGfp0KB2klqtGMMLT1+kNYgPkY+
 XkpT2b1f9/82Nn9WcO6IBRc0yX5WkV46/BAfGkeuvvzpYC7ntw2C0ndKicHFpkMijsFMYEoh/lc DIwSl0gRRUZ5GKeBziG2pRFfXXEfo/+umUNNEG0orhZJfixKKc6/JDZ8ULZcOxGJ65hsEYM0Xul X9yFil8G9h53SS+e6+fwmBgOI6oVDb7ThoDg5246MkN/QIHNgJ2qIlc3MlxQcAFXjfTYy7GjqrN
 zWKSBvGd2tqyWvghoD7bDA793xd+1UIOQayVEzaTvxKK6tvImtKAea9gMtgbdw11Dd6JaAgw
X-Proofpoint-GUID: dW0bkRaSG5xCyAMMPe7v-xuZkp4bzT7O

On Tue, Jul 15, 2025 at 05:22:42PM -0400, Eugene Loh wrote:
> I'm late to the party, sorry.
> 
> For usability, could an error message point to
> /sys/kernel/debug/error_injection/list?  Might as well provide useful
> information at the time of encounter.

Well, yes and no.  Compilation errors rarely print out documentation.  Pointing
at that list is not really useful unless you also explain what it means etc.
Which becomes too verbose.  Honestly, this is a feature that should not be
used by someone who does not know already what they are playing with.

> When you parse the list, you expect the function name to be terminated with
> a space.  When I look at my list, only 7 (out of nearly 1000) are so
> terminated.  Shouldn't you check for a space *OR* a tab?

Ah yes, fixing.

> When I run the tests, I get an OL8 UEK6 failure on x86 for
> test/unittest/actions/return/tst.destructive.d:
> dtrace: could not enable tracing: Failed to enable
> rawfbt:btrfs:open_ctree:entry: No such file or directory

Hm, I'll have to look into taht - I expect that it was not available in UEK6
(or the config wasn't enabled).

> Also, there should be a test to check that return() actually does the right
> thing.  I'm attaching a proposal.

Let me look at that - Thanks for writing one!  I'll check it out and almost
certainly include it.

> Typos:  "injexction" in the commit msg and raa as Nick previously noted.

Fixed.

> On 7/15/25 01:48, Kris Van Hees via DTrace-devel wrote:
> 
> > The return() action is only allowed in clauses associated with a rawfbt
> > probe on a function listed in /sys/kernel/debug/error_injexction/list.
> > Use a reject_clause() callback in the rawfbt provider to enforce this.
> > 
> > The list of allowed function is only initialized the first time it is
> > needed, and its content will be stored in a hashtable for faster
> > lookup beyond the first.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_prov_fbt.c                       | 134 ++++++++++++++++++
> >   .../actions/return/err.not_allowed-1.d        |  27 ++++
> >   .../actions/return/err.not_allowed-1.r        |   2 +
> >   .../actions/return/err.not_allowed-2.d        |  27 ++++
> >   .../actions/return/err.not_allowed-2.r        |   2 +
> >   .../actions/return/err.not_allowed-3.d        |  27 ++++
> >   .../actions/return/err.not_allowed-3.r        |   2 +
> >   7 files changed, 221 insertions(+)
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-1.d
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-1.r
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-2.d
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-2.r
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-3.d
> >   create mode 100644 test/unittest/actions/return/err.not_allowed-3.r
> > 
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 50fa0d9d..b98d8d87 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -591,6 +591,139 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >   		free(tpn);
> >   }
> > +/*
> > + * raafbt only:
> > + *
> > + * Accept all clauses, except those that use the return() action in a function
> > + * that does not allow error rejection.
> > + */
> > +#define FUNCS_ALLOW_RETURN	"/sys/kernel/debug/error_injection/list"
> > +
> > +typedef struct allowed_fn {
> > +	const char	*mod;
> > +	const char	*fun;
> > +	dt_hentry_t	he;
> > +} allowed_fun_t;
> > +
> > +static uint32_t
> > +fun_hval(const allowed_fun_t *p)
> > +{
> > +	return str2hval(p->fun, p->mod ? str2hval(p->mod, 0) : 0);
> > +}
> > +
> > +static int
> > +fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
> > +	int	rc;
> > +
> > +	if (p->mod != NULL) {
> > +		if (q->mod == NULL)
> > +			return 1;
> > +		else {
> > +			rc = strcmp(p->mod, q->mod);
> > +			if (rc != 0)
> > +				return rc;
> > +		}
> > +	} else if (q->mod != NULL)
> > +		return -1;
> > +
> > +	return strcmp(p->fun, q->fun);
> > +}
> > +
> > +DEFINE_HE_STD_LINK_FUNCS(fun, allowed_fun_t, he)
> > +
> > +static void *
> > +fun_del_entry(allowed_fun_t *head, allowed_fun_t *p)
> > +{
> > +	head = fun_del(head, p);
> > +
> > +	free((char *)p->mod);
> > +	free((char *)p->fun);
> > +	free(p);
> > +
> > +	return head;
> > +}
> > +
> > +static dt_htab_ops_t fun_htab_ops = {
> > +	.hval = (htab_hval_fn)fun_hval,
> > +	.cmp = (htab_cmp_fn)fun_cmp,
> > +	.add = (htab_add_fn)fun_add,
> > +	.del = (htab_del_fn)fun_del_entry,
> > +	.next = (htab_next_fn)fun_next
> > +};
> > +
> > +static void reject_clause(const dt_probe_t *prp, int clsflags)
> > +{
> > +	dt_htab_t	*atab = prp->prov->prv_data;
> > +	allowed_fun_t	tmpl;
> > +
> > +	/* If the clause does not have a return() action, allow it. */
> > +	if (!(clsflags & DT_CLSFLAG_RETURN))
> > +		return;
> > +
> > +	/*
> > +	 * If the htab of allowed functions for return() does not exist yet,
> > +	 * create it.
> > +	 */
> > +	if (atab == NULL) {
> > +		FILE		*f;
> > +		char		*buf = NULL;
> > +		size_t		len = 0;
> > +		allowed_fun_t	*entry;
> > +
> > +		atab = dt_htab_create(&fun_htab_ops);
> > +		if (atab == NULL)
> > +			return;
> > +
> > +		prp->prov->prv_data = atab;
> > +
> > +		f = fopen(FUNCS_ALLOW_RETURN, "r");
> > +		if (f == NULL)
> > +			return;
> > +
> > +		while (getline(&buf, &len, f) >= 0) {
> > +			char	*p;
> > +
> > +			entry = (allowed_fun_t *)malloc(sizeof(allowed_fun_t));
> > +			if (entry == NULL)
> > +				break;
> > +
> > +			p = strchr(buf, ' ');
> > +			if (p) {
> > +				*p++ = '\0';
> > +				if (*p == '[') {
> > +					char	*q;
> > +
> > +					p++;
> > +					q = strchr(p, ']');
> > +					if (q)
> > +						*q = '\0';
> > +				} else
> > +					p = NULL;
> > +			}
> > +
> > +			entry->fun = strdup(buf);
> > +			entry->mod = p != NULL ? strdup(p) : NULL;
> > +
> > +			if (dt_htab_insert(atab, entry) < 0)
> > +				return;
> > +		}
> > +
> > +		fclose(f);
> > +	}
> > +
> > +	tmpl.mod = prp->desc->mod;
> > +	tmpl.fun = prp->desc->fun;
> > +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> > +		return;
> > +
> > +	tmpl.mod = NULL;
> > +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> > +		return;
> > +
> > +	xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> > +		prp->desc->prv, prp->desc->mod, prp->desc->fun, prp->desc->prb);
> > +}
> > +
> >   dt_provimpl_t	dt_fbt_fprobe = {
> >   	.name		= prvname,
> >   	.prog_type	= BPF_PROG_TYPE_TRACING,
> > @@ -628,6 +761,7 @@ dt_provimpl_t	dt_rawfbt = {
> >   	.populate	= &populate,
> >   	.provide	= &provide,
> >   	.load_prog	= &dt_bpf_prog_load,
> > +	.reject_clause	= &reject_clause,
> >   	.trampoline	= &kprobe_trampoline,
> >   	.attach		= &kprobe_attach,
> >   	.detach		= &kprobe_detach,
> > diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
> > new file mode 100644
> > index 00000000..246a68b1
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-1.d
> > @@ -0,0 +1,27 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: return() is not allowed for fbt probes
> > + *
> > + * SECTION: Actions and Subroutines/return()
> > + */
> > +
> > +#pragma D option quiet
> > +#pragma D option destructive
> > +
> > +BEGIN
> > +{
> > +	ok = 0;
> > +	exit(0);
> > +}
> > +
> > +fbt:btrfs:open_ctree:entry
> > +/ok/
> > +{
> > +	return(0);
> > +}
> > diff --git a/test/unittest/actions/return/err.not_allowed-1.r b/test/unittest/actions/return/err.not_allowed-1.r
> > new file mode 100644
> > index 00000000..e3443c30
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-1.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: could not enable tracing: return() not allowed for fbt:btrfs:open_ctree:entry
> > diff --git a/test/unittest/actions/return/err.not_allowed-2.d b/test/unittest/actions/return/err.not_allowed-2.d
> > new file mode 100644
> > index 00000000..e0d303c7
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-2.d
> > @@ -0,0 +1,27 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: return() is only allowed for select functions
> > + *
> > + * SECTION: Actions and Subroutines/return()
> > + */
> > +
> > +#pragma D option quiet
> > +#pragma D option destructive
> > +
> > +BEGIN
> > +{
> > +	ok = 0;
> > +	exit(0);
> > +}
> > +
> > +rawfbt:btrfs:close_ctree:entry
> > +/ok/
> > +{
> > +	return(0);
> > +}
> > diff --git a/test/unittest/actions/return/err.not_allowed-2.r b/test/unittest/actions/return/err.not_allowed-2.r
> > new file mode 100644
> > index 00000000..758d3477
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-2.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
> > diff --git a/test/unittest/actions/return/err.not_allowed-3.d b/test/unittest/actions/return/err.not_allowed-3.d
> > new file mode 100644
> > index 00000000..770565c9
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-3.d
> > @@ -0,0 +1,27 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: return() is only allowed for select functions
> > + *
> > + * SECTION: Actions and Subroutines/return()
> > + */
> > +
> > +#pragma D option quiet
> > +#pragma D option destructive
> > +
> > +BEGIN
> > +{
> > +	ok = 0;
> > +	exit(0);
> > +}
> > +
> > +rawfbt:btrfs:*_ctree:entry
> > +/ok/
> > +{
> > +	return(0);
> > +}
> > diff --git a/test/unittest/actions/return/err.not_allowed-3.r b/test/unittest/actions/return/err.not_allowed-3.r
> > new file mode 100644
> > index 00000000..758d3477
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-3.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry

> From a6a6ceb614fadd5c5d1116cc05fe71da2b2dbff7 Mon Sep 17 00:00:00 2001
> From: Eugene Loh <eugene.loh@oracle.com>
> Date: Tue, 15 Jul 2025 13:33:04 -0700
> Subject: [PATCH] test
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../actions/return/tst.destructive-getpid.r   | 12 +++++
>  .../actions/return/tst.destructive-getpid.r.p | 10 ++++
>  .../actions/return/tst.destructive-getpid.sh  | 48 +++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 test/unittest/actions/return/tst.destructive-getpid.r
>  create mode 100755 test/unittest/actions/return/tst.destructive-getpid.r.p
>  create mode 100755 test/unittest/actions/return/tst.destructive-getpid.sh
> 
> diff --git a/test/unittest/actions/return/tst.destructive-getpid.r b/test/unittest/actions/return/tst.destructive-getpid.r
> new file mode 100644
> index 00000000..b6bdf211
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.destructive-getpid.r
> @@ -0,0 +1,12 @@
> +pid is mypid
> +mypid
> +22222
> +mypid
> +mypid
> +55555
> +mypid
> +mypid
> +mypid
> +mypid
> +mypid
> +
> diff --git a/test/unittest/actions/return/tst.destructive-getpid.r.p b/test/unittest/actions/return/tst.destructive-getpid.r.p
> new file mode 100755
> index 00000000..d6593c46
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.destructive-getpid.r.p
> @@ -0,0 +1,10 @@
> +#!/usr/bin/gawk -f
> +
> +BEGIN { mypid = -1 }
> +
> +/^pid is [1-9][0-9]*$/ { mypid = $3; }
> +
> +{
> +        if ( $NF == mypid ) $NF = "mypid";
> +        print;
> +}
> diff --git a/test/unittest/actions/return/tst.destructive-getpid.sh b/test/unittest/actions/return/tst.destructive-getpid.sh
> new file mode 100755
> index 00000000..7c44dde9
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.destructive-getpid.sh
> @@ -0,0 +1,48 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/destructive-getpid.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make the trigger.  It reports the pid 10 times.
> +
> +cat << EOF > main.c
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +int main(int c, char **v) {
> +	int i;
> +
> +	for (i = 0; i < 10; i++)
> +		printf("%d\n", getpid());
> +
> +	return 0;
> +}
> +EOF
> +
> +$CC main.c
> +if [ $? -ne 0 ]; then
> +	echo ERROR: compile
> +	exit 1
> +fi
> +
> +# Trace the trigger.  On the 2nd and 5th getpid() calls, modify the result.
> +
> +$dtrace -c ./a.out -w -q -n '
> +BEGIN { printf("pid is %d\n", $target); n = 0; }
> +rawfbt:vmlinux:__*_sys_getpid:entry /pid == $target/ { n++ }
> +rawfbt:vmlinux:__*_sys_getpid:entry /pid == $target && n == 2/ { return(22222); }
> +rawfbt:vmlinux:__*_sys_getpid:entry /pid == $target && n == 5/ { return(55555); }
> +'
> +
> +exit $?
> -- 
> 2.18.4
> 

