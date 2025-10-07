Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940792DC77E
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851707; cv=fail; b=cIXG0TJ6gEp0ZkWbNvD6hnWlD63+GI+R3N65EP+B+ZZKaRbZVHCkPAJit1+oaL2lb6zHfQo1V/hTTGEcAkie+7SJ9WFgeWBqCSBSlMIXYJRG6p/9wSOXkoF0RvPOM+U/iqPVg7nEp7x1NuoPdVwGWx9kpZvuMr9k3fI87C0zfxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851707; c=relaxed/simple;
	bh=9/fAJvaEryDmpSW0Y3NwGu0xGSgmP5tPKv9U27n/Vuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TNllXkv0JOWDpAwJZxf9gXhO+E/F95YHgrbd5sXkV3zPE/pEBaXpUy54lQFcH6eYLoKq0O1aUjU/XEfWOWxeQ4nYppbkHxzZwX4xRJmV9TMcznp0u7o8dUM244UrxAeWsowyP7KBeri8mQg6fMfsPBBJfjDwwodtdwkPjRFcuEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Klk6aEn1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ehwqBqw/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Klk6aEn1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ehwqBqw/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Fdkep014062
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+XRP7pt3RZcHBicSUT
	GHSDnrDNLLQzl9cEPySx0kMn4=; b=Klk6aEn1j8Nvy8p1qfxaxCPHcrah4GYWt3
	qZCdYANXYSDNPls+5PCfRK258rZ7sSQvfAMzrhW1Knm6lUh+ZGnHVt5j+tAFGrhN
	h/o8PP2OcLgCJfsPQuyVk0Jt/KusQmTWA21eAcWbDH7xUPc2WIcZkJg6Yg2slOCh
	m1ziQTEc9WIPD/H8SJ9b2UfR2JVefkit4goqoUK5gDEu1bpxZNvX86a6fOeK7Ugu
	5LMb1vc0EaEyugEKTgX4HJIdVw4ew+Hl22B/tP57RuS1z2YqP1G4EjHxxmZyn9rF
	ULk7cxn7WBDIsTcL6FHqpSY5ahRs04yCk36VXEOyJ/50+1loRq9A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n5pq804a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:41:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597ErKL0022825
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:41:43 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18m6ne-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:41:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq3nmNGiJgbgs/MFnEmOQuowcqajotwO+BkDt2BiLocNNBT4r3/2F7yAOkwrec8GBaPmdVnRDWX3rKkVqO3PiNhI/t4g83vdaiTMIUygq03PLWwJ9/rDZnQp5Ge8hQjnWHYzg25FzPOZvlYlUsAK7eGH5Gq8CIwtvJyL+Fz7GsO+rxDSMlqsj1aBxycRcYAD8ff7a1ushb8t3y/A4QRrnOxE3Ck92eEJMNuIOAB0EeilR4vgIkS+ldACwu8cRx+/gbCIJzRBSLjX4XVsbNbN9qZ+HdmE5+NxvGgHQdos/41+GJ5YWktVoJj0j/muK5L6h14FFjpB00mfehzBR1Lqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XRP7pt3RZcHBicSUTGHSDnrDNLLQzl9cEPySx0kMn4=;
 b=dh6Dd1NJ65+zlkc3koOkU00JwG5g+bW/pof2z+h76q15SJ/81sGyr2mGJXivtuGjzj4zi3pXZEBIl0dZLI5F3Ur2mCZ58nH1gre3Eq6NDTFkB5Ylmau4Xm0vSnDKdCG0Fl4F0xHzxUfU8U/lgtqEq3gGxKUrNcWpL0+iD1UUTlTx4INLtfiyxxfqbapxpIP938Wt71IOmgf1fZYPT5jIMO67PR9jTYHKkQcKPqeTQIfcZ9AWAjvLpLdwyfQg5u2J4cVDyeWehzl9fwHzhlU/k6IFwz8wSGp/rfElX77R/agki8bgdNlu+sMprJvMVMNVuIihn4T3W2KtiaGway7kSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XRP7pt3RZcHBicSUTGHSDnrDNLLQzl9cEPySx0kMn4=;
 b=ehwqBqw/YLf9aBsn/ATfhfxO19dxkG46FLBiJArbq0jcUZzPPivl6/4HWJwuJwg/Pu88CJIHjIB2Vwbwd3jQgY82+AvGj7jJbCTOrCOEyCZa9k1xvX4XWWnG6eFOQvFuKZBPP7YA4V4XULkJkmHv5By8o3bVu4yNAo+PLerefYU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH3PPF9212BFFB8.namprd10.prod.outlook.com (2603:10b6:518:1::7b8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 7 Oct
 2025 15:41:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:41:35 +0000
Date: Tue, 7 Oct 2025 11:41:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/4] test: Supply XFAIL for tests that use
 vtimestamp
Message-ID: <aOU0rCkzJylhk5Dd@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
 <20251006215726.8893-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215726.8893-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH3PPF9212BFFB8:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d14ffb-97a7-472c-6541-08de05b7ff00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nhq8MVOTzPLKgTAp2cShdFHhjzkXg8TVBgWaVCkfzJpq1ZvC3cRKQqMxPIgJ?=
 =?us-ascii?Q?pLNMLE8VSaoBVyNMwex3x4PKk3aM9+h2nlftu9Xj/kl6eKTS4BT+iz9W5L0S?=
 =?us-ascii?Q?4EtspCraABrrBo2bwg31iPe2Y8aYejS7xVkl0odv5WosIBoquB3Q3rpJvcaj?=
 =?us-ascii?Q?zryTVqljz2QMt4XAiCpQ5Xndr48bMMlsyDOknzc6txH3lnqL1KWXaTKEobjR?=
 =?us-ascii?Q?IMovdJgCIBQ6YqV+3NIG7okUhsopKKC/F+ehQUE1/WlWSBW/eEg0h24lU//K?=
 =?us-ascii?Q?zJ9Iv+P+85WSoUqZmHusebbGHxQa0T0ITGSrvcHLu6A1lXKDf+8wf4R4RgH3?=
 =?us-ascii?Q?O87J+CfmqfR+w+yqX4TkKrYyU4PR5lNsG12Cc6oc9Urk7DYwWMxEdCxqUNaS?=
 =?us-ascii?Q?4eKpaCkNeZ64h8wkz6/rov1xnZNtE4wCFl11lNab8hJ5Ew6T6cLAV83lMUV5?=
 =?us-ascii?Q?NOWCCRkihJbtYe6FiTQbmZserRwzp5RxYRtSa53j31AQoHYASF4ITcCb/MwS?=
 =?us-ascii?Q?1T+CDUz/kmpuDAYE0vhOguNe/W5EIl+2oBpUvfWs/ZBsOfrnxaywGdacGJSq?=
 =?us-ascii?Q?wJmgDR2pK/GljDuQ2eFjeysuzx0aZqDFNrn2Ocr6zu+G/+8Jw6mMXdMAk0Fz?=
 =?us-ascii?Q?KbPsUr8icpGwa3q3+z/QZqAYW5+YyXljYegv1lirKbclX4PViLGJgAtKZDCT?=
 =?us-ascii?Q?MweZE4IBVtWjtv+rbpxCFsvNn58W5SVeHKaTjiW9jARLoF6duta3ioHbzxav?=
 =?us-ascii?Q?wR695SFSA+yi13fG39P72xPX5Rq2oYlH3D9YE74kp4dKjN+x/b+jcJaiYi46?=
 =?us-ascii?Q?5hEd+wZisH8YTI9pVoV+gr6FN/vhANo7S0hgIfSq/1udNtTFnLCFS0cVP/Kr?=
 =?us-ascii?Q?Q/jJIMhZB7kUaBxvaf2Qm4ZElc7OvY75Wp8+D/E9/vafVORM5W35UlFGBAGq?=
 =?us-ascii?Q?qsv9rBbaQw0uGtySZ+XfW1pC0jlByfNlmz8NU+C5rdJgEZWXgrIL8K2fUy2r?=
 =?us-ascii?Q?NfBT5VplYpRPVV1Ynsa259CaUa5sZeckpKM3qSBFLchCLxTk9gg5VEa867MJ?=
 =?us-ascii?Q?bVNtKsy8MWOQNZ8T/OcaaWlN4rmn0yNqI4d9QxPPXKAHr5v61yxV3cb3tUwF?=
 =?us-ascii?Q?lpPVZmSrrJb2pC2o109qM3IcD5pMJfFTYP9F+m4aU6kCC00rd6LlDaUODuQZ?=
 =?us-ascii?Q?9R9ehF69sAfCnQKvuHOkPUOPX/WzVOPaiuiH8hw69cMIqTAzJ7UtppI4Uwqj?=
 =?us-ascii?Q?Bt6dHQw++LwvoD4n7+ev9Bm0dW8E0XsJ+sJWfM+Yhax2GLEtklbcqKhvvCDl?=
 =?us-ascii?Q?I9JLpJngH0IlW6vuHhG9L/Jz1Df2tmt9CbtftN9Jhkdr9FStNzSqxS1tyLGd?=
 =?us-ascii?Q?gNEtdcsUTiazwEqwHLn8jpFZd9w0AeK4kaK57zpAgoPjEocrm8ytIXRJgVnf?=
 =?us-ascii?Q?ZCl9Ql/oLdGJeJiyP+EavU5wyjstITyJ3WdonJ5KsD0q33hzhkzr9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ln9+gN/2vPfp/MvoclxBVLFAFo5sgLNFqT+fiMBAveBDo6+xi+m3Dec9dgbA?=
 =?us-ascii?Q?q8u57yof2ISMelVWNVev2EvXwsn0tMdgc3B8RA5cqD4rSb31+NGQeNeUhuAi?=
 =?us-ascii?Q?CzaSH9ngLy53mEBYgZViPaLxSe+OPP4tiyT6oX9NBTjYNywHfZyenlzSG8bF?=
 =?us-ascii?Q?xsL1pTvBgRsXnLCrroftZmhybSZv99cV3HVlBf7TYWcqcbty/9H59cZYBgqj?=
 =?us-ascii?Q?nfdyW/jltJ5+aj6uZRv5z4V2bFkrSKM8eMu/vyyr3QuSjVc3dgshXyeSX58d?=
 =?us-ascii?Q?NnEOw9bFSN2OkRsj38nWbvOSNUJAFoAdgq1LYiE0YTnTHw3qBQzJZ31+KICY?=
 =?us-ascii?Q?T3zh4lguHXRMYJzVd4bGgGV9rt1Q2aRIDa6RypViAmxgZuVfYiRQBySLSWMa?=
 =?us-ascii?Q?/ct7Ot0kVnMUlmq6MEhacKyJjWvL04QHWTG7SDw9c/cYhorG4Ozv9+0F+WY+?=
 =?us-ascii?Q?naiNdGRjSYA0JnA2XAw2+E66W/29fZlBgfnDkAnK5NnIm1l1WsbhuR64WnqF?=
 =?us-ascii?Q?hxaeiLYEJb/fVF5RIF74wv8C1WUt3HgT7uF/ZtTeuPfNU6DB/4eas3YWXij1?=
 =?us-ascii?Q?RS7e9sdAbuTue567ciEp0kOwD6oeCEN4u1l4QiO2xB/4dZzQg1NI/Kk5x+h+?=
 =?us-ascii?Q?4eT77lgGQxKkUEYndFV7ZlUl80/hvtLPfcr4PJd/5oCvtNeP3s7BNjA5A3Wb?=
 =?us-ascii?Q?sWn5rJJ8NbyR0FfxV2wuraqqQG40tjdUDYwd94VeDk/2b6bUtTq+8JnfTmcF?=
 =?us-ascii?Q?3Ck/yTNIDJpEFL/L8tkmzuxHvc3e3ZQ8ZicKnxPrDUMouFjpqSoGMaplfc3X?=
 =?us-ascii?Q?RZ86+yoW+4hb0e3nCeghTr+m490doQ0orApHfKmqIuFf+RAVHm1/tCaYwFr6?=
 =?us-ascii?Q?cAcG3ASnnT2jP/Bkt2sUxcDLteolhAqGsYXE587z7ZiE3WwpdNWR3pthYlp3?=
 =?us-ascii?Q?Xw1T5kVHVD+C2zGww/qbssoMDvpx25ckPdBjHx4GZp0yR6oQEq6XraQXqaXV?=
 =?us-ascii?Q?TcNEhQ3y3Od6MO3YHl6CHI6St3dXRNVWR32oeHuJGI5w8urr29LauBPq8g7Y?=
 =?us-ascii?Q?DmvOu/ovtm1QjOOxLc+24kvBzicWjiIJR/kvYZLxScNbERo/m1a1odY3gyoL?=
 =?us-ascii?Q?cLJTzDu5+oVNhNSfF9j/ecAZ+pKn0GES+qksWCK+HksC3j08mQz1iS6F/QCz?=
 =?us-ascii?Q?JdWt3YWYgqwIUa0b7zsUqPviBDOg2FZbCyZQfNXCmgcgoEU6JV73/b5JhXll?=
 =?us-ascii?Q?OobUQurZw4rtfGDfR68vVZF55caNIh8Q0zqjWjTtdYN9KEIj1fv3jNyhTZZS?=
 =?us-ascii?Q?vVJPZ+EQ5uLnAjzYPo7q02MJNFbjQBP6UmRFbyI7hHPkSMp/0I/YyMWgeH36?=
 =?us-ascii?Q?J75wRQ3FPrlv8tnj8eAedGL220xSEBh4qUw66CC1dK4RlXJ6oWZCoY1EoIeH?=
 =?us-ascii?Q?Q7/VVGdU6ow+hmioR1YEY4gE809yPCzU1sHN5OwGL0Ndy3ieMuYn8a0T7JSJ?=
 =?us-ascii?Q?4BPXK8Q7gMPbw1NHykMLHOFSz3wbqU2gQCTOmpOYBIiUVCN9Sk7OFF1wZC5e?=
 =?us-ascii?Q?Obp+8ggcsZ5DIeGV8Ev1gYWGYM92ojZUBgvAcDDyOAiUe0v5QzLLOd0kTOXL?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/+RIY9BrFxWKw6N8GUG6g7bAPWP3i9YXG729H0+UF2wAM8/Rko2AdhiWiQMaGISGN+/iyIT1Vp7GTxgPghKoGTnyHn6ijDP5HC6zDgBfRw4qF+sVZ00C9iuHes9rve8ieHytAH6Ntlxn3AwfszrUvtwzHXkxshKGle6o9kh0To/Y0d45G9RAiYsJyq2j+93UbR0M0JytNmWw4+0Wmep7Xr2VJ88ORaTEiTfL3wgDgU3PkxaOpKdVTl9ogbEE1Ej81VQ2AdHZuu2U2iFbJNcmQSnB92IIeMoTr3+mojoFYz7AUfiv6WSLs/FhFs7bWKc80ztVZeECKb4vZMEvLrZf06DFIEUJJGMj4bGfcfvixSb3KKgibEkcVYf6jrlZ0c5J2ISVJ52cBmSw0VBkP8Ta8WS+UMUTTUNnlXzSTSf7PDypga92TQl0SCPUbSIfkkAGlM1PifKdTndwwFWf4BXnu4I7+GILEg8Mr4mO+KL2KRHgN4XwNFiZJCbgIxcDsvjiVVFhB3ZKbL+QNm7zRW3URUG1Tb7PBhRznaqqjBLpzxubF2pDKJKzUYChjh2+yTORkDAdxDyhy7HFtYBxuvy1TDeSYd89A0l0UoQlzF7Xkxg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d14ffb-97a7-472c-6541-08de05b7ff00
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:41:35.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/rWap1HZdFceZMdmJP0jn9UrW3r0K99LogwmhWF4CvqEyLEDzHB6/1LItw1EIsLjzMW/P6ejJi2Ii/DHpC3wdKGlwP2omzJPqAa1qC/PoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9212BFFB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070124
X-Proofpoint-GUID: TYXpSSF_91nX3qb35KjK6VF1bjXnxhz3
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=68e534b8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=iGqT7W0pOATNRUfLVO0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDEyNCBTYWx0ZWRfX5SVXWdK8fHMH
 fj+15ygjJW0B7DcUapIW42mo0FDF6DPMgThAyIN6QUwhH3SDzz3OfBDVbPcaKiNMArNOPfZ5ull
 uDsf6TQQuTovJjfzZuwwx+jEcbmun82R/bweuNoSxQfcUjnYe04N6NIRqLFu9mAXJYYTm989C9c
 ma/hUyBC7uMA4hzwKmkFmKLhytCmksDg0VPqf2pmHjzpHXSUhLDl1kCWtUis9XHg2WIXxC1opLn
 OBFdTQTL5ERTURPmra5Vu1zGjqbSxpP7ofxJ+TB8Krr3xwQ6RoriTUHDznIdhF2s16Yfcu9Cetp
 Hd/qAdDMUJ6QB+HFd2Bh+sZz66SPkyIo+ltYQPObp0uyoLGrg3MKB1RyOsYC1aLHbAza72PT8G4
 EG2iLEOFcyBlHv63aBgdYi/8SaBq3g==
X-Proofpoint-ORIG-GUID: TYXpSSF_91nX3qb35KjK6VF1bjXnxhz3

Given that vtimestamp is used here in a way that is not actually depending on
its meaning, I'd rather you just change the tests to not depend on vtimestamp,
but instead use something else (e.g. timestamp).

XFAILing them does not seem to e right since vtimestamp is not relevant here.

On Mon, Oct 06, 2025 at 05:57:25PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/stress/fbtsafety/tst.index.d             | 2 ++
>  test/stress/fbtsafety/tst.strjoin.d           | 2 ++
>  test/stress/fbtsafety/tst.strstr.d            | 2 ++
>  test/stress/fbtsafety/tst.strtok.d            | 2 ++
>  test/stress/fbtsafety/tst.substr.d            | 2 ++
>  test/unittest/variables/bvar/tst.vtimestamp.d | 2 +-
>  6 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/test/stress/fbtsafety/tst.index.d b/test/stress/fbtsafety/tst.index.d
> index e30b94c0a..3a2e40567 100644
> --- a/test/stress/fbtsafety/tst.index.d
> +++ b/test/stress/fbtsafety/tst.index.d
> @@ -5,6 +5,8 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>  #pragma D option bufsize=1000
>  #pragma D option bufpolicy=ring
>  #pragma D option statusrate=10ms
> diff --git a/test/stress/fbtsafety/tst.strjoin.d b/test/stress/fbtsafety/tst.strjoin.d
> index a22cc7943..4192bdf9e 100644
> --- a/test/stress/fbtsafety/tst.strjoin.d
> +++ b/test/stress/fbtsafety/tst.strjoin.d
> @@ -5,6 +5,8 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>  #pragma D option bufsize=1000
>  #pragma D option bufpolicy=ring
>  #pragma D option statusrate=10ms
> diff --git a/test/stress/fbtsafety/tst.strstr.d b/test/stress/fbtsafety/tst.strstr.d
> index 13f4a9245..ee8512f0f 100644
> --- a/test/stress/fbtsafety/tst.strstr.d
> +++ b/test/stress/fbtsafety/tst.strstr.d
> @@ -5,6 +5,8 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>  #pragma D option bufsize=1000
>  #pragma D option bufpolicy=ring
>  #pragma D option statusrate=10ms
> diff --git a/test/stress/fbtsafety/tst.strtok.d b/test/stress/fbtsafety/tst.strtok.d
> index bc0a707eb..0c5d586fb 100644
> --- a/test/stress/fbtsafety/tst.strtok.d
> +++ b/test/stress/fbtsafety/tst.strtok.d
> @@ -5,6 +5,8 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>  #pragma D option bufsize=1000
>  #pragma D option bufpolicy=ring
>  #pragma D option statusrate=10ms
> diff --git a/test/stress/fbtsafety/tst.substr.d b/test/stress/fbtsafety/tst.substr.d
> index 8cd021176..ee7234473 100644
> --- a/test/stress/fbtsafety/tst.substr.d
> +++ b/test/stress/fbtsafety/tst.substr.d
> @@ -5,6 +5,8 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> +/* @@xfail: dtv2: need vtimestamp support */
> +
>  #pragma D option bufsize=1000
>  #pragma D option bufpolicy=ring
>  #pragma D option statusrate=10ms
> diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
> index b72eb8a7f..7d92bf4cc 100644
> --- a/test/unittest/variables/bvar/tst.vtimestamp.d
> +++ b/test/unittest/variables/bvar/tst.vtimestamp.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 need vtimestamp support */
> +/* @@xfail: dtv2: need vtimestamp support */
>  
>  /*
>   * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
