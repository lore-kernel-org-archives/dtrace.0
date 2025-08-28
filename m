Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677020ADF8
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756410033; cv=fail; b=X8BWneE1X2oyceLxP4ZItCmp7OyMCgWcYpAWAKY5sX2ge5Py2CR8ww7wgalFPl3NnD/hGfunfZHfbgbLHmQOCIoICm5QAXjBYmhqj+Pau4/RWyqJk02Ms2tGl4rLzHnT1+aaYali4YsxQ9fXDmUgyrP3wbXMUjHOawW7M0OWLTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756410033; c=relaxed/simple;
	bh=w6+Pn+bppVrDfircoqDCZopXlFiV8DVVOgmmWBUtuf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UiTAvwSYW0LXxknlZSZrP5HeJ48gZfKBc22GyK+qZwhex49uIHos4VkFfD5wKanFxXG1gxl8TS5VgIl+FzKT8FIctLC6UQNTm2QqQ9ZJ+Q5t35RCwUp3wcQow7QAaxVmp6YwpXSxveGzikQfdIAyALFZYGwCRYPWtC8GtIXeWHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JbQ26+UF; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U0260VyC reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JbQ26+UF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U0260VyC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHNRhE006087
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9Z7ZkJuxxlFQF8CuA5jX1Rvv+WW3Fw5kw9Ar0NajEk8=; b=
	JbQ26+UF32VsXwzHWSMg+FhhU5YUwTSGvAVHuoGJyS7kxmQovrSSVtMc967wr0Z3
	L9Ni7h2nQT3zeU1TW2jEfh88VGxWLp2NFejqB7InlGQCToCjsRFXmcVBFLvaKRc2
	B0oi4YqgEFibxj9Ydc4qQECu+q8DGuPdQMxdMm8Ac+gidmDHONiHDNXOaxMo2pC/
	ExRXg3ejHryxV3F15P+qt8dF8eB3990ri/fcoSNv9dQExct6cFWfb3J3wRX0Dr0o
	PQSPVV5PU3y9oanqDvn6SN/P+txueYo4QD1SxQ82L8ZdY4CCP4xD0f9iLSEhUujM
	eqBcaD2ityhtY1wUZKSo7w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q67919g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:40:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHtQSa027160
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:40:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c6t6w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paT7Iz+7Y9iqVDF9NU92uJv62bW0+8N2DsosZsI4vsxYcMIub7ThRrUs9TT+gODSQlcY4c7cL2+MnsRMxHF1pOOywxSVrThq3VO/DUD6DC9ywTO/cOoTaLPI1+zQFogPUWUW+mE+9ToIWYDsnjZAwC64ulue2lR9VtxMo3Tkuqm50qUjTkpJm4z6Y2xq3IwFI+P7lSeKcB3TtLxJi5KeORxz4GPncBIr5n2mbOnJTqc+PtwhilPfKwupE8B1M2ERdSY4AVHb1JJLMzA88Gcz0J3oozKRvSAssoe/oizjMaX52A0sxaUwb2O1Y7qqZrImhZwkHwKS7eyWK5BVyzX4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GweB0oIhRXNO725jqgNTDbLeTLTdq2BkiSjs3n/eqVs=;
 b=RcAmml6W/fNqUwSQOuMHtVmMgSNVSrht+S808XFbOD/P4UmplNdtEw/H4BIa5LZDmuy31Vsq73lIXx86IzB2wIEbqzIihmwSmZzl+3WtAii4q6/XvMzPHlTlYuR3TtTk4mXtoCA7J8tMnd44Rr29S3YIQn7k+VIaXLUCaiTJgJPd4FsuIsu/tlK5ZMaVZ5GS4rg/D14ZphVysk63HQtGGlyHvh+YFsS7zJY8OhJeG5OYXCvCigsTwX1kQjb0gMq3s/LE9pzIuSvB9ob4qKT2MhfLprIUDl8nyWCcbNKa386dV008j8vUsxayfS7QjzYEd+E89gPK3waNGFlXIbLeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GweB0oIhRXNO725jqgNTDbLeTLTdq2BkiSjs3n/eqVs=;
 b=U0260VyCP3AjQGk5YpPFNwe/1Sw6SB/VwxA7afFEFEo9+uM9FYAql8THisI5L+SmUmirKm+6kliJaKE/CdUl+19oHZjYfLprqrZxyxP5i+Px7BhApuPMaQ4nyaMZMeqykn1sWgRmpC0yGbJCAoksZStdw1MwEWAW4Ofbot6AwfY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BLAPR10MB5108.namprd10.prod.outlook.com (2603:10b6:208:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 19:40:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Thu, 28 Aug 2025
 19:40:24 +0000
Date: Thu, 28 Aug 2025 15:40:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/5] udp: new provider
Message-ID: <aLCwpNHT1m0EwXW2@oracle.com>
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-2-alan.maguire@oracle.com>
 <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
 <b186d562-5dd9-d564-487d-d0e91d78b23a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b186d562-5dd9-d564-487d-d0e91d78b23a@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BLAPR10MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e19cac-68e3-4caa-2bf7-08dde66abb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EyXEX7C/yWaABBg8VgUsxOkjJ4TRV2hAXFF0+xRimrSnBkkJInOShZh8Q1?=
 =?iso-8859-1?Q?cU5eOThnDCmJn/nheEtEFU+DwbZkgrmlvDr4YWNe/yrHVoGd+xUJmIkI/d?=
 =?iso-8859-1?Q?06O7iPg5H1Gtbkq2iA4QyBtmvxvdUZEDgobRZE+gHLMFuY96C51rixbgXM?=
 =?iso-8859-1?Q?8FhHC1C+k8yBKTYwKPLpetjVyckZfWDYE5T3+iVp23ridQj0Q+OhKcwwZ5?=
 =?iso-8859-1?Q?31SJAECk1bngYg1sVSAlu0Lo7kbaki68zRMSVtNSpG6395HUrVo+cOsB12?=
 =?iso-8859-1?Q?IkbBmlmnkLgEmeMfRojJkPfWisDdn8uk+c78F3Mt/bhz4783A2vafRBhlj?=
 =?iso-8859-1?Q?FaImCF0E8Lr3eU0CadrOVClfB/69yl0juY3U3gv8/ghQZ5/hze2qfDBco5?=
 =?iso-8859-1?Q?M8BaXZ5n0Q1ZgQCUvbja0NsBA4bhLyJBOWKPCJrtI7hipQiMRaLHljLAoo?=
 =?iso-8859-1?Q?7szrZr4H9C7PDnumCIo5AMbJoWDcogUQJMnCtIjOGXQocM669Bjsg9+mMB?=
 =?iso-8859-1?Q?YQQxisE+N1tZlqv4TMnif5MZvUotjKap+pIYrh/UDNLPL1MveKTM/xWSm/?=
 =?iso-8859-1?Q?+6V7io/PgHCFmfqHYMytv897Zcjukx+LU9DwSxrMkw9iab02ZpuUEiAUnX?=
 =?iso-8859-1?Q?UOO+JDXP7jO5p01HhLWyahXk33mnHVCQ7QrMmXOTOdwylzOJ07zy+2H1S2?=
 =?iso-8859-1?Q?1RGaYbBv0RiSGkjdGbbLiyMc0+YM1LcOIYjMG+cFApm11dwDY6ey7iJUjQ?=
 =?iso-8859-1?Q?kUmqx/w9FLiSCcb/zok/qm9AfcYqgVZuvLHBcPoRKs97bVaqzdmLSDnEZ0?=
 =?iso-8859-1?Q?q8EF2Nqp+1AjrpzKBL2nFhbRZ+E9FVzVEkDRsFO2LZEur4jG39eaoYdHRc?=
 =?iso-8859-1?Q?nsxFCZyKhsriJVgkwWhg4xC4/WJmNbL7NRk/468Sedc3oAJH2TGCpEn2T3?=
 =?iso-8859-1?Q?Ug/yJ0wUzPEm1C1aKBTr/LpPc9+iCkoYovseyCwviLhSzegocFn/96Hhmk?=
 =?iso-8859-1?Q?uMlBEFlSwqlSu3CXLoR6TAEXqS8LFmMXE2mw/ta0sZiG9aDX/1aUZuje4Q?=
 =?iso-8859-1?Q?VjEnDdZulzXayuVq+pQGhM/+Pa6U58KfStN+xBQr6gc+k4jvgukaWgdChO?=
 =?iso-8859-1?Q?IY44Tftt4DiNq8oE46G6i8V7GBMaWK9r6iSE7BhnoqJBQ64P6pwU6GygMG?=
 =?iso-8859-1?Q?l29JSakmds74Vr133isVQSNAw1p4aaZF0yyt36r3EvJmqPg2sY1FaMPjis?=
 =?iso-8859-1?Q?fmJaJJyaTOZoVnyw45Znkj6OyhiITAFZThOwfDMIngHUXg/vLvXOqp8GzO?=
 =?iso-8859-1?Q?sIE1lKpCHQ9QArud2iliZD9sZFC4v4+6WHlZpDhe5CsUo0qxEy7IoFBI6u?=
 =?iso-8859-1?Q?b7JOLfYy6Qv6FiqLFEy0LdvYnIz7ATv5DY3wzPeJp/DwEt44tDy0MaG5jV?=
 =?iso-8859-1?Q?L4Hky2MG2NQC4NXAq/+LYxz7G7lYg3MLisky2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?AAjbdAJxR+RWiUQgMzKkp+SKe9FpQo27BzdnCvExtLTAfzgMml54u03wGU?=
 =?iso-8859-1?Q?m+5Xr/qn5ms9KrKJrdVqjZYvE3eJiUL/9+yNNL6Iiq4Doy2sp4oAJ93ucJ?=
 =?iso-8859-1?Q?2hWa58W7aR24jirtyoPH7wsGKRl/clrMmUf2baz+22a3877KkHzks3ciaR?=
 =?iso-8859-1?Q?pEKbZvYdJZy8/9f4uZRtze4WTB46YRqcpKxRIEu6IV/TRHfjlhp394Y7P4?=
 =?iso-8859-1?Q?OG+0xFCFLkJTWszVG2BxbuDaMWaeesuro7wqHIbjw2LyMwfLR/3fSSEOra?=
 =?iso-8859-1?Q?AUPpr2iDkEyFwiGu/chqxyewQ037oT2H14D/1U+tBxIya6WvjGa0V+ptFw?=
 =?iso-8859-1?Q?t6OwW6mVvnDWHiKZMosZkB+7+8zfy2cf1HI55CPlWKeqDVdPKRO/VZensU?=
 =?iso-8859-1?Q?5vWDB+vWCSYqlfB4z9y69dTW8mDwt2nJK1Q1AvKeOvTHbw60PtyTEIzf7j?=
 =?iso-8859-1?Q?f+rQO+zxztzyj/NEgjeikkZ6kuVB3+8XkEL9WEalFXiI2arGb00Df77evm?=
 =?iso-8859-1?Q?IygPV6kDW0GNCtHY3EO1XbHnFurjEpquWgGWDAofHPmxS7xEpg/57F+vHp?=
 =?iso-8859-1?Q?UU0M73hrJVqrvZqI21D4gE1lJ3SXfcaWxSnwZ2JJlXuKcSo1t6GLkJ02lf?=
 =?iso-8859-1?Q?Ss9hafxXLXuTVNMJlVunXeijw2o41PPxxoY4ytnm0O8Cxm5uhcitg5JPa3?=
 =?iso-8859-1?Q?yUBeR9idnel6V8zVFTzLpMkdKlc8L8ZlloRCvcxUwi09+EVs24k8b8wM4i?=
 =?iso-8859-1?Q?V1ERTgoTATGk5TDNEqGSigQuAAADy8M8S/5Lndth+o48Ly9+naw5wEQpmW?=
 =?iso-8859-1?Q?VAroE9KoTgHJHcIFwwYHKi9ZSbFtmogZfiNIa3T8tzDgxH65Qj6n76j/em?=
 =?iso-8859-1?Q?f+BCcFm8OzK3yAgllEiWQ+TxfwdugslnV3/TDcZ3RYz3qzw/ang7uElCMU?=
 =?iso-8859-1?Q?0MzJsOITWAEg29t6m7lmbiT0g4RaExfZKBjlc82I1i8UAVUTHhZ+Kd4oPS?=
 =?iso-8859-1?Q?LbS0qougObT4Dhho9eAEiiGsf0LdsZd0fLjOqi7Eew0MbhX9ax2q8inrzK?=
 =?iso-8859-1?Q?fGH/cm/P2cCTsNbefV7FNNz7t4yZFKhJN77H3ZbksVow3BUeQZsW+KOnhg?=
 =?iso-8859-1?Q?5uwjzlrmlaJvtt/DBUta7unMu3k4Dr50A1mhkGhuh3w6nqUJRAqy7faLoH?=
 =?iso-8859-1?Q?sPOQQ1yP5j71llvX8ksKaRWVHhtlYA8M+bPRjUgYxQ/E7jlYoZR2wuTZv1?=
 =?iso-8859-1?Q?a0etTAaCNMkhTgYFbnfTHiBl0cy+EvofdTlJOy+j4uUa+ZdqYO7TwAP8Hg?=
 =?iso-8859-1?Q?chqosVMp6Qc9x496Z19+bA52z6ohZbFNsk1twzxoZjKWi776a457RXM+RE?=
 =?iso-8859-1?Q?LMqFReFZau4nzbt1FFzRaYWby6/CLid4c5Tj+mnAZXcKWnuWrPxS70zgga?=
 =?iso-8859-1?Q?55ZWSpxlQVRxzzYTkqllyr2l4DQdwuOsospWxaV/lvhzZXC+tJ44QAlJBy?=
 =?iso-8859-1?Q?ceUk39kyEKZY+TmpoCQOs+ERVctrJoCe1Vw+6n3lj7z6ZbUpd5rYa/R2Ao?=
 =?iso-8859-1?Q?5UtE/ftH8CXnCnu8hzrO1dzafnfwKoNiIq5qIpwYQeUdBriXO9MLFBwfgJ?=
 =?iso-8859-1?Q?XNPKxLpTQb/kqnwam0x1jxDXsDKyfp9SMpEdXQ/RpN1eiicOkQMhU/UA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+AYmFlvLtZgLLsBpJiIG7PJ3dq/S4Pnl8TP76LYeFU86I8Iah2Ira1Ps0GRsPRHGL+M/rQzFJ56BtZSbna+IKvojIKBj4T012vni8GCe/zJocl/uF0ywi41cgNacOg1/ZRiNEYBN5qTUPV6e6jsrwO6pd10LKAhCHLWgZK5ynnH1fpwEy17ZTS2MZQzJMwsz8Kz6LOnyXlD46GfaKtv0IHEyHEkzcgfqx3MUWLVyy0r+H9T6gWnBTe0VSs+L/i2o4F6OVTLgNJlD4w0Dtx+Df4ks9Gmi5KK4mC9h8NQTGYg7BWCuGhwB5WieVfb5ER4xJwJYczS54Qkvg/mQ3obMcUP7yMK6Tg7wK0056WMKCXWJPI8gWIBXxPYj62x4omBNpP/bNhFll1WyGXpoDQPA2FwZNbkoP3k0Iibsbyge1g3fzPyAxRmeGXDkCKfGY4gbTKymQW85Qp8K3yrogXPi33/7/AndpfWeHoSwti2G8zexUazctUOngsCJL91bxLZu4Szt8iKyHDv0UVWH45WBKs9aD4T60+ibaXpEJqQfuvpt6yIbB0mJsNv7jVBVMaphiFNSwwPV/M8r7lKcNauVMyYOpax5Rc5NYS1XDhNp/zs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e19cac-68e3-4caa-2bf7-08dde66abb33
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 19:40:24.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21yGZr6i912TEFMqPx9o4Rei7q4/no45QWugDsWv9877znmzA5ZYNGl6fB+u/qm7rDGkUsJzAe24F5KfeHdP9JNJKFGeK5Ey5mI+Cn5o/q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5108
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508280165
X-Proofpoint-GUID: PA_7t-nuNDDtLdV7Y48w9ZKI10u8brzz
X-Proofpoint-ORIG-GUID: PA_7t-nuNDDtLdV7Y48w9ZKI10u8brzz
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68b0b0af cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=PGivNSTpnZRdjVW58VIA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfXwAZ8uVl7zSib
 Op01AIXbwpkvlSWkRxYWyQiVbUU/ra+2VeVdIjZSzspL7/c+8aGg33Jr2kwH+RqkqOROn1+jeQ2
 leu7ADunJFt88S1A1TdA2rUuEGmlICFD92VxJMX9Hm+fjO0pp3EwzBGavalma+XqFHPmqE9pi4+
 8UjBTl4C5jMH3++k/KiAZkUmPThBa8lgNYVQ1OpmmRYAe4b8mL+x3YHw4GFOOJTJ4yVzJuGacuP
 z7cLJfrVsVexQLfuoK2jRngv8Oia8G9DBHIs0JSDoYXOKm6+8G7+ckIw10rkoMbfU9jvz6ugfKl
 gcLcczKlvKdeQDeAQ4VmmbJydLV8USqcfrl46bDKQw24XF6AdTQru54e9HSJQFzPrbc9VfCQFXN
 svEPh9zx

On Thu, Aug 28, 2025 at 03:25:39PM -0400, Eugene Loh wrote:
> On 8/28/25 13:56, Eugene Loh wrote:
> 
> > Anyhow, testing x86 and arm for OL8/UEK6 OL8/UEK7 OL9/UEK7 OL9/UEK8
> > OL10/UEK8, I get
> >     test/unittest/udp/tst.ipv6localudp.sh: FAIL: expected results differ.
> > for
> >     x86/OL8/UEK7
> >     x86/OL9/UEK7
> >     x86/OL9/UEK8
> >     x86/OL10/UEK8
> >     arm/OL10/UEK8
> > If you like, I can investigate more or report more details.  I just
> > didn't want to dive in too deep without checking in with you first.
> 
> I took a quick and sloppy look at this.  I looked at only one VM. The
> failure was:
> 
>     test/unittest/udp/tst.ipv6localudp.sh
>     Diff against expected:
>      Minimum UDP events seen
> 
>     -ip:::send - yes
>     +ip:::send - no
>     -ip:::receive - yes
>     +ip:::receive - no
>     -udp:::send - yes
>     +udp:::send - no
>      udp:::receive - yes
> 
> I tried:
> 
>     diff --git a/libdtrace/dt_prov_udp.c b/libdtrace/dt_prov_udp.c
>     @@ -31,7 +31,7 @@ static probe_dep_t probes[] = {
>              { "send",
>                DTRACE_PROBESPEC_NAME,   "fbt::ip_send_skb:entry" },
>              { "send",
>     -          DTRACE_PROBESPEC_NAME,   "fbt::ip6_send_skb:entry" },
>     +          DTRACE_PROBESPEC_NAME,   "rawfbt::ip6_send_skb:entry" },
>              { NULL, }
>      };
> 
>     diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
>     @@ -21,11 +21,11 @@ static probe_dep_t probes[] = {
>              { "receive",
>                DTRACE_PROBESPEC_NAME, "fbt::ip_local_deliver:entry" },
>              { "receive",
>     -          DTRACE_PROBESPEC_NAME,   "fbt::ip6_input:entry" },
>     +          DTRACE_PROBESPEC_NAME,   "rawfbt::ip6_input:entry" },
>              { "send",
>                DTRACE_PROBESPEC_NAME, "fbt::ip_finish_output:entry" },
>              { "send",
>     -          DTRACE_PROBESPEC_NAME, "fbt::ip6_finish_output:entry" },
>     +          DTRACE_PROBESPEC_NAME, "rawfbt::ip6_finish_output:entry" },
>              { NULL, }
>      };
> 
> (The last change is also in another patch I recently posted and you R-b.) 
> With these changes on that VM, the test passes.
> 
> The whole thing suggests to me that we need a better audit of such issues,
> better understanding, and more/better tests.

It might also be worth mentioning that it is possible to specify kernel version
range constraints for probes to be used so that DTrace can determine at runtime
which probes to enable.  That and code in the trampoline (or in functions it
uses) to do the "right" thing depend on the probe being used is often enough
to deal with variants.
