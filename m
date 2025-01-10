Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8C24B253
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535795; cv=fail; b=DFoMuhxCEpV0ALhcoJ91j8ivoPS7a6FRPRwr2sEq/vgzoSDjwcJoiw597fIO6+fRaIb4WPnYXwXFG+i/cWwyQZAj6UGKjiIVr2AauzOcaXOkvwjG5rxlNANYXlVIUIklBj4mpI6ajrwQH+Y131Zu77QVv3OL5Kh0pffHeS4v4/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535795; c=relaxed/simple;
	bh=VDpMVUPrpdt27QIahQGHEzRJQWUZQzVXpiws09BbeoU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qRCnRn8xnoTTI4Rp/d3MUAzBgoMuSn2wFhUt1Yt3e5jCWdTd6XKVOW5ae0SRhDpAtBoNoBYR/fJVVdIcfecR/JNh0yBdQDiZ3HP9acoKo6vo2d0Gz82mPVpIa/C6dWQFky7IHDwxYG+hOhoqoOF9VSNjipaQ9+G0oKu8MF1GvWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TdvcJF2s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0OPl4eiA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TdvcJF2s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0OPl4eiA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AItsfP002355
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 19:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=BkMNeCiJ1Hncqn8FuT48O5foy1oXnKqncB6Ga1TVlsg=; b=
	TdvcJF2sd8/HJLlP7+QDCmvUknFy3UqtOcPWJE1TYa6fmFccQvIITWYbyr+QJQzB
	arlkyYOD8sjQFoPvLpQK6UlPBt9bHZvNYD7nWfsPvPwicQsmWmY8s6a7DBNkWXqe
	ixkK8177Kro+j5ExGlkulIRSmNZ3A+o2eHue18cu7uNzlek1vO6knqeGav3r1a0Q
	uzQi6ba3sEOxajhlJZxFUbglR1W/4Yg3QcSIRdsERjBgJ0lfxcRQHbcb+Rb/clf0
	U7e1FnvbBfhC76XreDicDVoHpzRU6KXlhBTKyVoPKxUnHOFtjS2JDzomlSeZs97T
	yIU7giXX/kpeFJrz6N6N5A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8uk3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 19:03:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AHsTtS004853
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 19:03:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuecswrg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 19:03:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxrdkkODVSStBnE2WFGqKDprFv0nzv40qTufZfRWkcluTI1k5Bu4XDh85DCyQE+2B3yxRVajt6BAH+JeYdeRDqWCpnNA5oRdIeStxBq55X7NCsRFhSE4R9xOgAU5dONUB0Z67SRLQcWBMJGYeZvIO3DLKZlWDiGqaZeP+5iN3Mp2qxijN9Om22ZBNlxTeN0nzWIlvgPXxiutb2PYlI9D65qKNbDX1Fa0CAgER9hEYCYnwDiN2U4YVAC4xhm+OacNDUcwS1bMJlT5lweQXtAzR5CrxtoPebc+xQSbxcP6uf3jNo+F6s97cV6pUIy/wCEjzPvfLDkkcuMgdiLRIlR+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkMNeCiJ1Hncqn8FuT48O5foy1oXnKqncB6Ga1TVlsg=;
 b=OtMW7dOYDRtBC47b03FANJSyMCCmznRMEeqbGA8EUc5Ca68BgEjVKIXcIw8jcuWbUbzz1nANgLuAMmuez9R/hVDAiz734JmOWKj4m5g9T26Hd1Ra3H5zLheZcnhSj5AaF4+BysEUFmCMuYZl1T5gPYJutwZHIegLaPnpQ98OeWDuZBlJQoEYWXVEW4duPCz+jaqVnuZrPhQUOLYzA7zdLxSdbCjt/qLYNc4m1r08cZAEWKpigBKlvOEExtZUGy6YX0yss92AnhtpOASgfP3bJ3AqM7hUj40BGB4Urvw713N8l41FPqM8D3OI3YIhQS50C0eNfJ1oQgwicTwWEHmrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkMNeCiJ1Hncqn8FuT48O5foy1oXnKqncB6Ga1TVlsg=;
 b=0OPl4eiAoSxU8So9wbVEIkKHsdMZHcbSXVcE4WUQsK8qJ19bUi4x2E+xi8K64uTBtmMz2/cmbrs3cwz4BlN7Rq02DKdHgCpyaLnfz+aridnNBe8Zkp23v/xzSyqmV2ZYYKBXmdizUqO4FkY2Bivj55tMOfwuCEBD8AoQRjJE+pM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4621.namprd10.prod.outlook.com (2603:10b6:a03:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 19:03:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 19:03:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Have tst.ucaller use a predictable trigger
Date: Fri, 10 Jan 2025 14:03:06 -0500
Message-Id: <20250110190306.12814-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:335::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: f971906d-57b0-4f34-8d18-08dd31a96c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SmD5FSqAaY3DG5RK7yI+CxzdwiTki4GKqD+R7fzUMZ5q34UUw6secicYQDuT?=
 =?us-ascii?Q?xzv4n1fQ5WSVCzSxqMLdoV9bKBf3x+dXCptyUw+49NRVIZ9Kz3lBUZkReixw?=
 =?us-ascii?Q?qxJlFPpmmywB2NJMWdXi5qCnlWlXMM+DUHaXmkJjRlgrczw9GuvWaDd6/TUo?=
 =?us-ascii?Q?gcv4Kp3/22ztccBNPdfEVe1tiWk/dbtZl/RxXUYavK1UGK873itlagCtq4zo?=
 =?us-ascii?Q?3txIZaMU75TkDVpyBmCFbXjF9+PEqpfGsaUha6pAqE84bm/EI2M3ABOrke3B?=
 =?us-ascii?Q?7Ux4ERKkuBtzakXNI2UhcKvm81l9eWdMmr8x7zOMKcHa1Lrkc7otckdyRhd6?=
 =?us-ascii?Q?MURLxk8y0fnK+lU6wLMKbMQb5GLLe2BPVsblqow52QRwp0F7Rl7fGXCMF430?=
 =?us-ascii?Q?ZAcS4gM+2o/HPQHaao9J45PADcfSoAHqy0nV8cB0QUUyawemtfH5RrOt0JaB?=
 =?us-ascii?Q?SOAxoA/x+xPU0691rxCZB7Cs/Fp0KqMmswGv7z9H3fM8HA/xUoNrjEumpoW8?=
 =?us-ascii?Q?2vDnEw4cKDvsKjbGppKC62VHvPFcCnwqMP2RCJbfDeJ2M3LVhe60ALJ5K9YC?=
 =?us-ascii?Q?OdIr2KjAeDylopHLxrorPHLfGNsGzHeOZeAoiH737ILxinYLe154N/SkmRTt?=
 =?us-ascii?Q?frsCHBdEUWu+owlXlUVwMpsVUPVzdlDWESkcvuVzGv0sLF119aZzUeUTEYsT?=
 =?us-ascii?Q?iSQ9W0kkzW3JfCAKe+tiN1THObn7+N+uYfMZIaYAc5g+pdo6xU04P+aoPqMI?=
 =?us-ascii?Q?Gak+Lyoz5Y1qi7a46Zu81Gtvx+1f/STMNThzNwIqcHZAGKr1DydNdaO1vprV?=
 =?us-ascii?Q?1qZGoYvfRduW2u/dIX0Q7s2aSAtrqq9wNfeJRglm9CH6wJgZrTo2TMPEfI/l?=
 =?us-ascii?Q?a+/46y7JJcY4ciAS5sxcLckkqrcJbtVhUbivXqqKrC+sTHEvNrrdzu93xff9?=
 =?us-ascii?Q?PY+9X6tECwabnrCGbrheAV1VI3s++GZ/ysZtJ0FKuY8ktaocykRrKjelNj8F?=
 =?us-ascii?Q?kh0FgCWFEkGWsTI9DQbXCini7bMbhpZGO6/M3TC161a3rxnfcEgsQi+sASOK?=
 =?us-ascii?Q?smlCA9C3BdAgZzx99UzaE8588Kg00z7Z3lknHcoaNMfJEZP232R/059JdoeG?=
 =?us-ascii?Q?V+zJO0PqH9MdFmMKSDEqt8IgXTtuOAkBujYBVBdasOBfOtMgV7yeDQYqIFkO?=
 =?us-ascii?Q?hyqORb4zTen22UlH5JS4zyllgHfUEoRfyBjRfelXbMjiF58KO11MxO1pDSWe?=
 =?us-ascii?Q?u5/USc2fOWxppssSvNwnLaMJdQFB1Rc5qP4IIcRBiODghgqqb0FgkblSpbY1?=
 =?us-ascii?Q?SlvDmwO6fdLvQqKJVfOi5r5uKI/E2yXm9DPP4pQnLhlnOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BxZdOjj8C07RIe3/H1J96uOSrrGtV2ls+9YBP01Ehgsxnj8uvLjxFJ+2huOZ?=
 =?us-ascii?Q?5v4JNT/4ZiDa86KVoBtJs/YHgVzzUPgmFN+oVmhttpbC59MJenqOY/5gqB9s?=
 =?us-ascii?Q?XdkRnCa1aosdSab0LaNlIVNmjdR/+WYhylyiWEYuS55YdTpdL2eFOZzyicxu?=
 =?us-ascii?Q?mvO9AqpU6Xk242FuNx7OXZyMmx4Xyj0z+aIRswsn5VhCJHMmMKW0Wk5nhjBa?=
 =?us-ascii?Q?MwWgxVUTIaYIDVbkOzwdYBtSHFyD6jdfUB0LSrRFf/7RIBajMJR3UGlu4kwS?=
 =?us-ascii?Q?pii/kRf7Qwhfg+YFXd2E/RjBZz8ilydpxpPVUkqXDHhhyqF8/0IyFQmBP2nB?=
 =?us-ascii?Q?0CrpCgvDX5Y/Zfapy4sAWMS+/PNZR1gjU4p2edZaFLEbcdtYmy/QygCK0TtX?=
 =?us-ascii?Q?QEfzFa3FyxoJUpoed7JuM4cEjWIv6FV18CbRRNjTplNMX9bVPvX1kp72Hfit?=
 =?us-ascii?Q?z8aWFIviHG/ym25PTdG7yOC3DIlxGs8N4p/JoOgz42pZL9vAPAU4dBv5Sbhy?=
 =?us-ascii?Q?eovQbMZU9ZwRLoZpFTWgEyCAPTX8CaVReWMMzIqEq96xksgRuzlgVa4qGQ/e?=
 =?us-ascii?Q?cgFhaPrZ5PJft+ESMn59MO26Hx9SNSJcLe+mFqWqRi+IzDEXDh/C+0v2CPVu?=
 =?us-ascii?Q?2vHyvK/n/BhW2MtOQm5ydSO9ccZuBFqUzOCau3Aqf/rpsbGp/IPofUF5+RTf?=
 =?us-ascii?Q?HBCipw0ZcDNXTY8rYLOzFgkj0VC2yQXQrz8kWFck/r7luUL36iTu5i5MLzUd?=
 =?us-ascii?Q?JoGQ6qkjMIZzsu3OXbXKxZRcdVzt6D03k/GMQpgvK37KiE8Z6iIBsyWlh4xC?=
 =?us-ascii?Q?N6B6jk3lknus8PNNrTZcOreJ4JedIkFl+fdZQyN0C+ZxQjltUVi+GoN4xQJe?=
 =?us-ascii?Q?sl0YcirmLPODWPfetPHyualC5vACibJ5pcZICO6aRj9fY0MPmHcyAPBQbxYF?=
 =?us-ascii?Q?PhCCkXHb3MHzhQLQCM3qz5WBkbgEM/OQ0MoIEB11ewGpQjVO9PeuK0qjj0j8?=
 =?us-ascii?Q?IDs+HeSAtbnTJuDOB5S3yXCmQQwzkZL67FF0udX2SGEquegejPAZKUFVAOqt?=
 =?us-ascii?Q?oAHerhdkIt+Sbqa8zrw/8Oq1hXJcBNP9/8YTdlLrbO8wZ4p/ncM5j0a74Nfv?=
 =?us-ascii?Q?JJ1kfWBMnUVKeXupccG1SvpEocpdvTczCrzIuXAemVCKwzjV35mRVRIv8VrG?=
 =?us-ascii?Q?m4oleB4HpWA42u0KzFQorzUOvW3iD1pbGK56fDwuf+FKioM92xKrYCM0uro2?=
 =?us-ascii?Q?6c4UdU55w0+YkLvlMEKC6u83VMM8EtvNgq+LZ5asWsBTjvXv+XgZ6KWgJ1zJ?=
 =?us-ascii?Q?D2IA4lsYsuKJoj+zQ9toq4uvfPvVTyA1M6fWLUryAUhkLW+bmRy2dPRdHs/c?=
 =?us-ascii?Q?TnTJC+WnGXgd15YlVNOuf2i6Q9NcT9aoNUXBSWkYcyFXW2wZGfhpUWQFUPdI?=
 =?us-ascii?Q?zz5G4eIcc6N+xmq6CNkClYg+CQQMCvYcaeD0tJCK6wiX05BK/SEUjBpGlsJe?=
 =?us-ascii?Q?/BtLQpY6PHJHQPl4boKiQ+GLJO5TUB59f9k+iQ9dz4FDgyDEp1XKNmJJ6wVQ?=
 =?us-ascii?Q?ahR3qUJs9dYk37/i0Xccn3rLVLyiP4QQ1wPElSBp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EC3QZQkGpb6HjcJz3mOck/cuO0+ONopb5dwBrngpaAzWC8W2DwAc7As3/ODRpx9vNhMdHy++YjQZHkF/x6S7j3Yvd4iGNkTwwksQ5RiIDE+MNo6xSCbIzAYYcfoHLYjLGJpQLsKJldzqdMBIx/HYbJ9wmJPd2Yrf+FnPG8TzW8m1eJpT4OBxaL+fE9ogo6G1VhZ/hapfzvwVENyLezrYK6E6D1LhBGfSH+PWETY+VBAS7IPH+udLPnjeQlWXiqSQ/GV3U9p+glRwH5jOrAxUBgH8UPuAzwsavVJInW2Te4z53WrISzzz9VfJyWgf8nXYKXriqvt1PPeZ3F6XGHfUEzOWXur79dmLDIagJ5C2H2Q1FE80eUR8UpOyTnKPTXgrTOGdgPZO7dGa9i8n1H4i5Lk7oPTVCI8J9oC85yy8tcvynRikWZfoW8W0pS9CVAZCCXLRQNp0jea0mMvkTl2TtBHjHyJUo2L7cB/GmbIhbRW2PRwKBzCr5Ik2iAoB+919F7I1Eq+qx0MaCva3a6NmIt2AEIMw/pUODAf+8wRZOyzVfAlAPRTv/9rVVn2Fzq3/JGNqhVXz6jXUtsPCnYureqQYLRpuoO/WVCIEiQiHovM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f971906d-57b0-4f34-8d18-08dd31a96c3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:03:09.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i0ny3A0glES50z1lDfx4j0/IZjGpoYKWGQ0pj3ntMN8ovdUX7UrSnQAs/hSCiBiWFIJUG8sZWyh9sulqmm9UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4621
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_08,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100147
X-Proofpoint-ORIG-GUID: 3ezxoeMDzeSGr7rYdciwy0IVDTV_ndGK
X-Proofpoint-GUID: 3ezxoeMDzeSGr7rYdciwy0IVDTV_ndGK

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/vars/tst.ucaller.d  | 16 ++++++++++++
 test/unittest/vars/tst.ucaller.r  |  2 +-
 test/unittest/vars/tst.ucaller.sh | 42 -------------------------------
 test/unittest/vars/tst.ucaller.x  |  1 -
 4 files changed, 17 insertions(+), 44 deletions(-)
 create mode 100644 test/unittest/vars/tst.ucaller.d
 delete mode 100755 test/unittest/vars/tst.ucaller.sh
 delete mode 120000 test/unittest/vars/tst.ucaller.x

diff --git a/test/unittest/vars/tst.ucaller.d b/test/unittest/vars/tst.ucaller.d
new file mode 100644
index 000000000..271297fef
--- /dev/null
+++ b/test/unittest/vars/tst.ucaller.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+#pragma D option quiet
+
+pid$target:a.out:myfunc_x:entry
+{
+        ufunc(ucaller);
+        exit(0);
+}
diff --git a/test/unittest/vars/tst.ucaller.r b/test/unittest/vars/tst.ucaller.r
index 9b09daa0c..bfcc80f4d 100644
--- a/test/unittest/vars/tst.ucaller.r
+++ b/test/unittest/vars/tst.ucaller.r
@@ -1 +1 @@
-  libc.so.6`strdup                                  
+  ustack-tst-basic`myfunc_v                         
diff --git a/test/unittest/vars/tst.ucaller.sh b/test/unittest/vars/tst.ucaller.sh
deleted file mode 100755
index a6376af46..000000000
--- a/test/unittest/vars/tst.ucaller.sh
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/bash
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-# This test is a bit naughty; it's assuming that libc.so has an implementation
-# of strup(3), and that it's implemented in terms of the libc.so
-# implementation of malloc(3).  If you're reading this comment because
-# those assumptions have become false, please accept my apologies...
-#
-# @@xfail: dtv2
-
-if [ $# != 1 ]; then
-	echo expected one argument: '<'dtrace-path'>'
-	exit 2
-fi
-
-dtrace=$1
-
-$dtrace $dt_flags -qs /dev/stdin -c "/bin/wc -l /dev/zero" <<EOF
-pid\$target::strdup:entry
-{
-	self->strdup = 1;
-}
-
-pid\$target:libc.so:malloc:entry
-/self->strdup/
-{
-	ufunc(ucaller);
-	exit(0);
-}
-
-pid\$target::strdup:return
-/self->strdup/
-{
-	self->strdup = 0;
-}
-EOF
-
-exit 0
diff --git a/test/unittest/vars/tst.ucaller.x b/test/unittest/vars/tst.ucaller.x
deleted file mode 120000
index 6507ccd87..000000000
--- a/test/unittest/vars/tst.ucaller.x
+++ /dev/null
@@ -1 +0,0 @@
-../pid/test.x
\ No newline at end of file
-- 
2.43.5

