Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FD626A1B9
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103416; cv=fail; b=iLjEsm2gizrAamP06+DnIdNjdL94Jlb1gPe3+MaUt0hGUf2FLnwHj0TAZMyYX8n0NkQJilck0HhMD4P2NlSXZQ4RsEq5a0vgeVt+amXbrsVMZ1C6kl+kqTFb50DBqiukIB6LZpqoJGsi8N9NkupzYVShPlWpEGJptYNNbASmzyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103416; c=relaxed/simple;
	bh=xF4OnKvVCSllMiN/huNsRx4MCnUze1Yti9fN6WoqtoU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CeETDjl3EyN5854Ubkt3VA/6omp24sRufq0uK+RBs7wpRvREUkSLpeqcmUvAVptWTEX9Wqm0L+Yr8qle6Sa/JodqmlbCBGZGHkuuoevOOYzhZOk2fj0aH/dkZfJCX4mvk1M1POl1lUGjyxyMwdlyh+y3J1gSn2LFo4uNT5bhOJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OXYTgEgc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OLWCwl6F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OXYTgEgc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OLWCwl6F"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NTkd032694
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=fkShlHhY30a5f9oZpi
	EvvF5ADbDDMrCpjwU0Myx1KA8=; b=OXYTgEgcRNLnMhBn6s8eJDCQarjk5phuVQ
	s+iQN9u4VdwjENZTmg19ogFGNrWc+7Nlt03kdaE+oH5VpYN8DTujm4k1ajR4Faok
	JiIUZW51vFSL106RKihZNW68Y9H2fmOX13zIzo7/crt+OhWmoqzqMhjP3Lzvn+cF
	4GpdxKifqDBTTbxHT9djyK13ehbZYmLLOtsy44iGwVnujNQGc8zG0pEF9LwkUaq3
	mSLBcwHBDC8NGlDsqxd3w5kq/ouN9sYkpBzrL9wNzPJNJrmPkUT71IczRhW7bmOR
	g6CcHtjIFSeTU+c022vSQqF+4LD10CtECJKZ9wZsxFZco+Jjgq+g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d6xy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2d3Xh032305
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdn3h0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsamXFmuGUMnGkWaJQ4SOIRN0qcH5Mwcz6Bc7Sq4RMXRIhiPyxGpec/eqob8sRbZvBDSGq362nKwlMdShHsNGzkLx1gXFQhSXPzcvlm7nXMo595lYUKb1YNrKYqHM4a1BnQ9l591+7Vd6yey7iPS9vPu4jliUMQzK2zU997izZLeAktpPd+Dr6yX0UlIz1f54QLbrCWwF46vUgG/etl8u8zWYDQz55Qtnx8cq4awyTNfZt7vQ8BD1dZY4jDxRVr28P2W8TfNWXlz92/XBdI0zxzGiTBn4z8GYUox5rYJTd/fp0AEIweD4FnKjGVySeh8nrv5b19Z5axuQsFD+mkwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkShlHhY30a5f9oZpiEvvF5ADbDDMrCpjwU0Myx1KA8=;
 b=aY23zWb6ny11ka8c4L/XGaKP0PoM5qTiKsgJ3lgVqLKr0XX7OLrNxKctStCZoOzxXo7TdaEV3r/Rb/9OzJheD7Qv/MGKwf9oh0XUc7EG6/RJ980YAyahTmRf6iYI5DRyt7khlDJkHyDjgddc+AmzCDNv6eTglfgSWJ6eUYcMVASAw5avDqzkv81qVr17xJEq4bFWOdHTC/Hd7sOYKmpA1XkUSPhgD9ipCYnKyG3NnO+aEPAsTRDxW37fFtqPf4T1Pxlz7X2g+Us/OAz0x+TJKPLmLifoHZLqmtf61A+1hlCo/jAkag3iGU5GgIJwnZ6Hbf+YyV7QWIOfo/zh/ky3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkShlHhY30a5f9oZpiEvvF5ADbDDMrCpjwU0Myx1KA8=;
 b=OLWCwl6FCw8NzLpGVUvONMVsDWP2btK9hGRdEebFxITj3nqqxwiyjFKoi1rMJKlAjHmQUZIlNWXEVrQX10VXHqndqEflyygFTEgDH/88OgEOzSSHHhV5Wro+jY7UdOb0VSFAX6LidICPAwe9xywYNIg+ncvlN0VOGXYRF7XEM80=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 14/20] doc: Link to "Character Escape Sequences" table
Date: Tue, 21 Oct 2025 23:22:44 -0400
Message-Id: <20251022032251.2010-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 13842e0e-d0f8-4eb2-f6ed-08de111a534b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WB6p7VckXRc3u7zNlvZkkyKkNoRuaAbtFLpjXnZrOk2pZGmKuy86GViYodhX?=
 =?us-ascii?Q?vDDJ3j2OcpDLQPzN/bbVJy37/fKoP+BtzTb0wvJ3eMW0Ai3rjpM91OEdMgaR?=
 =?us-ascii?Q?iHFvkZjfMGLfHxhcs8bAV9GGGs3GLwAdIBEJZgC+kzU27eGG7JRSAGPaiSUh?=
 =?us-ascii?Q?osLhpVY74tvmvc+wOoOKiobKhn8w803h8VCCvjQDdV0u6afR+Tg8813iLV/o?=
 =?us-ascii?Q?ysNtqra88mYEeeUu5A7gEQVoILJtr6jfeox4FrseeH0ll4GaJI26Cbd7NYa6?=
 =?us-ascii?Q?R2OtWH+5JqyXyq5Ig08bwE6q+GgTs05TVUDJZSQgAfIOHLBFE6JdtSBap4YZ?=
 =?us-ascii?Q?GRBJcyGWV7N8Pb+TK21xj8B/YxpcXoxxLwURk1ENH1G4+UzBzGujyYkEMYC7?=
 =?us-ascii?Q?sRp9Eek2sGx2gCHGMXnWs2rLQeT5Hf9ddifzLg0H2K34E8hFJDS1N6WpDRzJ?=
 =?us-ascii?Q?V4hdU73CaeLQaIqODwcgqc64SFl6cUAs9pYU3syCugtcX6uV26XiudTJHpdl?=
 =?us-ascii?Q?NQOHQ26q0aRr4MkPhgFDYnX4ZjUlOtWDhwXz4Nt8RhfxQCVtVm8SFbUlW7I1?=
 =?us-ascii?Q?mYQZIWdmkOCSlaDGDVgR5gBgJ57D/9i2HD17G8zjQi5eFkenSWuz4UKmoCir?=
 =?us-ascii?Q?Cs3cCxMjrAb+fbB+UJ8LzK220qZRG9rwGtV087au9peWtHd2eiFOUPfkEVPL?=
 =?us-ascii?Q?j8zRylKtyvX2WzYb7z4WGsVD3zAUtPC8Kuu9SBm2p//magW5L9xAf8gqtpcr?=
 =?us-ascii?Q?3iY6aVAF9cGjuvV68IgaXl3UClne6BiDpjwFoL/lIZO8LuSbYscyzPGY+42t?=
 =?us-ascii?Q?sunVrD88Xu116Bszq6JZYjfbjzavtpZeLMqS6Egshqz4BkcoQ0x7NVcghEIX?=
 =?us-ascii?Q?hrOCp671A8Ag8hU535L/BRqM7d4VcxOhZU/XUjH1O/+vwKMePHjwhIzRXV5q?=
 =?us-ascii?Q?mIngvtd8IicM+as/AMlo/ePLIKZybBD9wjjabGGOhizcs3nU9brd4K+u29ci?=
 =?us-ascii?Q?B5QA/u3jM4a+4Z1K8UL0ycBLlFZ/akLNKcl/LdSt3fO58te50fs9Vm8d7KAb?=
 =?us-ascii?Q?6jsHerIY0s23ku106iIgBYUDct4ASX1HACv33fDnH/vkzieU0kXSRB1PTDY2?=
 =?us-ascii?Q?smmkwXWEEytj5Prv1w0t1W1Kw7uJb8pneK9LKEh85BxAeqPH0qiRiNdZGYxK?=
 =?us-ascii?Q?OQ+Ql9pQQujHizFasbD1k6tZQuA5TfPe1ujWzILbOY6DhRQ4RJ+QSxeBMENU?=
 =?us-ascii?Q?IrEu0LLBKu4DkE8Fmy5ryv4IOT/FlHLr9dz/DkdOBgcJSxejxxmu6JTMg4Ls?=
 =?us-ascii?Q?Pbf36vNFyvIPK+2h8Y+oaiTbVUqDBsu4J+V5U32yDmWOOtge5hkLVj7aZgTT?=
 =?us-ascii?Q?pnVXFvN31GRxLrl5IBGSGWw8M8PFZGr6fH8qbSihIfDw4W3otrF8g7x2Ltry?=
 =?us-ascii?Q?qryelZYGah8y8lnUzbo/FdvLs1f8yOcv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VRG8PwWjb7B/UIZEqeH25y7MDeQ5rNX6+h2slBCvBWm5bX+HhTNJ65/aGXqm?=
 =?us-ascii?Q?COlEfVt8aj0xVuDxvxkK0C6Vcr8TtKsJNvHJVf24CJ+EpXqTfeFhfUQol0KQ?=
 =?us-ascii?Q?qaSs3uuUM/JDQ8Nhnn3GYCnc1N27ZSVPFzGd7cGiTABcDYXd23PbxSAF/09S?=
 =?us-ascii?Q?JFuhcV+WZolWeYN3fFxl3wIYFlf1iIHMmtSIxYUvGBsj1GnRfprh30fSZZbt?=
 =?us-ascii?Q?OvyZfXrhxdei6jI+0PuNCskQyOwnR9vFJfBKV80dkiOj099A4CT6vXqmGx+/?=
 =?us-ascii?Q?DVRcd8vRkZEYL7flBOpI4RpOx44ZD0no3B8Wl6QeoN67IvZ6HiaQ3rWuO4CJ?=
 =?us-ascii?Q?FF+JW0tSaEJrKtUp0i3bDCnIUmcMTSmcRsTrWfMD1+VTapK4bDJPX0vMaRBg?=
 =?us-ascii?Q?7kRntPafJwR805FH1bGTaP/m6y1yNxpCAweiBQgWmghxKulKqSsfF/fdZLIY?=
 =?us-ascii?Q?nDQjNsCFovxFxrYpc2L7TI7B81FRVLBjA1CF/myhoeM0paLF7C9MynyQpwyZ?=
 =?us-ascii?Q?efBiHxi8ovTU0KH09/9dY8T++ejJT1J5UE9qw9m2OuwMWKInLUe8teW0z6C1?=
 =?us-ascii?Q?yqPU4gfDFv1WJb2PtyMQWRmZ+RJ0P93fZPMicekWgzEmq2IafP815bc9Tun1?=
 =?us-ascii?Q?4/oqppTxhpodrthtNDnsM89x2ayZEePs9ZuuW7GXhMQl6s9jqFVNeZytmQsb?=
 =?us-ascii?Q?NQ377C/nqVHOCREGsQXXwLM0XhkyLGshxRPvnGH+CV5FJpW1JWaP2EYTZjap?=
 =?us-ascii?Q?vs55lv9pdDbTW5ikA+Q3MIC1dw1HC4rojC1+ZIm1Zv4nZTuZwvTkPZh6kwlj?=
 =?us-ascii?Q?8L1M95OP6/HuHj87CFwXfdwK01Oc8ENkXY1PvHEdCoDBaQ2U4Rvf6WGp/sNn?=
 =?us-ascii?Q?W4hNxqpIcr1tCShDqmbg5iY7sBhB5DvVziySgHYM+7Qm2xUp4NVBpqZkB3nA?=
 =?us-ascii?Q?5345BmiAFyr+aAdnpMb+mTCQxBmOansuBitEL/GZnuJoPeuFiqJFZaw+Q3lr?=
 =?us-ascii?Q?BSBln7j1hJSINmVtsI2cIkaTjNe8utRDXd6CmChV7psQMvxQVT907SKjO0jZ?=
 =?us-ascii?Q?5ggUB4/bjkDgegiqeYbDDrzxSzoztABSJPzYCbc1WQHAZ7o6WYjp+2lJIooI?=
 =?us-ascii?Q?aKukVHSZNP/oyFxoWHT36dwJDsX1Ahnb3JPlt9MS/TbrYuJ7+2a2hzc2Ix3W?=
 =?us-ascii?Q?wJIdan1Hh9OeAalomQiN4P8x1g0ae4vWrWxVUt0BX+giv1HHWqwNK0B2sUuM?=
 =?us-ascii?Q?Oz2brGMoMlN4IbGUwG7CInjqeSV/PIiAlpG/V+W+h7ihWuC2JMe7RThnuUje?=
 =?us-ascii?Q?Hf44yUhbhjwyCWF/2c3fZwwOYOZ/lAE4iewmUYgiLDKUjUtP5h7GuapdJaJh?=
 =?us-ascii?Q?aWr+HLY2E60vt88Ysvu7nlRH9m4YSFd5E1ACEitZTrjTXJaCFsVf+YU6UQFv?=
 =?us-ascii?Q?WIoBWM0huQd/3eyFve44gRLBQyoGgpeJz6k1iUR0kXWtSDVgQZ6w7QrZTyws?=
 =?us-ascii?Q?5+PW06/rsLMrHgmnu1Md+psGdWLO7AE4TqPuttmJuzrO912W9bpReD5tSMXW?=
 =?us-ascii?Q?MDhw1p/ljvr4SP0DFGklCVdGHl7geLhYQZjIoSMQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gh6vASSqFD9d19pRSeG/V74WoKd+uYs8BLY3jxFbNqDIiEWn9ML0q3K3FTmkAMwVWsMzPYq0TyBg6YePhIdj9xFV6Q9tFbfUeU5vPh+TjUmHfqMw/J4URRGk90fqdT6hx5Q+bTvD5rYA00ycEKB9ZRhHcAMTWbVLAdegQH5/zWOXTcDb+3jBUDguJTPqPyiUxGO74vOtcPvVUDXiAcM34Nzy1o0VtJH8qKRcBZMFEZAAWto/IG8V14VSAPd7bKGaxRSRoLB5XhDdoTm71fCrO0T/K8KycK0Tbhmwx+acf/FAh/ANlhud7dTDDxAFi9m05OFXx9EBM0h2bqjPpXGbchB8ZdEnOpYyMZRWc3aUykZyaB2zH/c9sSv37ORXlxwtmHB+WCjL3Oe8xl01CgXbjswWlSb8uSIvjrl0f8Q+vtzSk4/k/wbdrP4krl+F+e/xSmpjAEqIyATwhG6BQLcDXsvXRTnbtaO3Zq1dlmkCADIo63RaN8SZQ3/e5PM/lc0URvc5lkST0EYW6HfVHbXK5tetOqhC9Vmuw+j4tFsQxSUCIBriNZJPBjBwvaqx6ZpzTyTVKCeM1WhM2QQKKQU/R5cPcnNJY6hxMDd1a5Arbuc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13842e0e-d0f8-4eb2-f6ed-08de111a534b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:09.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5z/kNhu1OT8OQ5grvzsk5JDYgBRUubNQFEEBQNCV/RmGaRteCRpplnqerQnMzkU9Fj+wbzimbnnjukOed27F0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX0AtjUWEIpOU/
 ZeKQr2ut8l5XY5k/6dZJDTL4NRj6ZeUWRSfXbkJxQ0JQFeSprIw3rttEeYGHZgPA02dCy3RCRrf
 LR2hC5EQIfSZigOSPKUOK4IaSXOtxZzGJpDGuDqPAHUk4lDAgj8P6zrVB3r1+NT4YHYeWYGBqUI
 WQFAtl9D9Jkz3zFCtQW56obiUJ3/RIqxl3yCg9hrolYfV/wGZCUo0Z3jY6c+bEFrBFaY69DnbcF
 Xfeo0XFSesdBT9GWZOped30cQ0WmMEAwqPeT1lqsQwqp6qeGDGnxuiaQA5jFKg3IGR6fM8Cbqze
 xsI6PJX7vrQt4VNTX1iKsQmhhctxD/hkNMTjWVQv8ZDSPrlTqxLOn9oXTx7rQ4pQOF5s+TWTVtO
 6iaMLVFfWiwN2bpRdV45gQb3TIWkSjeYROIQw4FyKpCtY2DePzQ=
X-Proofpoint-GUID: m7Pfm1GCtB5D_FLaZ464K16wjJiOY8VQ
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f84e35 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Kxe4YLzwYlTQVucg5HEA:9 a=pygEKjHW9yQeKNym:21 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: m7Pfm1GCtB5D_FLaZ464K16wjJiOY8VQ

From: Eugene Loh <eugene.loh@oracle.com>

A link to this table did not work since it referenced an ID that did not
exist.  Add an anchor ID by the table and use it.

While we're at it, convert the table from HTML to Markdown and break up
some longer lines, improving readability and maintainability of the
Markdown source file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 ...dtrace-ref-TypesOperatorsandExpressions.md | 140 ++----------------
 .../dtrace_builtin_variable_reference.md      |  11 +-
 2 files changed, 20 insertions(+), 131 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index c76d293c7..bb1c49949 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -474,135 +474,18 @@ D type
 </td></tr><tbody></table>
 Character constants are written as a single character or escape sequence that's inside a pair of single quotes \(`'a'`\). Character constants are assigned the `int` type rather than `char` and are equivalent to an integer constant with a value that's determined by that character's value in the ASCII character set. See the `ascii(7)` manual page for a list of characters and their values. You can also use any of the special escape sequences that are listed in the following table. D uses the same escape sequences as those found in ANSI C.
 
-<table><thead><tr><th>
-
-Escape Sequence
-
-</th><th>
-
-Represents
-
-</th><th>
-
-Escape Sequence
-
-</th><th>
-
-Represents
-
-</th></tr></thead><tbody><tr><td>
-
-`\a`
-
-</td><td>
-
-alert
-
-</td><td>
-
-`\\`
-
-</td><td>
-
-backslash
-
-</td></tr><tr><td>
-
-`\b`
-
-</td><td>
-
-backspace
-
-</td><td>
-
-`\?`
-
-</td><td>
-
-question mark
-
-</td></tr><tr><td>
-
-`\f`
-
-</td><td>
-
-form feed
-
-</td><td>
-
-`\'`
-
-</td><td>
-
-single quote
-
-</td></tr><tr><td>
+**Table:**  Character Escape Sequences<a id="char_esc_seqs">
+
+| Escape Sequence | Represents      |     | Escape Sequence | Represents               |
+| :---            | :---            | --- | :---            | :---                     |
+| `\a`            | alert           |     | `\\`            | backslash                |
+| `\b`            | backspace       |     | `\?`            | question mark            |
+| `\f`            | form feed       |     | `\'`            | single quote             |
+| `\n`            | newline         |     | `\"`            | double quote             |
+| `\r`            | carriage return |     | `\0`*oo*        | octal value 0*oo*        |
+| `\t`            | horizontal tab  |     | `\x`*hh*        | hexadecimal value 0x*hh* |
+| `\v`            | vertical tab    |     | `\0`            | null character           |
 
-`\n`
-
-</td><td>
-
-newline
-
-</td><td>
-
-`\"`
-
-</td><td>
-
-double quote
-
-</td></tr><tr><td>
-
-`\r`
-
-</td><td>
-
-carriage return
-
-</td><td>
-
-`\0*oo*`
-
-</td><td>
-
-octal value 0*oo*
-
-</td></tr><tr><td>
-
-`\t`
-
-</td><td>
-
-horizontal tab
-
-</td><td>
-
-`\x*hh*`
-
-</td><td>
-
-hexadecimal value 0x*hh*
-
-</td></tr><tr><td>
-
-`\v`
-
-</td><td>
-
-vertical tab
-
-</td><td>
-
-`\0`
-
-</td><td>
-
-null character
-
-</td></tr><tbody></table>
 You can include more than one character specifier inside single quotes to create integers with individual bytes that are initialized according to the corresponding character specifiers. The bytes are read left-to-right from a character constant and assigned to the resulting integer in the order corresponding to the native endianness of the operating environment. Up to eight character specifiers can be included in a single character constant.
 
 Strings constants of any length can be composed by enclosing them in a pair of double quotes \(`"hello"`\). A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can contain any of the special character escape sequences that are shown for character constants before. Similar to ANSI C, strings are represented as arrays of characters that end with a null character \(`\0`\) that's implicitly added to each string constant you declare. String constants are assigned the special D type `string`. The D compiler provides a set of special features for comparing and tracing character arrays that are declared as strings.
@@ -1407,4 +1290,3 @@ The D type namespace is initially populated with the D type intrinsics, such as
 When the D compiler encounters a type declaration that doesn't specify an explicit namespace using the back quote operator, the compiler searches the set of active type namespaces to find a match by using the specified type name. The C namespace is always searched first, followed by the D namespace. If the type name isn't found in either the C or D namespace, the type namespaces of the active kernel modules are searched in load address order, which doesn't guarantee any ordering properties among the loadable modules. To avoid type name conflicts with other kernel modules, use the scoping operator when accessing types that are defined in loadable kernel modules.
 
 The D compiler uses the compressed ANSI C debugging information that's provided with the core Linux kernel modules to access the types that are associated with the OS source code, without the need to access the corresponding C include files. Note that this symbolic debugging information might not be available for all kernel modules on the system. The D compiler reports an error if you try to access a type within the namespace of a module that lacks the compressed C debugging information that's intended for use with DTrace.
-
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 787137929..aecd2308c 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -221,7 +221,15 @@ The macro argument values must match the form of an integer, identifier, or stri
 sudo ./foo '"a string argument"'
 ```
 
-If you want D macro arguments to be interpreted as string tokens, even if they match the form of an integer or identifier, prefix the macro variable or argument name with two leading dollar signs, for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes. All the usual D string escape sequences, per [Table 5](dtrace-ref-TypesOperatorsandExpressions.md#dt_t6_dlang), are expanded inside any string macro arguments, regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro. If the `defaultargs` option is set, unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
+If you want D macro arguments to be interpreted as string tokens,
+even if they match the form of an integer or identifier,
+prefix the macro variable or argument name with two leading dollar signs,
+for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes.
+All the usual D string escape sequences, in the table of [Character Escape Sequences](dtrace-ref-TypesOperatorsandExpressions.md#char_esc_seqs),
+are expanded inside any string macro arguments,
+regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro.
+If the `defaultargs` option is set,
+unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
 
 ### Target Process ID
 
@@ -474,4 +482,3 @@ int64_t walltimestamp
 ```
 
 The built-in variable `walltimestamp` references the current number of nanoseconds since 00:00 Universal Coordinated Time, January 1, 1970.
-
-- 
2.47.3

