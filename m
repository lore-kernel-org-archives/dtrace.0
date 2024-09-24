Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E6139CE9
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209578; cv=fail; b=HRL+heHHsM5vUg2nfeCvODn8DueFu2DIQKJxXoymkDgDjiovxM0KZWvZYG98fFHipiJEGCvvYWQfiAuTJsm9UPIMEqKI2RttsodO3jgOeXCSI2BwGzRn71+Sjl3ohzgV/4N0Ngrpqp/UB74oUatvTbWsBFCHZisa09QBg5HJhUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209578; c=relaxed/simple;
	bh=troSGOigy1nrXVlCmP1I2k0vyZN8E2wdoIu9VxXaeFE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oJY31He1mRD9ATAfjqFAVjt5wGSoFU7kCP4xv99Qavhfl7ktcTncAD2DDZhmqYjH2UrL7XCXd26rjTkgskCp14/+MUT1zwEy/DAWEfjcBdgeZXE0HvV7t8aAzk/nknXVrRlRqApRKyJ1F2CgylFTeRCDzGVoGaO4whcQ+UfT0mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gJyY8H5v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uWWEmwLb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gJyY8H5v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uWWEmwLb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMY57008640
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=WSvnGhkBZXJXhh
	NeICHLimzqcgnVpi0llzZLeS1ZVpo=; b=gJyY8H5vroHETWY0ma30/Pf8dzgY6Z
	lmH/BmGUhnm2Uec+q1294nOXe9+d5gSPJCZEMXV0JmHakOfvRX9T22cQtWtliSwn
	oABNRGu2+9gsubpd1zn8zBOfgQ/7teJSSZD8q7dmKJqKeTcxYJULd+PFCJxxdfZT
	2ONilTV3qehRV6vPbr/yL0zn7bXznLkxiJYi71z4fHVb9UN/gNUf/bh9iEZkdq+n
	8dJG81bqkSgWd81Bn6PKtCXfrtYi1ofjFjEy9Dvhe/+C2UJnafmd57BolomLhq3+
	LMdDzLyaquxgG11yOm+ow3r17Dab8Uni4RgM+IHE8a6KojwG+a4ccOLw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp6ce4uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OImDc8026082
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41smk9rnn2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNB/2MeoQSfrW54oARxT9a7vgKWefIGUh1vmPy5qZZawgjXq5xsQDlu137tb6wGPF/jbFuC87kO6Eo4IxUKU6G2oudRdjSGfdOk0tcxVORluLfEcLreFjJhxEASRO9cVsecb76aRpVmTVg12sSYGQe9i7/COTOYptOSoS50EkXycYoCDf3o91sn8VsY7ETaCAufllu/WPA5Nv+pBus5olbrPxmZ24fCfvzvCUTARv0ky32+ij9WeueYhNnerK1VK0FLB2FxXpgtKAxehvoezhVpBQJ5YWUr4V1/HNfOVaRBAkU+5Qg8hyetzuOaSmMk8SzKJn1v9tafuMqHjJnFtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSvnGhkBZXJXhhNeICHLimzqcgnVpi0llzZLeS1ZVpo=;
 b=dh7SuL2gg7ZtQD8E/joWFQKec344ASUU1Rq5CNb6TQH78eFLS/zA26pkyiQCHnR95DzxWOh1AYEhNXIcMcEgz78Z8vtsq0onkwK1EQ1mlKmsy9yFZvUZlPPeNNAzUaqsbN2xyOk8sk70cnKUls+No05iLaaAEDupEE1MpnBXI0uwzw9RE6gIYMNEGuFPvht+1sGzREbxBgfQhxV5OIjLI5ErebDXYfpWfkjIfBC0+apqM5/pZW+xXH8bjLBvI4ReGNRT8JpaJdX6ZC+IIbJ3ocrzMNQItgzofECWkX7txuFRoonLha7j5IKJEOT1uS72q5jKAo3IX0P2Y50z82R5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSvnGhkBZXJXhhNeICHLimzqcgnVpi0llzZLeS1ZVpo=;
 b=uWWEmwLbkCsG0F92Mr2eqxz88N0HW2bUYv8jQrOmxzHARFyA5fMxi1boaccFpyav1EbqWSL9IDhLAZJSvL7UAfuiGo/b5b+Pcc8zdr5WwbYtx0y2NhxKRA4YXRPt5FcXZrnDJmAoqlNTulyWjN4gBuoi0oOE2sb5JynouMoCY0k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 07/19] Create the BPF usdt_prids map
Date: Tue, 24 Sep 2024 16:25:50 -0400
Message-Id: <20240924202554.7011-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 674a8190-01e1-4d28-3fb8-08dcdcd72090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k6bXIVcw9arslpI1lRPW9EGcHatvbPlaEz3T4zSFPy0vZo3GPsQtuM06v6Dr?=
 =?us-ascii?Q?ovJm4uWJm9Tnv/Ur36mDo95rNeYkFT3L+EqEVMIw7f5U+ffSm4bL3netUJzp?=
 =?us-ascii?Q?5Pj8XSL7t5ngWBnWkEnF96QuAYo4G9NnLJWnahBHCh1TjHb6U2ay67NYMHvd?=
 =?us-ascii?Q?Go3tIVQ72DJ8nlyfRBjE+tgoj04l4e4o4nLCd/4638qQjSf8d9WqhsSuLa+Z?=
 =?us-ascii?Q?dpQK7SfxcnmPCFuscNsmJ5fHtgKqasdVTFFKupNa/m5FNA+24bmJz1yri6U2?=
 =?us-ascii?Q?g2MqLtMyV/jHtbFm7bmVWl1gOdvfLqNHh9qseNuQt46K+NXpXSlJA30U7G4c?=
 =?us-ascii?Q?9iacU3CMDwKMfKL7beIVmdgvOIyl7UuAFGLOPMDjHpzmEDT4fN9hCgPw+JH7?=
 =?us-ascii?Q?KwM5w0lTBTF7hlh7RZLZNIJmIqNoS62h0ZR7A8vW3cLMYriSsg1gI4NTNC/s?=
 =?us-ascii?Q?0H3AcKdNUTT7fYkp+FPi9/l3kRkERzQszW1ZKiSJ/PO+I3YkEGk67w4yhsbK?=
 =?us-ascii?Q?8QrXw/HmaHbZJtONXoxyPtunbp4ifT0xzxrj1CTLaa16sd/+QHa1hIk+LNoV?=
 =?us-ascii?Q?h8Y8WFo5ywmw7RbYdxfhk7a/8RmZ4EJNjuW/9NOhwvy9zWN/s5n6sNC9co/j?=
 =?us-ascii?Q?IiQbdRAPng+/Fm30NnO2T52Lst4LLcIezv8+amM54s3cfgzVN2XVZ0xj1QgO?=
 =?us-ascii?Q?mpwPVyvWu5nwjuOxy9SVvaSNFQTgAIbxMKqjLAKPYvXlmwTIgNXa3VqYTHEJ?=
 =?us-ascii?Q?yL/dczuY1k+WLoo0LqbN70MmmTnwffrHiGKnVo5JaDNhfgZfonw83ssCsUcs?=
 =?us-ascii?Q?bTHS+4FPj3z+7RYeKx3geo71W7RlMRu29qESTYgDvkQfpW2jfvkZbf1pL2yd?=
 =?us-ascii?Q?yW9xeY8ZzjvB3RbOgR5Hu3P7tsz+SgIOXJb7arf7w/J7cEXwOfjeCh8Qn2Xs?=
 =?us-ascii?Q?eo71GrFR1bnwU2nCt/bGCkbvjzWp5uzOQ8TSQt6ANJU+pXCa8BPM6O2WAmpr?=
 =?us-ascii?Q?DMQTyvsTxAw1skDF6+2UT6ZT/imajNkkLpaVZUPxo+2dOr4dv5hf0ezqXPeL?=
 =?us-ascii?Q?5NQg4zmPgm+YvLXxbNXdya1+f0nRvLqluCul0b8vDCyNOw0FgDw2q8TPnwqD?=
 =?us-ascii?Q?BEw2dYyK9mFHvakd3dBOy63YOrUUD4HJN8pLqqYjnk4rFdgV3t6JNw1ueURD?=
 =?us-ascii?Q?mhVJR7yhe7R9k/nljUvjJUNmQ+s0m9qBM3zUd77uRgGWROCHtdjf4L+aCX0m?=
 =?us-ascii?Q?F954qbVHaiS9JUofNrZDdA/TeYx2r4MT5h8S41/KUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N27HZ1TH2zUTOTsHP5BK1Cab4ScnOExNBZqdHMVZXcWSCWNUq0meA63RkW54?=
 =?us-ascii?Q?YbaQ4DYHCgcXUAEGxD2iKzW7omRCcVPZKePGVJCjtipjC6QNSn88la8dGGU7?=
 =?us-ascii?Q?0VF5Jx0KNJoyd/PeXlQR1vXCAzUZ4Xfp2MDHjagWsYqMHnjPvezPLDX6zYC5?=
 =?us-ascii?Q?j11NI4Wdgb/7vrCnJUmQKHqHyu8iu/9LtHpL4ffEYiRYnoJxkOSNTbDtkpU0?=
 =?us-ascii?Q?wleBDTVIrcfITWvtX6Km4rxjmaXksO3qPELhhC15KK7ULYq7rL5GWv095jl6?=
 =?us-ascii?Q?ZjmIZdahGKQLBhNy4u599vrqpoI2KnfiHhiV6FzhkIdsoj9JAh7lakKUAWxB?=
 =?us-ascii?Q?YDOjOrtd2/rMg5knL/Sxu5GlzyyBDQZ82tAgKNxiBSv5+shiio4XWNANSqLo?=
 =?us-ascii?Q?0gNCjHvWPIiQryQwkkB8SR9K9q5qJAx95Uy8ZQIzfZcyBJn9AEKWaS9AY4ZC?=
 =?us-ascii?Q?S2w6s0RoRlVihw1HS1PQYWKw7WAS8mEejoY5+VFyTYt04bqXUyg1rZHqTZQQ?=
 =?us-ascii?Q?mXecz49hZ+rLyH+rLdi/OF4Zg4o3zeqOXBeJnOCU9kitvGS9q9ZqBEqrYYBx?=
 =?us-ascii?Q?rgqscv9x1MkRf8C0FBU5DwflPAlUWqWaOQ52E2nuWRVe9xkpDsjPg9U0ZeeL?=
 =?us-ascii?Q?d5WoGxQy4nLEY5YQYiCwvTMpqH66XNypOdHg4h6garoxw8WM7qxoUHQiX7Ql?=
 =?us-ascii?Q?yaE4Wp4K87DwidbZycp31NIxI5s5tQrecc7JiMBmriRj7tzoZfupR65IxlgM?=
 =?us-ascii?Q?EZ4GyVsR5WBVGqadJTA6r9Vj+c3X9cCelyjB3xUv5a7DaawbT22hIpbUFd4A?=
 =?us-ascii?Q?G4xwA5Gh+eSHx3uU9tBC1HthWFSwpOTFlu2pJ/9sqXnMdpwL27yXiDdGCLo8?=
 =?us-ascii?Q?mdmlvqzIbYbg9HeBgw9pLrw0K7y3JUWkHNWm8HHj8GMt5juGBr2aax/uHj+Y?=
 =?us-ascii?Q?hXqS68Gz82jvE6VZ3Dy3HBXQqQlDbvtDxng2po0pfYN8Z7jAvuLadoALpI7i?=
 =?us-ascii?Q?5dbetRUkkP9csfiLNMCW1uFydWlkXWOfgznWl9MeUX+FhOp39cO5oE963zkv?=
 =?us-ascii?Q?UqwZVy+c2JihgPnj+UizNdk23YocprAaomhG/dUtiqEA83bWw/PZAwpiuiyd?=
 =?us-ascii?Q?MOVQcDMGpk0s8QpEELQuiKwO7M8Agv0mAYklTzHnbaUPD43LdT5GZXxQGN9Z?=
 =?us-ascii?Q?DbpbRd+jycStsoRoXwFfxd29RmdkxD27VC0EQ2mVnUaHa9vB1RpAYiS0hMWs?=
 =?us-ascii?Q?o7t2geWykeWVJRhsuv31A0T61YVucr3jh+2xQrOR9Eo93P3EDubJzs8FKYlF?=
 =?us-ascii?Q?XLGyl5De4O0Axa+YFowF0+Z50c8Q9Bv62r5f5DRq9FaHntlvsYA3FGW+HdZ7?=
 =?us-ascii?Q?pzXtrhY9bm6qaiu+jhCY1bR6v7mv4VY32D7YEI0f6Y4HMwT36DcZNN1CZyXz?=
 =?us-ascii?Q?tdT+y/nLq+LRMmg6v4RbSiVC7jL/6nYQr+D2kVS4U72b+Ud1klzTbzBgS8Mg?=
 =?us-ascii?Q?3FN8QR89SO+yuU7o9IRPAIKQld++X5FmCrVi3DOxGwXtu6uMVfiCm0e4x48g?=
 =?us-ascii?Q?iJnjwvxkBE1MgLZ3+XrkJJYhmVo4ht1OGanbN3ql?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xCmAAvEe/ejzRy8E7wNYhi2ScOky1m0mAcyfRO1C2R3jPHU09a9IHJlbzg4Cp4bJ/81B9/ugnHv7191IvcmnD+C9l+OgSgIdhJc99hAbvzsbfZlhX0wsCmetwnpfNMDCiG2V9PAM/CECunMhQbd9CEZ1jwwsyVJefhUR+i7h+KoPH6VZAFTB+SrBIl+1EcoofV7rGX8St+VZSUXDb6bzed7GO/tNtzcC9BCwOSNUxsmLBxptC47ZtUUdJXZWb4bX7ZVoM87DI7sf1y0tgER3D/qm+mMDWyS1gnQRpY2NXyZYrXgCKtdcWPWy4guD3Ab9vbIVjEH0AzyhlCHxX1vzRXbtjtsZGZ3Vqcu9BiXU6I1/ZxwqZXiY5yl0rwPZc4D+8r01D9LPIZxxZTocOC/7gO8xcZ/2+6jFk4EED+pFK28IPQ8+XmX2y7L+fJWUlbxYhLcReO9oAg3ah6Dl/4w9JcaHSPkxEzrXqVZHYxNsf22FfR+JgGd5PnmpSTjhrtpkuIUeUhOltbfwFTp+6QLJqk2KW6NyyA8Un1/v55Y9bfjkMkSD7LiYuHWJslUIQ5T4ycY1gRiMjgTkUY1buXuQvEK+h4MDZqR0MtRi9Ndubrs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674a8190-01e1-4d28-3fb8-08dcdcd72090
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:10.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVrj+8rdfu/+y9BzOfA7Zc3W25othWCHQfnIkguvTm38tuDQVsL1+Z4yckWwwNrOLXS8kUmpYV3gGwt/ihx5eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-GUID: q77oV0do41UxD43iouVA7Pu-7p_gjOgx
X-Proofpoint-ORIG-GUID: q77oV0do41UxD43iouVA7Pu-7p_gjOgx

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the overlying probes for an underlying
probe will change.  Hence, we will move to a scheme in which an
underlying probe will walk all possible clauses it could call,
deciding at run time (using a bit mask for the overlying USDT probe)
which of the clauses to call.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As processes start up, we also add new overlying USDT probes,
requiring updates of the BPF "probes" and "strtab" maps and of
the list of enablings.

The underlying-probes "update" function is called sporadically.
The focus of this patch is the function.  When it is called can
be tuned in future patches.

This patch guesses certain sizes very crudely.  These sizes should
be handled more robustly in future patches:

  *)  The allocated size of the string table.  For example,
      new provider names have to be added as new processes
      start.

  *)  The number of entries in the BPF "usdt_prids" map.
      There is a little relief here in that, as processes
      terminate, they can be removed from the map.

  *)  The size of the bit mask -- that is, the greatest
      number of clauses an underlying probe might call.
      This is relatively easy to extend;  nevertheless,
      that work is left for a future patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         |  42 +++++-
 libdtrace/dt_cc.c          |   2 +-
 libdtrace/dt_dlibs.c       |   1 +
 libdtrace/dt_impl.h        |   6 +
 libdtrace/dt_prov_uprobe.c | 276 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_work.c        |   2 +
 6 files changed, 327 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..0987279bc 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	int		fd, rc, err;
 
 	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
-	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
+	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
+	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
 	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
 	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
 	dtp->dt_zerosize = 0;
@@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	if (rc == -1)
 		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
 				    strerror(err));
+	dtp->dt_strtabmap_fd = fd;
 
 	return 0;
 }
@@ -936,6 +938,43 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 				dtp, "cannot update BPF map 'probes': %s\n",
 				strerror(errno));
 	}
+	dtp->dt_probesmap_fd = fd;
+
+	return 0;
+}
+
+/*
+ * Create the 'usdt_prids' BPF map.
+ *
+ * USDT-PRID information map.  This is a global hash map for use
+ * with USDT probes.  It is indexed by (pid, underlying probe ID).
+ * The value is a probe ID for the overlying USDT probe and a bit
+ * mask indicating which clauses to execute for this pid.
+ *
+ * WIP.  Just make up some sizes for now.
+ *
+ *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
+ *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
+ *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
+ *     So either uint32_t or dtrace_id_t is fine.
+ *
+ *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
+ *
+ *     How many entries should we allow?  Start with 1000.
+ *
+ * Note that for a given (pid, PRID) key, there can be at most one
+ * overlying USDT probe.
+ */
+static int
+gmap_create_usdt_prids(dtrace_hdl_t *dtp)
+{
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	dt_uprobe.update(dtp, NULL);
 
 	return 0;
 }
@@ -1045,6 +1084,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt_prids)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4202771a9..12104fc21 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1045,7 +1045,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = 0;	/* FIXME */
 				continue;
 			case DT_CONST_STBSZ:
-				nrp->dofr_data = dtp->dt_strlen;
+				nrp->dofr_data = dtp->dt_strmax;
 				continue;
 			case DT_CONST_STRSZ:
 				nrp->dofr_data =
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index ba4d4abef..924cf11e4 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960..1d1248766 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -282,6 +282,7 @@ struct dtrace_hdl {
 	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
 	dt_rodata_t *dt_rodata;	/* global read-only data */
 	uint_t dt_strlen;	/* global string table (runtime) size */
+	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
 	uint_t dt_rooffset;	/* read-only data offset */
 	uint_t dt_rosize;	/* read-only data size */
 	uint_t dt_zerooffset;	/* zero region, offset */
@@ -389,6 +390,11 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
+	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
+	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bb172ace2..9ff44316b 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,8 +37,10 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +65,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct usdt_prids_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} usdt_prids_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
+	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -123,6 +137,267 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Clean up the BPF "usdt_prids" map.
+ */
+static int
+purge_BPFmap(dtrace_hdl_t *dtp)
+{
+	int			fd = dtp->dt_usdt_pridsmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+
+	/* Initialize key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over all entries. */
+	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	return 0;
+}
+
+/*
+ * Grow the string table map.  It includes the string table (which might
+ * grow due to new USDT probes).  It also includes the read-only data and
+ * the block of zeros, but these remain fixed.
+ *
+ * FIXME Is there a danger of the BPF map update colliding with map reads?
+ */
+static int
+grow_strtab(dtrace_hdl_t *dtp)
+{
+	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
+	char		*strtab;
+	uint8_t		*buf, *end;
+	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
+	uint32_t	key = 0;
+	int		rc, err;
+
+	strtab = dt_zalloc(dtp, sz);
+#if 0
+	// FIXME do something
+	if (strtab == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+#endif
+
+	/* Copy the string table data. */
+	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
+
+	/* Loop over the string table and truncate strings that are too long. */
+	buf = (uint8_t *)strtab;
+	end = buf + dtp->dt_strlen;
+	while (buf < end) {
+		uint_t	len = strlen((char *)buf);
+
+		if (len > strsize)
+			buf[strsize] = '\0';
+
+		buf += len + 1;
+	}
+
+	/* Copy the read-only data. */
+	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
+
+	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
+	err = errno;
+	dt_free(dtp, strtab);
+
+	// FIXME do something
+	if (rc == -1) {
+		strerror(err);
+		return -1;
+		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
+	}
+
+	return 0;
+}
+
+/*
+ * Update the uprobe provider.
+ */
+static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+	dt_probe_t	*prp_next;
+	int		i, prid = dtp->dt_probe_id;
+	uint_t		old_strlen = dtp->dt_strlen;
+	dt_pcb_t	pcb;
+
+	/* Clear stale pids. */
+	purge_BPFmap(dtp);
+
+	/* Update dt_probes[] and dt_enablings. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		assert(stp != NULL);
+		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+	}
+
+	while (prid < dtp->dt_probe_id) {
+		dt_bpf_probe_t pinfo;
+		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
+		int fd = dtp->dt_probesmap_fd;
+
+		dt_probe_enable(dtp, dtp->dt_probes[prid]);
+
+		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
+		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
+		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
+		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
+
+		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
+			assert(0);   // FIXME do something here
+
+		prid++;
+	}
+
+	/* Grow the strtab if it has gotten bigger. */
+	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
+
+	if (dtp->dt_strlen > dtp->dt_strmax)
+		assert(0);               // FIXME handle this more gracefully
+	if (dtp->dt_strlen > old_strlen)
+		grow_strtab(dtp);
+
+	/* Review enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+		list_probe_t	*pup;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (!Pexists(pid)) {
+			/* Remove from enablings. */
+			dt_list_delete(&dtp->dt_enablings, prp);
+
+			/* Make it evident from the probe that it is not in enablings. */
+			((dt_list_t *)prp)->dl_prev = NULL;
+			((dt_list_t *)prp)->dl_next = NULL;
+
+			/* Free up its list of underlying probes. */
+			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+				dt_list_delete(prp->prv_data, pup);
+				dt_free(dtp, pup);
+			}
+			dt_free(dtp, prp->prv_data);
+			prp->prv_data = NULL;
+
+			/* Free up BPF "probes" map entry. */
+			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
+
+			continue;
+		}
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			long long		mask = 0, bit = 1;
+			usdt_prids_map_key_t	key;
+			usdt_prids_map_val_t	val, oval;
+			dt_uprobe_t		*upp = uprp->prv_data;
+
+			/*
+			 * For is-enabled probes, the bit mask does not matter.
+			 * It is possible that we have this underlying probe due to
+			 * an overlying pid-offset probe and that we will not know
+			 * until later, when some new pid is created, that we also
+			 * have an overlying USDT is-enabled probe, but missing this
+			 * optimization opportunity is okay.
+			 */
+			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+				int n;
+
+				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+					dtrace_stmtdesc_t *stp;
+
+					stp = dtp->dt_stmts[n];
+					assert(stp != NULL);
+
+					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
+					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
+					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
+					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
+						mask |= bit;
+
+					bit <<= 1;
+				}
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			/* linux/bpf.h says error is -1, but it could be -2 */
+			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
+				/*
+				 * Set the map entry.
+				 */
+				// FIXME Check return value, but how should errors be handled?
+				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+			} else if (val.prid != oval.prid || val.mask != oval.mask) {
+				/*
+				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
+				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 */
+			} else {
+				/*
+				 * Nothing to do, it already is in the map.
+				 */
+			}
+		}
+	}
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1057,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 40913a0f1..ef39b3a68 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -368,6 +368,8 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+dt_uprobe.update(dtp, NULL);
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

