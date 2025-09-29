Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FDFEAE7
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759175261; cv=fail; b=WAaOq3pVIkomD6REx4y69eYyc0xlmj/YZySh+PCceHgJelKGuiIzD1y2uXRgg03jMrYhxg/hjhFWHEc28Tx6hSRlcascGTXC+CV3/7trUuZ9NL9ISThSP8LXOsXSGtynM1Y08RvhmdUhohY/fYWj7Cr0F/emyFoyZ8oSqq7TvTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759175261; c=relaxed/simple;
	bh=Rrpug478PELhpRJaqS/e/xqNwsulnxsB/JBXU1UT6yo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=UdrKk8Ruy5kHI6182nMCGv6xxDMZbFQ9mTDSAAJ08jBFbCShzvuDdTcF/U0W/MyoN48P01lhYZPEy6t/HxruJTLoxsLDl5Xcaz4dFdTh3eSbVhS78l4d0qe0Jwmov5GduwRYwAP3Ya9XRlF/Wv1sSVIcpVbC7rWUurm/PoXzwzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IjZZmeVs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qSUUwOMj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IjZZmeVs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qSUUwOMj"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58THsqMZ008303
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=9nw/zrzz5p/B3gjQROGJgHIJA9X4EmLLMThStyvnPT0=; b=
	IjZZmeVskCuX4fre4fGsxYpIQleU/gPMDKZsZKFcVSLKHANHmvZ5L8XbWmXfuzpW
	MK31NgQBwutPFcFHlfC2n4GWWWXVMAnQUZ+H9sB9R8AilUMk9B6AT3Q8yP5EFRjl
	fbjliAkiN3jCP1VaRQTUONJAbtH525A1Vq1x5uMVKK7kqreEwPlPeatcXznmWuz+
	I0DuGgdEMzYtvaBzL+Q4+mipSNYfthywZnReEZpJ7KLiUR/8rVNj/zpsCxikToMw
	opzz0L7b3db2O22Uqj+VQCjX8GhohdtPWTCWtfMxJZrcAglWuaESsf/r8gvx2j1z
	FumABtB2w/EXi3xnWyUuwg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fxx007j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58THpWI9000548
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:36 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c6wagc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GC28quF/6xcuM0OMryUup6gpzzryD//i85FQKN8Dqamtv9F4HxAt5gl1WgfYfrCSqbIYrcft5k9Hn0uFFsxkoclo2xmfZd/WYMfBR2EbtvbJU0djcCI/xjpXrslhjEDlIA8syevknFaeDeS2aZDTIYTMoDEHinctzovTimr3b/9fU3qySwz2vAPzcFs8dsdI/PCYuXL5W1lnsueGwBmLYoALgYPjlCL3pyspxmuWSjFBF56HHUrRTKgGBT1p9ZNREXPgJePJKUMdw7Mon1769iSyk2zLzVkkJq3idlmeRn6IRWDVsjInxkbaUP9BzOuVs8PA+a0M/6azp/Mj+2cjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nw/zrzz5p/B3gjQROGJgHIJA9X4EmLLMThStyvnPT0=;
 b=fK4G4IXtf305Uc3yFcIRFJmN9TEEtlrI1MgsY9L9Y/JrNL2Ju91anPYKRcMzLKmSwYaLDaB0bQ1lyvYAcewezquRdGbJQ9PocvPuDTdHKYdb3Ww2Kk8W5fUvLzseCQwbj9tjiXvKhjGlOQ/+NcoX6M+otnCrBIak1hG46RXySoKOaijZj5kOa1K1ojL+YZJ/SlbI8nSyw1wEFdXsvVx7BDhpJmf3VrK/2yOM3uJHRNyGyevN+wbai01NR13uh+DE/OsX0Q5Aj94caAUD2hRww4kr6cXZkNVHE73T7THTyi3yp+kZZVKQCcaL5INSQdgm+EHlQKx2BJxOe/2dowK/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nw/zrzz5p/B3gjQROGJgHIJA9X4EmLLMThStyvnPT0=;
 b=qSUUwOMjhXkcZaKaXkHSmChMxk4ardCA4jBk/ITE9/cKSNK4AUw0Ly3NcsvBDFINUH5i8B60uzK+PohWqZenAHVIix1fZq/wIQHtOTR6o4IDKwcKKkHJWSuaoMRo7Pts0UJmMuOyL6zWEK/MlkOQAJ/uIHsUkdpAU7Y0uMlpwAE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 19:47:30 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:47:30 +0000
Date: Mon, 29 Sep 2025 15:47:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] cg: transition [u]stack() from action to subroutine
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672351690BDFC2E13664F13C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: b047dd84-c5d1-4214-2ba1-08ddff9106ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0JLRzjS3/x5Sov+ZnZBCwRb/UYyYt2Z5sI+Jdqm1d1CNzGq7S8A+TGuVsQtv?=
 =?us-ascii?Q?nYL1EaMn0c+pknjPa1iMmfU2Vjow91sLQqtEkCnz5LMssjR/aVoVkGSX59M+?=
 =?us-ascii?Q?U//ttzoFpLTLhp3sObAtt1uRpLjFiFLvV7lsZq2rl8V83bdJsZcaiJXqx8e0?=
 =?us-ascii?Q?ukM9CoLk6eWHb8E2UiP/789mHHoOk+6rPLfH43LWeO3ltp1Xvv4QrWpnAZbF?=
 =?us-ascii?Q?2Y2I6wVCvDogkqdSXKU1pD5G/xbjTLRTQNGEYayr0jjGDtuyUMiXULFEROdL?=
 =?us-ascii?Q?BrQo/SHvCd2BMHcy4TWelidQXyTbew68dPLIlRisi3wbe5qvKfVvMxntD4bw?=
 =?us-ascii?Q?RXGfpM+qJOpLFTSjzRqabGbOAgjKsIl2znF3ANjbZv80BKXWOQNjLSdQHnPd?=
 =?us-ascii?Q?RObt3aY/CFoD8L/p5+4as9mkTguDANZjVooYO0bU69vZRlguULSzsD4f4jFE?=
 =?us-ascii?Q?AhbeBANPGNZFnVYeCQ0Yq2FnQnkXiA8Fx1cH9ddsf3zpWB9tzBav0d04cVsD?=
 =?us-ascii?Q?hKxOYuvKV3NLZa1utT1AEh8Oi86wwlMUkgjTjJZ2QdAwdUkU4Oue7iIS3nFS?=
 =?us-ascii?Q?zrLPcylcGB4v8+I+zWRgRjSPJ4N7gmCSTvoKWggJXRD10BuCC2A8VfI9R2oP?=
 =?us-ascii?Q?2CfDg9N1Cqr6M5phLoHKUO7RaGPczNm4dFFbHT10RUwZZqgjdYE0uCE4CuZw?=
 =?us-ascii?Q?qirSFj+L1WBCU6dnU1UGIGD/CdPxk6LyCHVzcEHdjdtYVet0AszZUK6Dq4/O?=
 =?us-ascii?Q?H8hG6m+o06f4RW9+KwsRzvfbZenrTYbz50564gGKktZyo5bUgpaEjUeJTIiU?=
 =?us-ascii?Q?hyUyfhtt/lHEIi54P3U6C9GESajv2HnDO5bBZ6DEebUliBxr7TOlnPkGLq1p?=
 =?us-ascii?Q?HvdUaH43laMSX8416D/uYTZN56Skjfl1w4c9FD7F5LqGttUPZdSmm6gkV3du?=
 =?us-ascii?Q?e+wQzGoIgkllE5eByzoFfir+0MZVzED7vLHcj5JQdDN4Ov6+G4U1AuCqGXdk?=
 =?us-ascii?Q?FiQqdog8ilcPjRPLYnSjyztijmbEVZzACseGEaUFG2a1LmMt1vay8AnPKShf?=
 =?us-ascii?Q?pzCAoRTAjXpbvnBWoX9zHsoq3pckQ+7P3ozDcGOzRb9sVTuVXHdRFXnbG7RM?=
 =?us-ascii?Q?KxbvOzE7QPTNykf8/VAGsWDrgLzER2Qay6GlgtR0SJaDvAjDkY6y/oxJS+Uf?=
 =?us-ascii?Q?u43lPzXaXGkcJs2mXbyfQcEw40fz3yxuoUyjf0/N1tsSGJ7bNfX0fLkJ4JDn?=
 =?us-ascii?Q?5GJLTq4tO55NA+/PiZ4AIt6eD5Hn01TkzKSTXlqiMfIqAyrWNPYcSrClwDOW?=
 =?us-ascii?Q?4U17qjBuDYnuR9sjVJGnjZmi69SVjiLX1De+XriSA+xWoA2MO4aWSHlfTp4j?=
 =?us-ascii?Q?ZIChSwd6OBXR+93gn96PaeiUj4WCUsNQow8ij3BnpbwpgEu/6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zbJ7V2SXuPz0LINz/c5ATaAXFeniaBGVTitLVUB1q9HrmVsKUWbX6co1ALQ?=
 =?us-ascii?Q?NLKwb5M2thUCNQnBKLjIhmSHNBT3EfTXQCUR3aYPMN9ZFfOI+TVYg5OMJFut?=
 =?us-ascii?Q?r6GQM5QZUsS0601W8fcBwYxLjLmVvLGiTOwQS5MqTtoQ5UdSCooE0TG/86sQ?=
 =?us-ascii?Q?700OP55LlGwVF7QkhWdBZPzinmQazroq+ecGWQwN5hmv/1ENDW6Mm9Weseny?=
 =?us-ascii?Q?NFmuiIIJ7/wE6Cmxx3h3ruPW6dFLf1IgrBLzr1RpQSRcxc5D6/3L3XxoXTru?=
 =?us-ascii?Q?H/V7zhsR4WuRs9Ed81nxEkFB8eUK6fMXSN4aomLXgkkamkM4VydR1tuNkX8l?=
 =?us-ascii?Q?xOXjC4A/Ai7pGJlcgrj4ZDWfQdjlxu3gPuNSymt9jU+0xmRLtJRZdtq3w6vi?=
 =?us-ascii?Q?1SCYe1CiINnZkAegMFjDdBFqywk7xz/2mBzNxUdN+EoFjs0HmDGgFdMcZHhB?=
 =?us-ascii?Q?a6dcbTH7fowvAeVrbMb/yS8x1Vv8QetpbElewKXH2MOeAGm9r7Jl02TiOR72?=
 =?us-ascii?Q?fv7vBKhW3WOurJmCCsmZPjN0pKJ5QLyHdjK0mMMgonr5vTO+y1QbUPKJGCrF?=
 =?us-ascii?Q?onU/xewrKTK4pMYvfiRxfpptauIN8IGAyxSirXL5a6pWOBpHzNtWtVkzsKbn?=
 =?us-ascii?Q?9Qf1BhIzl/Eo7JbfsbmQhyiCRGzz9TJA1ZBXgEEujJRUzHM7onFPaHUBOuiW?=
 =?us-ascii?Q?iv5X9hC0HTOQeylCdQO58kDMfAxCzT3w8/9TXGodKYpr3+h97xQaqXkJVoeu?=
 =?us-ascii?Q?rtlIfQvXL9FS1omytEbFqXi0ISQbILxQJfsXTiQg/q9VO/QR/q556SK4ban2?=
 =?us-ascii?Q?Il9dzonz5TkJ0BHk/p8UpjfqssK5Jl1n2nFt8+7VC4cb3V3lveqGJV639UPK?=
 =?us-ascii?Q?FwCs1yUNzZTGiZdT6jTrumv34LoFkDMuzkFA/0rR/uu9K6AIz77S3sINq+Uz?=
 =?us-ascii?Q?BF24V16uVJVOVcjLHUx1a0Agg5jnTkAYvM55b1DW77KvPSkd6VB5fJJDpAGM?=
 =?us-ascii?Q?XzliFN8XXZePcsadHXeXDtuRMs0V54/pl1uho4Y8M5Oo1ImDXl3wMjsFCg1t?=
 =?us-ascii?Q?DxvhrhUlYdb1gQ9ea1zpgO6xSdJfHIpL4jmUfe7OEvxaQ+hxd2gwak2kg9e8?=
 =?us-ascii?Q?Dwyrli2QqkMnVrWo+0XfeFLYGuIVeguOeSdlWI667Tiqko6k5h4Jfw8Y3VFY?=
 =?us-ascii?Q?4ykh+K9cUTN5d1EwlrFX7hHxQDExdrQ3cvMAqYqv9f/XwloR96UP4IXzCgQE?=
 =?us-ascii?Q?PdbAgd2K4+eIc4ZA/9XsFFdcHSnwEiU6g+nxd/mPBy0rOAbzBd8Z/GBSCNMX?=
 =?us-ascii?Q?w+GACCL+OgRvFqoH/d3H/Yw5IxrdWBPbS8OGuyJiae0sr7EGjFeRh2VUtV7d?=
 =?us-ascii?Q?c5DRfJXB4F0kLCezxZrpI+LzZbUp9VOaz8ZdCwjhJ8HCR7YW1U51sdhSENbw?=
 =?us-ascii?Q?NN1QiK63eS4l96OF1w7WDVPb9Z8pARL08wQMKnnaDq1G3ryMh2lc+bNpZsYS?=
 =?us-ascii?Q?YftOiDJXInpgWh/BaP0SshgjrrCeW8AVTJarG5dmPl6uz2FP9jLV0vko5moD?=
 =?us-ascii?Q?1gXXoKj5CfqjBqngtXftZW+YtCxguwkwUBCf0HFy2+JXTJiJ3M71pBQw6VKa?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j9Smdzk6WcnuH8kWYKlmZ12kjv4X95QCwb8ZsPOs918ldUtW3yK7XP6pbmf8WZb/eECHoWhEhUH1ot0IDBo2UZDt0VnPTPRHOlBJ/q5obgxv+wzKjX27fHmZDy9IO3CPLzz0rWhkLSpcEMRFWpgbQmGnSj8STxqqWcWSKU7b05p6KZATQS/x6SwYH5C6NJOvMTGbM6x89YGuuGfY/zY8Gou5aWiO62t93HgjYwpv7q25F1Xf3fdysg/5+Jf2vgQbzInXle/F3QoS7PHD7ieQGAgIhdrXFCekKCuk3EmqoYjpb0rT50+HTT73WFDKDR6v0y82znNyeBeJpB4/FzbkQXwArm5qqz7DpkvHG0NxX6aw1Ekks9b0VTOeJVZ5d2i75l/rQ7S6yoDfW7UQ/k7r0FiOf8zp9fzGg4y01IgFb2mY8Yv+kNOzW60/CxRDWJa39zynv1yEQoXNt0CQmmM2+i9i3Zup3fwI+TRL0eEMTUD4WfYme+OsRMoOe4UEBun5Ug4Ye+b9r3Oe2IoUT4rShXtm7r1Ca78ygaFGaqTbEKKEIvkkl7XU3RHoR/BnHN6QCS4TbuGFPnWEgChlaTrq8d6awMvMpaBoaco0Kk7jVUY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b047dd84-c5d1-4214-2ba1-08ddff9106ad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:47:30.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hxh+xMwB5xpiteW7dkg/ra2mhYfys06moTiPKnU01KAQCRDJdbgatU+3Yx+kUKPus+Y9sjvinSbWMnE3K2TkemiaOSnQrx84d4Jjkj2Mt64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290183
X-Proofpoint-GUID: zG_VHtNBB6JcHAAXzVu8XKrlx4TilCsi
X-Authority-Analysis: v=2.4 cv=dJ6rWeZb c=1 sm=1 tr=0 ts=68dae259 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=0L1BIAdUPHtrkiloyE8A:9 cc=ntf
 awl=host:12090
X-Proofpoint-ORIG-GUID: zG_VHtNBB6JcHAAXzVu8XKrlx4TilCsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE2NiBTYWx0ZWRfX7EWfPkvUj9pI
 jVOpx6qp3DQb1De5FpVsEeu+Y7aQUUdTGrQyiW4CESEp2ciCycZ7aFC++qMHr0A/agaEiZ0afrM
 sJNh0YkxTncGNzdvWz/vnajLLLgBPhBpBtwaMeTmaueWAZTn20SNGu4fzgk417D4m1mmRuPZdua
 obUXs0Dds9UFNbOgdZpmQH4xhSDdCwlY2qtGxEFPiaEs/d8a3KmQ3KDu9KVxdV99GmombtqoKDP
 pBSg7gF2dp6ywvdYV360Uzg6UXhBIa9USz4lGIdq/pk99usRYxEaMFd8igisj7cxrhMt/eGxmhd
 DcUJXk7USKPr8CoG/zKsUirtRAFL7sJfXysRJOyl82rEkk+VXXlBWa3zF8wnZA8IpSlFUw0JS3p
 j2ck5r2DYKUjggSl2vXMztjL2rWfuW5LCTrBij7DDwuIyArXwt4=

In order to allow [u]stack() to be used in expressions, they must be
subroutines.  An exception is added to allow them to retain their
original behaviour as data recording actions as well.

The implementation change requires a new internal type to be defined
(dt_stack) to hold stack trace data.

This patch does not allow [u]stack() to be used in assignments to
variables just yet, but it supports all previous uses of [u]stack().
Additional functionality will be added on top of this.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/dif_defines.h                  |   6 +-
 libdtrace/dt_cg.c                             | 350 +++++++++++-------
 libdtrace/dt_dctx.h                           |   4 +-
 libdtrace/dt_open.c                           |  21 +-
 libdtrace/dt_options.c                        |  44 ++-
 libdtrace/dt_printf.c                         |   3 +-
 test/unittest/funcs/tst.subr.d                |  13 +-
 .../printa/err.D_PRINTF_ARG_TYPE.stack.r      |   2 +-
 .../printa/err.D_PRINTF_ARG_TYPE.ustack.r     |   2 +-
 9 files changed, 289 insertions(+), 156 deletions(-)

diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index 9f6e3b55..a18614d2 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -210,8 +210,10 @@
 #define DIF_SUBR_INET_NTOA6		43
 #define DIF_SUBR_D_PATH			44
 #define DIF_SUBR_LINK_NTOP		45
+#define DIF_SUBR_STACK			46
+#define DIF_SUBR_USTACK			47
 
-#define DIF_SUBR_MAX			45
+#define DIF_SUBR_MAX			47
 
 typedef uint32_t	dif_instr_t;
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 51473667..0299ccb1 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2723,7 +2723,8 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
  * The "kind" argument is either DTRACEACT_STACK or DTRACEACT_USTACK.
  */
 static int
-dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actkind_t kind)
+dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
+		    dtrace_actkind_t kind)
 {
 	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
@@ -2743,12 +2744,9 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 
 	/* Handle alignment and reserve space in the output buffer. */
 	if (reg >= 0) {
-		uint_t	nextoff;
-		nextoff = (off + (align - 1)) & ~(align - 1);
-		if (off < nextoff)
-			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, reg, nextoff - off));
-		off = nextoff + prefsz + stacksize;
+		off = ALIGN(off, align);
 	} else {
+		reg = BPF_REG_9;
 		off = dt_rec_add(dtp, dt_cg_fill_gap, kind,
 				 prefsz + stacksize, align, NULL, arg);
 	}
@@ -2762,11 +2760,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 		dt_regset_free_args(drp);
 		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
 		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
-
-		if (reg >= 0)
-			emit(dlp,  BPF_STORE(BPF_DW, reg, 0, BPF_REG_0));
-		else
-			emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, off, BPF_REG_0));
+		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
 	}
 
@@ -2774,14 +2768,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
-	if (reg >= 0) {
-		emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
-		if (prefsz)
-			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, prefsz));
-	} else {
-		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
-		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
-	}
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
 	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
 	if (kind == DTRACEACT_USTACK)
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
@@ -2798,11 +2786,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	emitl(dlp, lbl_valid,
 		   BPF_NOP());
 
-	/* Finish. */
-	if (reg >= 0)
-		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, reg, prefsz + stacksize));
-
-	return off;
+	return prefsz + stacksize;
 }
 
 static void
@@ -3909,33 +3893,42 @@ dt_cg_arglist(dt_ident_t *idp, dt_node_t *args, dt_irlist_t *dlp,
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOTUPREG);
 
 		/*
-		 * Handle actions that can be used as agg keys.
-		 * If we are not an aggregation, dt_cg_node(dnp, ...)
-		 * will alert us there is a problem.
+		 * Some function calls (actions or subroutines) need special
+		 * handling.
 		 */
-		if (idp->di_kind == DT_IDENT_AGG &&
-		    dnp->dn_kind == DT_NODE_FUNC &&
-		    dnp->dn_ident != NULL)
-			switch (dnp->dn_ident->di_id) {
-			case DT_ACT_STACK:
-			case DT_ACT_USTACK:
-				/* If this is a stack()-like function, we can handle it later. */
-				dt_cg_push_stack(BPF_REG_FP, dlp, drp);
-				continue;
-			case DT_ACT_JSTACK:
-				dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
-				/* FIXME: Needs implementation */
-			case DT_ACT_SYM:
-			case DT_ACT_MOD:
-			case DT_ACT_UADDR:
-			case DT_ACT_UMOD:
-			case DT_ACT_USYM:
-				/* Otherwise, use the action's arg, not its "return value". */
-				dt_cg_node(dnp->dn_args, dlp, drp);
-				dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
-				dt_regset_free(drp, dnp->dn_args->dn_reg);
-				continue;
+		if (dnp->dn_kind == DT_NODE_FUNC) {
+			dt_ident_t	*fidp = dnp->dn_ident;
+
+			assert(fidp != NULL);
+
+			/*
+			 * For subroutines, stack() and ustack() don't need to
+			 * be evaluated until we fill in the data of the tuple.
+			 */
+			if (fidp->di_kind == DT_IDENT_FUNC) {
+				if (fidp->di_id == DIF_SUBR_STACK ||
+				    fidp->di_id == DIF_SUBR_USTACK) {
+					dt_cg_push_stack(BPF_REG_FP, dlp, drp);
+					continue;
+				}
+			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
+				switch (fidp->di_id) {
+				case DT_ACT_JSTACK:
+					dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
+					/* FIXME: Needs implementation */
+				case DT_ACT_SYM:
+				case DT_ACT_MOD:
+				case DT_ACT_UADDR:
+				case DT_ACT_UMOD:
+				case DT_ACT_USYM:
+					/* Otherwise, use the action's arg, not its "return value". */
+					dt_cg_node(dnp->dn_args, dlp, drp);
+					dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
+					dt_regset_free(drp, dnp->dn_args->dn_reg);
+					continue;
+				}
 			}
+		}
 
 		/* Push the component (pointer or value) onto the tuple stack. */
 		dt_cg_node(dnp, dlp, drp);
@@ -3972,7 +3965,6 @@ empty_args:
 	dt_regset_free(drp, BPF_REG_0);
 
 	/* Reserve space for a uint32_t value at the beginning of the tuple. */
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, treg, sizeof(uint32_t)));
 	tuplesize = sizeof(uint32_t);
 
 	if ((areg = dt_regset_alloc(drp)) == -1)
@@ -3986,53 +3978,62 @@ empty_args:
 	for (dnp = args, i = 0; dnp != NULL; dnp = dnp->dn_list, i++) {
 		dtrace_diftype_t	t;
 		size_t			size;
-		uint_t			nextoff;
 		int			is_symmod = 0;
 
-		if (dnp->dn_kind == DT_NODE_FUNC &&
-		    dnp->dn_ident != NULL)
-			switch (dnp->dn_ident->di_id) {
-			case DT_ACT_STACK:
-				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_STACK);
-				continue;
-			case DT_ACT_USTACK:
-				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_USTACK);
-				continue;
-			case DT_ACT_UADDR:
-			case DT_ACT_USYM:
-			case DT_ACT_UMOD:
-				nextoff = (tuplesize + (8 - 1)) & ~(8 - 1);
-				if (tuplesize < nextoff)
-					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
-
-				/* Preface the value with the user process pid. */
-				if (dt_regset_xalloc_args(drp) == -1)
-					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-				dt_regset_free_args(drp);
-				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
-				dt_regset_free(drp, BPF_REG_0);
-
-				/* Then store the value. */
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
-				emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
-				dt_regset_free(drp, BPF_REG_0);
-
-				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
-				tuplesize = nextoff + 16;
-
-				continue;
-			case DT_ACT_SYM:
-			case DT_ACT_MOD:
-				is_symmod = 1;
-				size = 8;
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
-				break;
+		if (dnp->dn_kind == DT_NODE_FUNC) {
+			dt_ident_t	*fidp = dnp->dn_ident;
+
+			if (fidp->di_kind == DT_IDENT_FUNC) {
+				switch (fidp->di_id) {
+				case DIF_SUBR_STACK:
+					tuplesize += dt_cg_act_stack_sub(
+							yypcb, dnp, treg,
+							tuplesize,
+							DTRACEACT_STACK);
+					continue;
+				case DIF_SUBR_USTACK:
+					tuplesize += dt_cg_act_stack_sub(
+							yypcb, dnp, treg,
+							tuplesize,
+							DTRACEACT_USTACK);
+					continue;
+				}
+			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
+				switch (fidp->di_id) {
+				case DT_ACT_UADDR:
+				case DT_ACT_USYM:
+				case DT_ACT_UMOD:
+					tuplesize = ALIGN(tuplesize, 8);
+
+					/* Preface the value with the user process pid. */
+					if (dt_regset_xalloc_args(drp) == -1)
+						longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+					dt_regset_free_args(drp);
+					emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+					emit(dlp, BPF_STORE(BPF_DW, treg, tuplesize, BPF_REG_0));
+					dt_regset_free(drp, BPF_REG_0);
+
+					/* Then store the value. */
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
+					emit(dlp,  BPF_STORE(BPF_DW, treg, tuplesize + 8, BPF_REG_0));
+					dt_regset_free(drp, BPF_REG_0);
+
+					tuplesize += 16;
+
+					continue;
+				case DT_ACT_SYM:
+				case DT_ACT_MOD:
+					is_symmod = 1;
+					size = 8;
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
+					break;
+				}
 			}
+		}
 
 		if (!is_symmod) {
 			dt_node_diftype(dtp, dnp, &t);
@@ -4052,15 +4053,12 @@ empty_args:
 		}
 
 		if (dt_node_is_scalar(dnp) || dt_node_is_float(dnp) || is_symmod) {
-			nextoff = (tuplesize + (size - 1)) & ~(size - 1);
-			if (tuplesize < nextoff)
-				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
+			tuplesize = ALIGN(tuplesize, size);
 
-			emit(dlp,  BPF_STOREX(size, treg, 0, BPF_REG_0));
+			emit(dlp,  BPF_STOREX(size, treg, tuplesize, BPF_REG_0));
 			dt_regset_free(drp, BPF_REG_0);
 
-			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, size));
-			tuplesize = nextoff + size;
+			tuplesize += size;
 		} else if (dt_node_is_string(dnp)) {
 			uint_t	lbl_valid = dt_irlist_label(dlp);
 
@@ -4068,6 +4066,7 @@ empty_args:
 				longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 
 			emit(dlp,  BPF_MOV_REG(BPF_REG_1, treg));
+			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, tuplesize));
 			emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size + 1));
 			emit(dlp,  BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 			dt_cg_tstring_free(yypcb, dnp);
@@ -4081,7 +4080,7 @@ empty_args:
 					  DT_ISIMM, 128 + i);
 
 			emitl(dlp, lbl_valid,
-				   BPF_ALU64_IMM(BPF_ADD, treg, size + 1));
+				   BPF_NOP());
 			tuplesize += size + 1;
 		} else if (t.dtdt_flags & DIF_TF_BYREF) {
 			uint_t	lbl_valid = dt_irlist_label(dlp);
@@ -4090,6 +4089,7 @@ empty_args:
 				longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 
 			emit(dlp,  BPF_MOV_REG(BPF_REG_1, treg));
+			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, tuplesize));
 			emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
 			emit(dlp,  BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 			dt_regset_free(drp, BPF_REG_0);
@@ -4102,7 +4102,7 @@ empty_args:
 					  DT_ISIMM, 0);
 
 			emitl(dlp, lbl_valid,
-				   BPF_ALU64_IMM(BPF_ADD, treg, size));
+				   BPF_NOP());
 			tuplesize += size;
 		} else
 			assert(0);	/* We shouldn't be able to get here. */
@@ -4128,10 +4128,10 @@ empty_args:
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
 		dt_regset_free_args(drp);
-		emit(dlp,  BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
+		emit(dlp,  BPF_STORE(BPF_DW, treg, tuplesize, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
 	} else
-		emit(dlp,  BPF_STORE_IMM(BPF_DW, treg, 0, 0));
+		emit(dlp,  BPF_STORE_IMM(BPF_DW, treg, tuplesize, 0));
 
 	/* Account for the optional TLS key (or 0). */
 	tuplesize += sizeof(uint64_t);
@@ -6324,6 +6324,42 @@ dt_cg_subr_strchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	TRACE_REGSET("    subr-strchr:End  ");
 }
 
+static void
+dt_cg_subr_stack_common(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
+			dtrace_actkind_t kind)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+
+	if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+	/*
+	 * Collect the stack in the static buffer (because it is an invariant
+	 * for a probe firing), and return a pointer to it.
+	 */
+	dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, DMEM_STACK(dtp)));
+
+	/* Call the stack helper function to collect the stack. */
+	dt_cg_act_stack_sub(yypcb, dnp, dnp->dn_reg, 0, kind);
+}
+
+static void
+dt_cg_subr_stack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	TRACE_REGSET("    subr-stack:Begin");
+	dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_STACK);
+	TRACE_REGSET("    subr-stack:End  ");
+}
+
+static void
+dt_cg_subr_ustack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	TRACE_REGSET("    subr-ustack:Begin");
+	dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_USTACK);
+	TRACE_REGSET("    subr-ustack:End  ");
+}
+
 static void
 dt_cg_subr_strrchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
@@ -6953,6 +6989,8 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
 	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
 	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
 	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
+	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
+	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
 };
 
 static void
@@ -8692,43 +8730,50 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 			uint64_t arg = 0;
 			dt_ident_t *idp = knp->dn_ident;
 
-			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL &&
-			    idp->di_kind == DT_IDENT_ACTFUNC) {
-				size = 16;
+			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL) {
 				alignment = 8;
-				switch (idp->di_id) {
-				case DT_ACT_USTACK:
-					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
-					kind = DTRACEACT_USTACK;
-					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
-					break;
-				case DT_ACT_JSTACK:
-					kind = DTRACEACT_JSTACK;
-					break;
-				case DT_ACT_USYM:
-					kind = DTRACEACT_USYM;
-					break;
-				case DT_ACT_UMOD:
-					kind = DTRACEACT_UMOD;
-					break;
-				case DT_ACT_UADDR:
-					kind = DTRACEACT_UADDR;
-					break;
-				case DT_ACT_STACK:
-					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
-					kind = DTRACEACT_STACK;
-					size = 8 * arg;
-					break;
-				case DT_ACT_SYM:
-					kind = DTRACEACT_SYM;
-					size = 8;
-					break;
-				case DT_ACT_MOD:
-					kind = DTRACEACT_MOD;
-					size = 8;
-					break;
+
+				if (idp->di_kind == DT_IDENT_FUNC) {
+					switch (idp->di_id) {
+					case DIF_SUBR_USTACK:
+						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
+						kind = DTRACEACT_USTACK;
+						size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
+						goto add_rec;
+					case DIF_SUBR_STACK:
+						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
+						kind = DTRACEACT_STACK;
+						size = 8 * arg;
+						goto add_rec;
+					}
+				} else if (idp->di_kind == DT_IDENT_ACTFUNC) {
+					size = 16;
+					switch (idp->di_id) {
+					case DT_ACT_JSTACK:
+						kind = DTRACEACT_JSTACK;
+						goto add_rec;
+					case DT_ACT_USYM:
+						kind = DTRACEACT_USYM;
+						goto add_rec;
+					case DT_ACT_UMOD:
+						kind = DTRACEACT_UMOD;
+						goto add_rec;
+					case DT_ACT_UADDR:
+						kind = DTRACEACT_UADDR;
+						goto add_rec;
+					case DT_ACT_SYM:
+						kind = DTRACEACT_SYM;
+						size = 8;
+						goto add_rec;
+					case DT_ACT_MOD:
+						kind = DTRACEACT_MOD;
+						size = 8;
+						goto add_rec;
+					}
 				}
-			} else if (dt_node_is_string(knp)) {
+			}
+
+			if (dt_node_is_string(knp)) {
 				size = dtp->dt_options[DTRACEOPT_STRSIZE] + 1;
 				alignment = 1;
 			} else {
@@ -8739,6 +8784,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 				alignment = size;
 			}
 
+add_rec:
 			dt_aggid_rec_add(dtp, aid->di_id, kind, size, alignment, arg);
 		}
 	}
@@ -8822,10 +8868,34 @@ dt_cg(dt_pcb_t *pcb, dt_node_t *dnp)
 				if (enp->dn_kind == DT_NODE_AGG)
 					dt_cg_agg(pcb, enp, &pcb->pcb_ir,
 						  pcb->pcb_regs);
-				else
+				else {
+					/*
+					 * Special case: [u]stack() in statement
+					 * context is treated as data generating
+					 * action.
+					 */
+					if (enp->dn_kind == DT_NODE_FUNC) {
+						uint_t	id;
+
+						id = enp->dn_ident->di_id;
+						if (id == DIF_SUBR_STACK)
+							id = DTRACEACT_STACK;
+						else if (id == DIF_SUBR_USTACK)
+							id = DTRACEACT_USTACK;
+						else
+							id = 0;
+
+						if (id) {
+							dt_cg_act_stack(pcb, enp, id);
+							pcb->pcb_stmt->dtsd_clauseflags |= DT_CLSFLAG_DATAREC;
+							goto done;
+						}
+					}
 					dt_cg_node(enp, &pcb->pcb_ir,
 						   pcb->pcb_regs);
+				}
 
+done:
 				if (enp->dn_reg != -1) {
 					dt_regset_free(pcb->pcb_regs,
 						       enp->dn_reg);
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 9ff6cca5..b50a1395 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -128,7 +128,7 @@ typedef struct dt_dctx {
  *	    completed.
  */
 #define DMEM_STACK_SZ(dtp) \
-		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES])
+		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES] + 1)
 #define DMEM_TSTR_SZ(dtp) \
 		(DT_TSTRING_SLOTS * DT_TSTRING_SIZE(dtp))
 #define DMEM_STRTOK_SZ(dtp) \
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 509f263d..ed0b14a1 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint_t" },
 { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
+	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
 { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
 	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
 { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
@@ -273,8 +273,8 @@ static const dt_ident_t _dtrace_globals[] = {
 { "speculation", DT_IDENT_FUNC, 0, DIF_SUBR_SPECULATION,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "int()" },
-{ "stack", DT_IDENT_ACTFUNC, 0, DT_ACT_STACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t])" },
+{ "stack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_STACK, DT_ATTR_STABCMN,
+	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t])" },
 { "stackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_STACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint32_t" },
@@ -328,8 +328,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
 { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_regs, NULL },
-{ "ustack", DT_IDENT_ACTFUNC, 0, DT_ACT_USTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
+{ "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
+	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
 { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_2,
 	&dt_idops_type, "uint32_t" },
@@ -1054,8 +1054,17 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_type_dyn = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
 	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
 
+	/*
+	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
+	 * final value of MAXFRAMES may be adjusted with the "stackframes"
+	 * option.
+	 */
+	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
+	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
+	ctr.ctr_nelems = _dtrace_stackframes;
+
 	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
-	    "stack", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
+		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
 
 	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
 	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 25e79979..7508f044 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -912,6 +912,46 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 	return 0;
 }
 
+/*
+ * When setting the maxframes option, set the option in the dt_options array
+ * using dt_opt_runtime() as usual, and then update the definition of the CTF
+ * type for "_stack" to be an array of the corresponding size.
+ * If any errors occur, reset dt_options[option] to its previous value.
+ */
+static int
+dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
+{
+	dtrace_optval_t val = dtp->dt_options[option];
+	ctf_file_t *fp = DT_STACK_CTFP(dtp);
+	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
+	ctf_arinfo_t r;
+
+	if (dt_opt_runtime(dtp, arg, option) != 0)
+		return -1; /* dt_errno is set for us */
+
+	if (dtp->dt_options[option] > UINT_MAX) {
+		dtp->dt_options[option] = val;
+		return dt_set_errno(dtp, EOVERFLOW);
+	}
+
+	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
+		dtp->dt_options[option] = val;
+		dtp->dt_ctferr = ctf_errno(fp);
+		return dt_set_errno(dtp, EDT_CTF);
+	}
+
+	r.ctr_nelems = (uint_t)dtp->dt_options[option];
+
+	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
+	    ctf_update(fp) == CTF_ERR) {
+		dtp->dt_options[option] = val;
+		dtp->dt_ctferr = ctf_errno(fp);
+		return dt_set_errno(dtp, EDT_CTF);
+	}
+
+	return 0;
+}
+
 /*
  * When setting the strsize option, set the option in the dt_options array
  * using dt_opt_size() as usual, and then update the definition of the CTF
@@ -1157,7 +1197,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
-	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
+	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
 	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 0d7c0bb4..a3e15397 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -24,7 +24,8 @@
 static int
 pfcheck_addr(dt_pfargv_t *pfv, dt_pfargd_t *pfd, dt_node_t *dnp)
 {
-	return dt_node_is_pointer(dnp) || dt_node_is_integer(dnp);
+	return (dt_node_is_pointer(dnp) && !dt_node_is_stack(dnp)) ||
+	       dt_node_is_integer(dnp);
 }
 
 /*ARGSUSED*/
diff --git a/test/unittest/funcs/tst.subr.d b/test/unittest/funcs/tst.subr.d
index 9f7203c0..d97a0780 100644
--- a/test/unittest/funcs/tst.subr.d
+++ b/test/unittest/funcs/tst.subr.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -36,6 +36,15 @@
 	/*DSTYLED*/			\
 	}
 
+#define STKFUNC(x)			\
+	BEGIN				\
+	/*DSTYLED*/			\
+	{				\
+		subr++;			\
+		@stk[x] = sum(1);	\
+	/*DSTYLED*/			\
+	}
+
 #define NUM_UNIMPLEMENTED 7
 
 INTFUNC(rand())
@@ -89,6 +98,8 @@ STRFUNC(inet_ntoa6((in6_addr_t *)alloca(sizeof(in6_addr_t))))
 /* Not implemented yet.
    STRFUNC(d_path(&(curthread->fs->root)))
    STRFUNC(link_ntop(ARPHRD_ETHER, (void *)alloca(sizeof(ipaddr_t)))) */
+STKFUNC(stack(5))
+STKFUNC(ustack(5))
 
 BEGIN
 /subr == DIF_SUBR_MAX + 1 - NUM_UNIMPLEMENTED/
diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
index 50e884a0..95ac80da 100644
--- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
+++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
@@ -2,4 +2,4 @@
 dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
 	conversion: %p
 	 prototype: pointer or integer
-	  argument: stack
+	  argument: dt_stack
diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
index fc9e1512..5df10376 100644
--- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
+++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
@@ -2,4 +2,4 @@
 dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
 	conversion: %p
 	 prototype: pointer or integer
-	  argument: stack
+	  argument: dt_stack
-- 
2.43.5

