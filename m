Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D246B3D62
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723742093; cv=fail; b=YlaxSNSA/IQC8D+/aHcV3VV9GICMxWgzJyen9a6rVSX/nrZrjop5V7ee9B+zUV8XIpLzW1sp3CJk+UvXE24h6XZ2tOiPsctn7u0O3VCb2VGRHlRd8zNkBr/E023jXnZAHZC6/34LyAQ4SigGSusWjTqJPTFBbgZgMg76ZmV9ZxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723742093; c=relaxed/simple;
	bh=dUs7J/JSYL4lCCFJ6DeMExCR9pbznUlERTT4juOkCEQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YdXZAZTlNorIB6jhl2qXyynWgEd1GGAubikOJUym7ywFPQr/FxZreLfO0lf2BKpMS+YrcJS/Wo0DLj1tO2jtJIqU7HRzQly7lFnvCCwtAWO0WWNdjED5RTwLHaMn+okArriPqrDVY9uZjTCf96q8jEdzDumVtt+oJIeUY0YPaFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hd3rWKi0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LB4PiNS0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hd3rWKi0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LB4PiNS0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEtV1v020565
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=Kn/848WdApBeAuynpc4filh5og2cZrPVKx5QVgOF/Vw=; b=
	hd3rWKi0nBe9dF2jvNcsMTmGBlRT80FB0Lnmr/fLp2FHxXjZ+RxkfKyh7Ru0HDNa
	HilYbteAGNKvRlozUN0aW0jG8MeGyqqJ7SJfu46gHDVhnrJgndY+IkO9U14UTPaa
	iescuka3CBobpnSdA8Tf+3tQCBkFAM6asJAdE9N1BSsDVT+tfXekOAORhTQGA+t7
	WkQnGZBS7poNrXJpFQ7V5ooMTZfAYerOMHv5pAo7liebq1f3Kdf0vcOE0PK3xM4Q
	4SWGLbIkm3l7pPpLfpbPbUZ40JerJYbDfhrlreoqOHvmO5XesBbIGSXvQOLcnef3
	nMueBHk6r3rioVFHt08U3g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wxt12ymk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FGjPoX010740
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnbcyxc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrUy0D+htXY/ik7kz2M+PzTT/5jDV6b2BkWQeGMZU7S3oACu7zpyk3iPL0egon9EdfCpRUX/blP1L9FFA+igA46v81erE3y5K+GJsjoQHfaIX6umwwdodlDbZfpefgFAq2aFpi4FrADMWIvGdqgKXWzIvIWfRd0Y4vu1Ga/gPSiTpCepIAnc1DNpcM9yFtKADtAWtyF4/aCM9Dg5C/TFBWok7D1ZhwJrgk8nX7YaN3B3u7P4FbQ2pMfgHlI83f8i2ms/6FfA4//xRD7VqwKmnq+i5ggE5M1o+PzUsgwo8j+9Bks8jZFT/B3tsoPhlXqDV0YcUxXgAxFvbmK3Nl+pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn/848WdApBeAuynpc4filh5og2cZrPVKx5QVgOF/Vw=;
 b=P78kGaophH8uO9fqzI/OXc62igPVpvRo9/BchUdR3XvsnbYkM5mZqMQfuRiOBLEqVxsuOaZD86VVQf/jRvwlY696nllibihbUbuo4esqbExEdHdrtbL1NrjKqGoMGGLLo3W66pD7FCTk3ro3HVBWEDGA487znG3EmxwOykmgXFKae+AKRsG7DGk+xjynDgxoDH+NA8J4TC3lU4CCVVnRmzMJBK6WbL6Z6IbnqJFW00j34H/CT/il0zW+PpNZ/fQbEnh6E6kAacZx0vQ8HBLZ57NuZSWVJiknfFYTMNzr1X1MkWpWtSCBla0RMdVNcio8skXyTqVb7c3e9ydv3qFmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn/848WdApBeAuynpc4filh5og2cZrPVKx5QVgOF/Vw=;
 b=LB4PiNS04P6nm1qQ4AWJDZQM6b1W0cv/tCBE5ZDTawxYSwG9Zjt1+28hWrz9Cua3Z/IlrQ8KNY8zfU9WZG0sqepqoUJIsuLRbkGpj9VPYoOWc8GuE1bfQjlk8dvhCT/uhh3tK6aCsfUAO0riq+83BYVY4j3BeBnkABExEKoip3g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6457.namprd10.prod.outlook.com (2603:10b6:510:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Thu, 15 Aug
 2024 17:14:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 17:14:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Action clear() should clear only one aggregation
Date: Thu, 15 Aug 2024 13:14:42 -0400
Message-Id: <20240815171442.8490-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 316a963f-c9f8-473c-77ed-08dcbd4dc1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eejAFo3g1oLqpMLBOt2EG6hT7bbLptn0ADFhh5zRUj3ummwQbBqACHFgs1WU?=
 =?us-ascii?Q?Tf5KGks9yKqlx6cBqMcLIzaq+P/ksLbdVxw0wLP8snOxfY585ptjjyUbdzDV?=
 =?us-ascii?Q?HMuDsX9jHX2x17d+0d9gwpFtHYFKTQLAhwi9/cdv4tAxX0X95sZGrE9X8Ev8?=
 =?us-ascii?Q?iOK0DGnjY5kvYuWMaHHQaOU65SO6ccA+D8iMdKgpO5zS5SePPpKlZfYPMvZg?=
 =?us-ascii?Q?7ioOqOjIT070kQ2ZJGi0r2ClC1/MxiEr+fUw7E18pW2yqKmpL92+8Q/o2wKX?=
 =?us-ascii?Q?QeZZr+tPQSSO3k85uBOrG3Jz5JzopMLrcS/xT9uumrona2/k+SnuMSse+H2Z?=
 =?us-ascii?Q?2VO+pP3mpGaBwiVIWKIEa9pHA6wVs56g2MwKWITbYeUXfgOjU1ram9FsQxVS?=
 =?us-ascii?Q?FlQHjFI1/460Hab0vcmf+3xlvpIOpEZCl9AKgNI7uHfWYVl7tLKbVGoW8LGy?=
 =?us-ascii?Q?A28DZ+peG85C+Z3cK8JsQOHeIR7+vzai4hD7OvbJlmwaHjH/BVI6aYiYfeov?=
 =?us-ascii?Q?kKVA9SGbwZq3sU/mSsbFPGdwDNdHVQW0fQLMT5EFWWG4NqKJYTOelU3X6gUa?=
 =?us-ascii?Q?nsAcq1Z3fZBV46FSAR2tE6YWibBxzP3WV08q6H1JaML3RkCTch2b1HYeIC5j?=
 =?us-ascii?Q?+nYQkhBt+OS0mbTOerohVIcn2LkGkxNx18lUa7/EF5xI79uaN906NjbP2aLS?=
 =?us-ascii?Q?GE3ou6KHN7YYGA7Y63O4mVIoMIcjQY9TCtWEPTngH5VdKcsia9tDodGWM3cM?=
 =?us-ascii?Q?lva8BCHmJtOiu0A5ScmCxnolGdZoJI+VcivckSr644tF/BdLbDnbpL4LJDrw?=
 =?us-ascii?Q?X16t2cV+j1kIGG2BdfvY/C+mC4Nr3FRLbgbfCHrfxTDbDSINWjgHHMsRDoJd?=
 =?us-ascii?Q?QHJkJvLEXN9K2ystDRTH8ADJ7Do3rYdo+dbML20CXNBBUWaGc9f5WN87/Tbk?=
 =?us-ascii?Q?vbN8w105WOda4SS5WYl4k1yCaX2IohsykXirVveg2NqNXoD2ImNPXzUnTO9N?=
 =?us-ascii?Q?wYtMdw8v+8LcVjvzItX3txf/D93QlT5aPLANxAvH1q7ZkGFonU5CmnePMZjx?=
 =?us-ascii?Q?thh3UgAlZmiSxQhyjma7EwZeyhjc/TPqJwM3zLmxd3Sz7Bx0JFyVExpcbchK?=
 =?us-ascii?Q?nt8NitQk8c4xLVEbBoj23NKQidGZ9/QvgNZ7wzp7xcy1MI9HQY8Z27f8VTrr?=
 =?us-ascii?Q?5ueOGgjl1LZdGZdnJt7LA7RcWBBXHV03gPLSb085MNK8vPGiuEB0VnMr5Uj4?=
 =?us-ascii?Q?l0GhEeGFHdCUo1wzn9F9qyRTxEdCCvKxHdldSNKxyQXUrDaS023Xbv+VxdAp?=
 =?us-ascii?Q?Vlq2Z70AKwdsMJsuogi5K5nAzuIaK8DgF3c5ofEYNFODcuaho5wzox8n3jhB?=
 =?us-ascii?Q?O9XshJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r0UNjdNa4doI4Qja10Hlmn2BMFiQ+XphntbGVoMK9RknZvw9PICgau2pIet2?=
 =?us-ascii?Q?n0HoyR6YNQdTY67fQ9xbtEVGMmrUP+vwaHIjeLLHBPctTLoh5wzw5kPX54o8?=
 =?us-ascii?Q?3A5fC9kj4NmLLiDJM1TGAVVsd7Htc+cD3U2pNjF5lVy89CVYYuU9fR04LyP0?=
 =?us-ascii?Q?bkYHpXhMUQ0yIK14H2xkG9gUT64D6kxwF8vUucJ1fPZgOvaHrH8z92Lu9D+I?=
 =?us-ascii?Q?QgN920h6ClxSfNKf9JNzIgaKhFBjUUjednPlKVRie9CvPky1XHwjGd/f8rJb?=
 =?us-ascii?Q?IcTpSyltCYmeEnAjqJxon7dvVbYk5kWDiJtU3yPo1a2eOHZVAUoTKRYv0/7X?=
 =?us-ascii?Q?m5bVBRU6EkWszaZXwGhnA4A/10r/63i9aV86ObB5MQX0C6tmwPFeFcRo3DR9?=
 =?us-ascii?Q?2pCWeP2V/V2YGG8/9V5wu3O1sdjqvTLafXx9Jd4W/BzpZ4Q+gBfNtsqGYkap?=
 =?us-ascii?Q?CHR6TUd5oWXfZYyTmWeUE6JcnXev0dVIah50OgIhvLup65vnu0SvyzNej7R8?=
 =?us-ascii?Q?18je4t9WBnSVzDIngST6UUQ7JQLFs/+Lyi+qmlFsy+kBny31V7No9UishGz5?=
 =?us-ascii?Q?JFRgUM73TyfimvbbIFAXARHWmzXBeoz0z7Zj+L5pTSv318V3rD88ab0Lmg5m?=
 =?us-ascii?Q?HdS/iIR6U/ttqx110uCuQQQrXQdmMV63tPf2VF2foA+ZJ+GCnZPTPzDT1pY6?=
 =?us-ascii?Q?yaRYDDzhqp7mdhfd3PAzBOUqAYyYypx9PG2FCDVExwjFvrw92yCJXEh9pUPt?=
 =?us-ascii?Q?a2kHINuJn4Lyn7pcsmkKIaBDcoiNhNsuwmOLmM+cgOOZw7H5+HZSUoc+24iA?=
 =?us-ascii?Q?rANnskY6UGYunnI5ABjtQNfaTUCOV+d4YtIdz+YeHH9gjmHbfxkmujcJ8cfw?=
 =?us-ascii?Q?Id7whmDgIHxsgVDMHF3YsenQtOrgDYeZwD5gjJvz5GtR71DutQQjjXFwqhpE?=
 =?us-ascii?Q?EopSneTBwX9Kf8uV5hHYPKB1gp00tD8nCpzYUyAhwm74Oy1ImxqgZEBlD6Cz?=
 =?us-ascii?Q?/Kdcwm9by5qAS5sJ/A4zepuoR8dMBSYcRIsVpu+KDj+t9yvHp4+JuFq7mu2c?=
 =?us-ascii?Q?HWiDKpojBTJIr6IJ4+w+DDS+awa24bbj/iyRomLXNUyW3s7qJswYheUYL/mS?=
 =?us-ascii?Q?bpTfhVRM6VAaG3ubj6a7kH+2z/xMns3Ez25cZqpUhMq7R9HVs5uZv6yUGn7Y?=
 =?us-ascii?Q?jguNbNewFhMN3B8EtZV6LAontnuyQKrUqOP6ch63h5XCAwqic8F9ooK9MMay?=
 =?us-ascii?Q?oUcKXscMHuK9wDWis/u2ei5oub67psrw2+INusOD3mhbyrUj3BThz43PZFbS?=
 =?us-ascii?Q?ZOgntr68bjbBem7ltZCWg/xolorzVAiJoBrFmJRMuMtJ94Qc0v2xKsClaHCC?=
 =?us-ascii?Q?R1ejqoUGdUCfJlOSgOCmYtiHa6phOFpQ37Hsvkv6gyarGQ+V70TNugsntLIZ?=
 =?us-ascii?Q?npJYIcFQ6i2C6SdSP/jFkPAINzsD670mmgbzsu+FJlcTLs2/6onbwFolQmMx?=
 =?us-ascii?Q?baXHvJuEr9OCziItyc/ngDBYCxyeqBi5T5tPUQxv1VzV0y2ae4W4E1RIIqZg?=
 =?us-ascii?Q?JBy7lKIPp/NvO+gJSxTyRxeSUHJ32RCuC2lhJV1i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+eMMr4CbwCTRe8+knR4kOKTTY7Z59t8cODh2iGii2IWzefHw0jLJRVg3KqI+I6WN0Dm0WBJ/gDEAULTbNN+i0iRIU1/a3Vw8e32quKwGoxdsJHHWQYAgUaNqKKIxOe17EWK9NkC3VIsSoL7lW8OW2HYM7l+3JXOkPzHajzx6GDeD/pKhMeoJEUp+4kGb61GlxjWGBgQbLt0OlTXZ99IdMi8RlJsGvMAmMNCmNfNHwiV2LILyRdafeBfw7ws2oE01ergj4itUD4Ery9Oo0+K4SActyaIPDorpIx+lGfRSIm/GeB56v7D7MgLNXypESutp0wMMCdDQQDZ/mJTcurkM45JwS/dkWAdUbSmPDl1OehcXHc/RGuHbVjezb5IAnkNm8onmSmcoalVV9PWypuXuYWCELyxnA2KlBHIMqpN3P/7zBKqix2u+WTderyvYtLp3D1g4vPlThw2tHdoLJIz/wzJjUbKZ10wKW6ffkvHui1OuF4C/m3pbGsEU6DHBDcmsjt74ME+hDxUmFaihLopHAjkASa6XpjkQnj9ZU2PwKAvxKI0yIyHHaQB3+xwG0m+2gZhnmqA0WQSfm3WltXVm9+Xsfrwr/LPmiQcqSR9d3VA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316a963f-c9f8-473c-77ed-08dcbd4dc1f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 17:14:44.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rir7awc2GrK4IYX4GulOtm2TMxa0B6z9JmbKODxWFqldJwJuUm1U/o7VWYwX8Ja3h8HhMY+LvFrTtu+yomym1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6457
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_10,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150125
X-Proofpoint-GUID: kxUbXT8U1H_I7j_npOTX5eMoCpn_79cP
X-Proofpoint-ORIG-GUID: kxUbXT8U1H_I7j_npOTX5eMoCpn_79cP

From: Eugene Loh <eugene.loh@oracle.com>

In dt_clear(), we:

*)  extract an aggregation ID (dtrace_aggid_t)

*)  increment the gen counter for this aggregation ID

*)  clear the consumer copy of the aggregation, using:

      /* Also clear our own copy of the data, in case it gets printed. */
      dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);

However, this clears all the aggregations.  While the next snapshot of
the aggregations will refresh our copies of the aggregations -- after all,
dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
-- if we print aggregations before the next snapshot, we would display an
erroneously cleared aggregation.

Therefore, change dt_clear() to clear only those aggregations that
correspond to the specified aggregation ID.

In order that only a specific aggregation ID can be cleared, we
modify the last argument to dt_aggregate_clear_one() to be not
simply the dtp, but a pointer to a struct that has both the dtp
and the aggregation ID.  The previous "clear all" behavior can be
specified with an aggregation ID of DTRACE_AGGVARIDNONE.

Though trunc() appears not to be similarly afflicted, add a test for
it too.

Orabug: 36900180
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c           | 17 ++++++++++++---
 libdtrace/dt_aggregate.h           | 24 ++++++++++++++++++++++
 libdtrace/dt_consume.c             |  5 ++++-
 test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
 test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
 7 files changed, 131 insertions(+), 4 deletions(-)
 create mode 100644 libdtrace/dt_aggregate.h
 create mode 100644 test/unittest/aggs/tst.clear-one.d
 create mode 100644 test/unittest/aggs/tst.clear-one.r
 create mode 100644 test/unittest/aggs/tst.trunc-one.d
 create mode 100644 test/unittest/aggs/tst.trunc-one.r

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 51f0d622..e949b12a 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <dt_impl.h>
 #include <dtrace.h>
+#include <dt_aggregate.h>
 #include <assert.h>
 #include <alloca.h>
 #include <limits.h>
@@ -465,7 +466,9 @@ dt_aggregate_clear_one_percpu(const dtrace_aggdata_t *agd,
 int
 dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 {
-	dtrace_hdl_t		*dtp = arg;
+	dt_clear_arg_t		*dca = arg;
+	dtrace_hdl_t		*dtp = dca->dtp;
+	dtrace_aggid_t		aid = dca->aid;
 	dtrace_aggdesc_t	*agg = agd->dtada_desc;
 	dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
 	int64_t			*vals = (int64_t *)
@@ -473,6 +476,9 @@ dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 	uint64_t		agen;
 	int			max_cpus = dtp->dt_conf.max_cpuid + 1;
 
+	if (aid != DTRACE_AGGVARIDNONE && aid != agg->dtagd_varid)
+		return DTRACE_AGGWALK_NEXT;
+
 	/*
 	 * We can pass the entire key because we know that the first uint32_t
 	 * in the key is the aggregation ID we need.
@@ -570,7 +576,9 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		 */
 		hgen = *(int64_t *)agd->dtada_data;
 		if (dgen > hgen) {
-			dt_aggregate_clear_one(agd, dtp);
+			dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+			dt_aggregate_clear_one(agd, &arg);
 			hgen = *(int64_t *)agd->dtada_data;
 		}
 
@@ -1820,10 +1828,13 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 	return 0;
 }
 
+/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */
 void
 dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 {
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 }
 
 void
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
new file mode 100644
index 00000000..e2623186
--- /dev/null
+++ b/libdtrace/dt_aggregate.h
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef	_DT_AGGREGATE_H
+#define	_DT_AGGREGATE_H
+
+#ifdef	__cplusplus
+extern "C" {
+#endif
+
+typedef struct dt_clear_arg {
+	dtrace_hdl_t	*dtp;
+	dtrace_aggid_t	aid;
+} dt_clear_arg_t;
+
+#ifdef	__cplusplus
+}
+#endif
+
+#endif	/* _DT_AGGREGATE_H */
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 8d8c0f54..101e35de 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -14,6 +14,7 @@
 #include <ctype.h>
 #include <alloca.h>
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_dctx.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
@@ -1535,6 +1536,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 	dtrace_aggid_t	aid;
 	uint64_t	gen;
 	caddr_t		addr;
+	dt_clear_arg_t	arg = { dtp, 0 };
 
 	/* We have just one record: the aggregation ID. */
 	addr = base + rec->dtrd_offset;
@@ -1551,7 +1553,8 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 		return -1;
 
 	/* Also clear our own copy of the data, in case it gets printed. */
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	arg.aid = aid;
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 
 	return 0;
 }
diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
new file mode 100644
index 00000000..f96c2db0
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Clearing one aggregation clears only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	clear(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
new file mode 100644
index 00000000..101d173f
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.r
@@ -0,0 +1,13 @@
+
+        3                3
+        2               20
+        1              100
+
+        4                0
+        5                0
+        6                0
+
+        9                9
+        8               80
+        7              700
+
diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
new file mode 100644
index 00000000..0556bb34
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Truncating one aggregation truncates only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	trunc(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
new file mode 100644
index 00000000..a611026d
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.r
@@ -0,0 +1,10 @@
+
+        3                3
+        2               20
+        1              100
+
+
+        9                9
+        8               80
+        7              700
+
-- 
2.43.5

