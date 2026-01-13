Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A17245008
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340534; cv=fail; b=Uh1VBSsIYcYTUxAjmnBk2FRX1/0RSjZ/DTKIUk2iS3V4yCMxouQBr9wpwu36aypNKvLo0DwjebnRjGAWspweQqiGMrt8n9iqnBNvuYrkwNxymxB3dcyBwWyUC5xfKRVxq6vItJa6rsk6LKsH2FhKYsoIr8ATPIYCG+4MRjiiC6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340534; c=relaxed/simple;
	bh=+sgdb24YmlET+bMHZI66Q1zrQCH0jXqgG7ksOOI+bp4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DMQdUuBPh0TED40VMBajBFAppy/Z/qvCagjcCHQuxvn5TwWVgq7QCz1gZ0AySfkorl2oeaSR6bMOgOeZ9Cop2ewoQ1f48EWq8obyxukjipY65k39l++0XbOq6mJRGYw16+q8PEZOF5c9W/mUABIXhTDi43jPyZ/aKSQCpgg97R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BxfohVaC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZmNY+J4J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BxfohVaC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZmNY+J4J"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGH4H72677746
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=zlfIT2QerrDpGtY/akqOQoQ71Vxqj5E5gZWEV8eOb9M=; b=
	BxfohVaCXTbgzI5NUqW9XFzyi+wLfymbrAF9Zb7mFi/ppKxmKGXZAPZVItN34IIN
	60r3Ni1jGX5oO08obz4n86KSsCiVtdqWdAeRQ6Sbw8mI2eV8lAb+bH/rrs6p2bYA
	0j3f/DPuBUoRwJJ8AOJiDnI/Nx8VJrQFpH7bb5PgCQwYjsBnLmEYPw0w4+sI5Km0
	I+pbpYYh/+3SxviB2gOaDHSS79Tt2vIb1icWgR2bfrCUIeuzQFMTtiVcJad1o0MV
	tztjsRoZXwiI+TEua5Q5ZE37nFGfrTbRFaQI8LUdxLVsYx6TVC6X4lXZpe0v/Xm5
	qZlY04Ay87kERXpZXVfEdQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrgnv832-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DKriHj035374
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:11 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd799kuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH5xCbaFdQw29k769MBcKN0aOphGluj/czZn75KWQvNCH9SUGEItpLyxDu9HsKdQcPBilFYuGbXYzEXYmSewYO63TKYZioEyPe9FWN1exbiozF/ipEbKpNYmOvomdiCbYJUjIAIOqjGnmeCFlgsYqEcbxyH8DVL+p18QPoHDqd/KBvP9puAxxtp6XNsoiQzDsSFHRihp3RqZRo9b+BcI8mrgJzNxrbVycIiD78l9MFRF91DPt/JDaD9UJvIgSZIxgONQCRPpUhbg90cgBmW0WmHB76vOMoUC01EtvRx93HMTjaMF2FaSmi4Rb4m/LCAW4/HRkPlrhdJcxQkKuWCMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlfIT2QerrDpGtY/akqOQoQ71Vxqj5E5gZWEV8eOb9M=;
 b=CYetq97UpOAAjeiYZ3TGCmkebnwvtMcrFu0RFwRtiqiqiXkvToZMNz2lf/v++cLKwRjiRHUH/+h3mpvsO+ko0Cj7BlH+/WXLS0gq49P5JDuGr/9ioyLSxk7gNVDVLArtmGTMus4BlwssEYqgN4VCwPwXyNgYbClNprIvEo1j6lg9VxIARyIM84g3gDk6aH7YzHBheVbLyrEdkL+sSgm42BJbyZfJBBXPCac950aRUmaeXuUf/epZyoRxgO3ZM/jsIzHeKOoT24tnedj66rv6pcJgrs1qno+uC180q5tDIjEZ8RaX17fLBXEL8JvjrpRdqiv6dlMNWdTrinhHc/sKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlfIT2QerrDpGtY/akqOQoQ71Vxqj5E5gZWEV8eOb9M=;
 b=ZmNY+J4JijPiNrOOFqy03n85sFxPemwxFRX3jnelWcUHR6DOiJ7uAp2sj74eNg3Kgtf3qks2HyeaT7+PkJLRhddlFxOgsE6Uev7fqzaHsA003BrSgnFjj4NO7J9h/8gTBRq+6Wkq/kVFQPw239oxDb+kwow5Gp693uOAFkjDGEs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB5914.namprd10.prod.outlook.com (2603:10b6:930:2e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 21:42:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 21:42:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] fbt: Populate just once
Date: Tue, 13 Jan 2026 16:42:04 -0500
Message-Id: <20260113214205.9159-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bba2a16-69da-4674-f6c6-08de52ec9a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3jdlHJCzoQCoz7hWaVC2kSt9u5O2OltsWR3kKYy9+mvIcLCZiRySavPyGT4v?=
 =?us-ascii?Q?AVTHdUnCQhmyepaBLqFt7rYU6zQmDOBOdSqR+/XI7Tq+WApr8mUqJLuSaMq5?=
 =?us-ascii?Q?gwbjb/jg5Dwa4NDLrKWdsUa6tZmkhYlx69qzrsAIkW2Cuh0KF/bPeAUoPUVf?=
 =?us-ascii?Q?i2WhStsInhduuoXtt8uV8PpEHov4Xt+1kiizl77E1RxaBE3yvIVX2nZ0O+wy?=
 =?us-ascii?Q?nkb4Dk7zbq2hqQQ5jhX6rRYtXPg0pryeaUOrL5TO/wrNU5hIRPHhhEfl5NCA?=
 =?us-ascii?Q?Fdl6IYzKxinAMx/hyfXfceF7SFgG2Rg3OtcLfhqBJHcHO8Besl0A48PfeHR7?=
 =?us-ascii?Q?UK6Vff20zf2m4Fo9ILmUjBbKmQHjr77Uv4KShTBlZj2JLu5FFoYYmjUCpZw6?=
 =?us-ascii?Q?ikNKpgJrq+mt4VNl6EUOweZcIULo0G4jBXKw/kFYX7P2r1mRP0ovc4z7jiZC?=
 =?us-ascii?Q?ZOcnDcuy0CjP1hDkWfOAWIuwZKoZf+/qBF+LDAjI0tURhsTwN0fzZJhSp46O?=
 =?us-ascii?Q?qHiiTs+giDE92IYWIA1xDdm691wfAzw6MzYX2l5gYSvBouxEX78hUUYyzZdh?=
 =?us-ascii?Q?3svaWA5vqW/O2+UsMsIACtS88OdVhAkdtjyK1dVR3hkbVmrj8BcFdoqSac+C?=
 =?us-ascii?Q?K0Zwx3srQw6FzorEygBTLRY5h672Aav00lBBANwo3HVA/WlaNmp5ONRaTL2g?=
 =?us-ascii?Q?/kVt/kTlnsjRLLQlgzrYiaYl9McBrWlYr8TQUn2uVv06n6Mlfilc9mAUZGZO?=
 =?us-ascii?Q?6bvzt2/NaYKI+qNVdW8ozW4/JwAsclVsQlppQVvK/TRI+6qTfLurvMjx4fMQ?=
 =?us-ascii?Q?4vu+dfvOmDyUWSJuW3tAnG6xGadpKbzP0I1uIxlJm6EXpO+weume0Z2CNsxq?=
 =?us-ascii?Q?JzKaj+MZvlMln22oY9dReQ7+XLRsvSBiptifLq/GV7G1RyEXCfSFRWeHIrkw?=
 =?us-ascii?Q?AWMNfIvZhcU6II+ZTXG8B0pKe20v7KtNA9Tz7olXGlzhPhymsMOnD1FKYZ9Z?=
 =?us-ascii?Q?ZeZNGQfNgW4YU6B2MLtWT+ilyKMntyPelYzy1JDW+t6q9Bg8x3arc4/Mx/cd?=
 =?us-ascii?Q?FNDXrArfor2kH7llMQYQUpn/F0WMAVgrK5efXcLzcDgCwMYGYsuE50TpAGvm?=
 =?us-ascii?Q?dZb/pdTUrNgj4uKZZJmjme9nr7hkabRQU3oB1HKl+wOdB8G8cKFgR7XGN0wU?=
 =?us-ascii?Q?4vPuJRL8DMMDNASasgkYpUkNdcGVurT8qBAUYSt3SgJgcKLJN8hA9b0Ucdtg?=
 =?us-ascii?Q?MMaPRuPv2hO843UT1SQlkzdJ4VCj8NxnheknQ8Krt/vdOviKKtQDkeB0VJBP?=
 =?us-ascii?Q?RvJwnspQcYcNdmxiA2c7LgJlRjZJjk90gtGRT3V76kO6fu8fiQ1bLI8tHqtr?=
 =?us-ascii?Q?HU5lmW/0i9ZiQmYZqQ8R8HKaUlvc7rkDhTIfvuUWKtDFjf9cUDv+XXINHinK?=
 =?us-ascii?Q?FU9Pb2ESFdVtO4oclszfvrHEcy8/b8rv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wZXqY3ZRUjxU5Ry0vf5tRlDzaZN8MR4YdZAakXVjW9qQ1xJ+z1wt4Jx7i4oG?=
 =?us-ascii?Q?xmFb/n71qmFyO4uuY+nFqLvliBLrZjvaAN5Ni6PssuB0D0XcTe847SExPxzY?=
 =?us-ascii?Q?i1XqnATJI++6oo35DewwDMs618rFTDuATshkWPBPA0WUHdRjTVN2o9Tg81PR?=
 =?us-ascii?Q?FOCnRLOxEwsVU4HRqzPFXpxmCwMKH0m66gmwPtIb4kxanrmcuLHLB6JB7/DO?=
 =?us-ascii?Q?B+Q/tFNC8a4feamiuUhwFngc60oe/d/GtBecJHKjgbPJ8cx+edqrFijp22d6?=
 =?us-ascii?Q?U5K9Ongl5afO3Mgsa8kEv+Ngq6N8hIO3DIF1NUQufnODQeP6RFv9KoLGxLTQ?=
 =?us-ascii?Q?/mEnNqbIMJgSvKrPs5tOq5CaKIBbPHftxLj5x4SGzgfdkikJJF6eOcJ0R3rl?=
 =?us-ascii?Q?9k0fBVrxd/tctgB+vB66i5zk9rg0E2iX60IpTCxF5Yj62sHl/ea/KhlUE723?=
 =?us-ascii?Q?mpCGpjhVIbkORiJbOLRJBH+xTg0Mrlkfm4ctmmkB2I1vAXqNIkDO4joFbfr2?=
 =?us-ascii?Q?fx9bYl1Y7UCTtT8A0RjKehDgOu0/Ra59LodfP/LB+03tTydyZS4y1RrT2xFY?=
 =?us-ascii?Q?EPufGXEGgJG3c3R/kC1668SJBLNH1DUKRV0bhQ+RLUO+Y2/qtsCDDoKX/H9F?=
 =?us-ascii?Q?3Zsy8dEeZriYWp3uWDqMkB1iSdqWdgNe33bEIJJ0zyz0FTgJdIn0eN9Vr1wu?=
 =?us-ascii?Q?sblWGISj6V1ebEKPW0uTtXkQK2jMJUcbT4bRFO5C8tOc87lbAgT7I3bbXljl?=
 =?us-ascii?Q?I8YUP0pWhuXAeVyUOEUdRIwDMjVslPeSuUgeXgyx+nCn5B1d31Aqn1HwgDza?=
 =?us-ascii?Q?9cG0KEirv7ThhmX3GKOPgjfSoX7fCyHZkJ8ne0qzSAApcnJljDx3nwCK5eGI?=
 =?us-ascii?Q?FUxLHyqTHXq68qjXDMqHrWi/SMlSwOEsQVxOwl+5aNlX89lkUoB68Elvrn6o?=
 =?us-ascii?Q?mJsMnyBkP1DZygLxdXEBrJYBCjCZ/oAftTkhLSsSvtuLvQOCVluuqp/BYJ5n?=
 =?us-ascii?Q?2ADskDL4PQAK344yv49GQIb96+SReScR5R6lTjyg/DjxBr7V0D4QViBPFZJd?=
 =?us-ascii?Q?XZJ2bIiLKNx87T2sWV6X6w7dXP1IrWCpVuKi9ZWB0KfUOaeRLsJ8Nfyh6nBJ?=
 =?us-ascii?Q?OWP9uSTrvdJx8+V3srnLsGSkKC6fe/PUmddAw40wVgIzI37iYwK/KKz5N9L1?=
 =?us-ascii?Q?wh9XIjszg06kucjinIVtD2ve1kI5DdCKgXobVYBBCNAtmRu2POlllo4wwXpo?=
 =?us-ascii?Q?jtcJ2pFWNT54DpHROg0UyZEsbT1UwnnO/Dcti9pqBKkmEPFTVO3Uc4tJ9JIz?=
 =?us-ascii?Q?oBMpiVYHdh60/fKvpmSMCGi1dhtJ2uA7LlkIF46c1LmO5pwJbVImqIwfhppy?=
 =?us-ascii?Q?eVtvtRjwyQJBHTVD0tf3m7PZgW+iQnvTZkJIKIeGtMCrUE9IOOJSKIxpN98A?=
 =?us-ascii?Q?b3u2GiwEecy6Ja5PuNwki+BgR3Rr++5Vf2Ymx3+u6TGZva8V1SqqSTGt0FIg?=
 =?us-ascii?Q?VTioQyb7x49j4I/7mbZy6DMkP8sXUQBPLYMoyl+C3wqKieRCry2BVYvBGjH/?=
 =?us-ascii?Q?i10qA0CZ3rkj3oF9wAHPTuzk66pNo0Q+m08TcDP1xVcAC+Y7iA7RMnmE3HkY?=
 =?us-ascii?Q?W7b9hZtjjYZx+pCXIH2nrfraN6He6HXHyYD3cUV8TvOU77Tfb4F+IWQ/JAHf?=
 =?us-ascii?Q?WqRu0YVZXBMchn8UJNWcOI5MD67i6C1fO3V4uuvJb3VvbLXFBN9YR5peSMdb?=
 =?us-ascii?Q?poDhvAC6Gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i6sFf+9oNe8nUV6p/jmASgx60vfPs39kPZ8B8PagMjwNknc4n81fTobazhLYgz+eF8sLNO1OvFFjaGISeUS8H/lVuv2uhOkuu3TcDe2ELFnzgf/KVrKyhfJJC8qih9BQ/BH6tXwhzQehRb8+wVtL+R4z+Jo041LH4bzQ1brjTctta7YhmrnFGHG3fr7iZEjm8/PRM2On5wOu4toDxQorRh2wvQU3kYv3m7bR6CajTYlwe8vUkB1KmRTG+bJCyivJkq7O/3EjVGrjj1gZpszW015j7ZNDWjx4x31MsBiN4rzaZ2Ai4SYICVfPDqF10WD382/lyH6QvXpwDEbEkITcx/jtWrJCCkfEKiomvlYm6keAG64DzaQlMyLCNnCQn8FEN1FRMthOuNtVbxYH5LL5zbC8UT03llZw3p1BSj2QLHLZHLbtk1AKqlxzZYgK/GHJpMTgyOgxUoShpnPxM06oatA61faGsvmWbEhglOj223LkqnCQpGZmFXgG9+gUzV3irLfRNkuZcvxkWsoo6GMTMrHkF8W5d24RWwfx9Q597lcmI4LYMOTcsJTrBKdYVlSZkSiVUMHKv29n2v6SlEPGtmuLCq+nU10fq3qnJjQCODs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bba2a16-69da-4674-f6c6-08de52ec9a14
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 21:42:08.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PywTt/RzzRpLY9BWpVs3FvvRhsNl6AU+1q+CpOUnAMfIMShEGaFjdYYQekJNVZLN2GBORVbOy1t9RWbODctEHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130175
X-Authority-Analysis: v=2.4 cv=B/G0EetM c=1 sm=1 tr=0 ts=6966bc34 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=3EjMTLBuI_ZVlQ88KH8A:9
X-Proofpoint-GUID: P_nbU3vIN8g0L_l-gT_Zyl9tgLQ0mCa4
X-Proofpoint-ORIG-GUID: P_nbU3vIN8g0L_l-gT_Zyl9tgLQ0mCa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3NiBTYWx0ZWRfX9m5JsKavXOim
 vWZJZmqO1jsbttKEL1q+UvlDdSVapLBTdUgReHFOgiNWy3pPvNdPb8nJEt7vUbZ0OO0IuMaJ7Gb
 locRbn9AUdWdIvLApX+OkqCkSmTBToekhMwu4BRYsipwCBAat9jRo5VA6TDAiCVfz//tTi9jGNg
 +uqQpveqFzjzahNnrcTCPDOa/uf/lcJ0Btyotgqf25Tjgx8Gc8AHwHVeLnE90Mx34vOzRUbLv8F
 M0/KjjfnwMtyqXNmUIo9n3Z0gn/5X5t6KncXdQJ/0HcHvfarQm1kqg1vUtgghmN0b0OXPLiUXFK
 BXr8EHgqqJ6FUcQdSbQGKL9jd71ANUviHefsa++41UNY6MSjku78ss3zRZvy1tvVwqXmk2fCAzf
 +sh4zhObkoZx+veNp6A2n/oZstO5yjOvNflTtuzsYFHsK2i9GuwpRnw1KsHNScYuDXhj3MAFtA9
 d2mJO5hXf3QKOx4Fb/g==

From: Eugene Loh <eugene.loh@oracle.com>

In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
the populate() functions for fbt and rawfbt were combined, populating both
providers, but the function was still called twice.  That is, dt_open.c
tries to insert each provider twice.

One solution would be to have a different populate() function for each
provider.

Here, we employ another solution:  in dt_provider_create(), check to see
if a specified provider has already been inserted.

This also requires a corresponding change in dt_provider_lookup(), so
that it will work even if no providers have yet been inserted.

Also, fix a minor comment in the fbt provider.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 2 +-
 libdtrace/dt_provider.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index bbe44a842..3feac56ea 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -228,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		if (!dt_symbol_traceable(sym))
 			continue;
 
-		/* Function name cannot be synthetic and must match. */
+		/* Function name cannot be synthetic (unless rawfbt) and must match. */
 		fun = dt_symbol_name(sym);
 		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
 			continue;
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 848fdc132..9d75225fa 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -114,6 +114,8 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
 		return NULL;
 
 	strcpy(tmpl.desc.dtvd_name, name);
+	if (dtp->dt_provs == NULL)
+		return NULL;
 	return dt_htab_lookup(dtp->dt_provs, &tmpl);
 }
 
@@ -124,6 +126,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
 {
 	dt_provider_t *pvp;
 
+	pvp = dt_provider_lookup(dtp, name);
+	if (pvp)
+		return pvp;
+
 	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
 		goto nomem;
 
-- 
2.47.3

