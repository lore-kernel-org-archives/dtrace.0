Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2671AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383300; cv=fail; b=uF4Ihhs6oqV4IJe5KS5wmrnaKyBk8UAmm3Hu3dJA+7Zx3Kj5dgnrp49v2YZiFo0cGUioDsheERWaK8HaWJoikkQLYwSg1FlrBXkiLuuy9c66G5uz8+myi1D5O04uLnVynMz1hNmC6fSOagMTJwRWsxelE5r8NLRK4OZlQGuVbyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383300; c=relaxed/simple;
	bh=PbcWdPt1w6UsR4FJ3kQ2qRlbs4WBhm3cf3p6VBJzhew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBfcu0oIX6VXDR6pJY67wn7II8k9Q4R8hLIMjRenjiymo7rpkTjzPpK90qQhh6ssbAAEs4S1kEFEV59F1gUqrklc8+m2yfkwoSJaKY7uqVJPLzcmUfyB9yMvxumi0hBQkNQpOS18sX/IlRqyfkhsaRI8lz1JGgGiNP43kPAMKBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NaVssL/K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ldg2o27C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NaVssL/K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ldg2o27C"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIOx6014688
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9dIEtRW5S3IdU9Lstj8mMNTSWKfPWRzTl11rTfTwmhU=; b=
	NaVssL/Kvz6LrVc20HVUanIeRTJwhUt0fy5k08yY29bmbh+8JX5EUBy0f0QDp+sb
	/Q5P4pQIXMVKXK0NH/B+2X37tOt6SnIhS7UVMY9Y/8oy1f9DOhGBcnqMgEJMp19g
	k/byV4WgzB9TazAB/kHETQsuR2ohuUzQvOkNZZRR7YLyRQXc3KriGfT++92blwlH
	hKBxWQl2WvXTsBv6Dqj4slsFsGiNa7nWD+j7PdtafwDKzqPXLXiRfslaOqzTJZ5/
	hxV1y4SuDwG3tQfpQE3j5QSiJcBuYXgvoJoJv5+OwbuvUMHZs5CdCf+GXaZcaifU
	FcDE5aDMNvUTkVMsia1rWg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8257rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527JW49n017882
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpf4gpr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwwRneteBz0z2Ae5mkn5OI12jSXLzg/Sti0QvJzMam4cDehTkTWGtB2nxM/52oJ+S+g8I2dgh6QgnuH1dmIuQzqaFKobw24mXKdD+XMpPRJ3M1SAAJzZMpWX7bZWVbEK6vPQnAqNzdVB7wAFEClpQ/iMtYdbmYbob4qt5Vxv8piOHMvrcopdzqm1N9xjyXaoTRB3GO52PsnV9/Aqqcn1WmTWRTWEA82WbxsCtGON92kpffMjkmX47kZhoGtJzWm1XzSYBcyQdFYFPmvY3JrsoFrtLQXXY33sqc0GaNh8YDMn4s8Vkc8WQUtBSAnFJ7ihN5HZIOkxi6q4YLty7sO41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dIEtRW5S3IdU9Lstj8mMNTSWKfPWRzTl11rTfTwmhU=;
 b=lr8sBijspYYgZe2N2knz2VU/VOnppPq+koML4QF7aUiOGQclpo4NYHKhvscpo1dlQGp5bnZif3t26uC1ZkWRzkbLrKI2aknc08x5qGFryj9t8dloDh8GrZc5t8MGgZhEKrxv5p2nvucAXEW+zZKIjwrTnJ9O2Dg/9gT3dXSLcoWHPWLyrDeajUxMQI2umPm55HOke096jLDAp7HhLWcFOj0HIA5NTrrXUadiYV+3Hy/6lmwohUgF3M/tjJ+DTlSWwEvu8Jn3xuTaadCfbwIt13wenXzMnddEwXLrLOLWBzn/uqOmWQ4gAVo1Cz3EHYP6ED9sBskMeeAW2bS8ReaUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dIEtRW5S3IdU9Lstj8mMNTSWKfPWRzTl11rTfTwmhU=;
 b=ldg2o27C3Vcqyi8HsmZsnO84oMrZM9iyVh/WH9gj6knqBliUi5fsw3x+lT1BOUNPgMQgQp0TdQzaNqtjbZLPmE/VhrKiFWzlUvJdw7CnX/i/UjvV795xSeQpDRuiKkzpXPcboNbV+vBz3v0/qCDVwAIQ7BJfvwyeos86x+8/KH8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:34:55 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:34:55 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 3/8] rawfbt: perform lookup on true symbol names
Date: Fri,  7 Mar 2025 16:34:36 -0500
Message-ID: <20250307213441.9495-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: b11674b5-bece-4551-3535-08dd5dbfe6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQz51TOG3E7Nr6ZMlcO8IAhIsD1cGfBXwCJFrRN9tqdDMgA/L9z2ggqYB2zd?=
 =?us-ascii?Q?eai9wqOfd6JaJ1jqhQ2UZkiK9cANDHFLqlPYKG91zwtDq6SfdGd7qobTRXY/?=
 =?us-ascii?Q?NPYIsFvnLd0ClOoTEKhMMKs6+xpA5toinxRZuIUCndYkPShgm7Hz3W4YYNjn?=
 =?us-ascii?Q?rnnrY9Gb9hN1ZyLMSQmw0Gvg3Y5BE37NEyrxkerek6XGVK7scnNaZs6XnPj7?=
 =?us-ascii?Q?HM7o34sJj5BWKovCV9N2qFnw0ZQYoNlDKi2qCGf9JfkZlBLnJ7b6lNzNjatq?=
 =?us-ascii?Q?B9K+Bi/A4zkUpscXgiNqlo/ukXpq9sz4Tm+kc91c2Rod10zkjeCG5bJ0ZWpZ?=
 =?us-ascii?Q?tw/XCaTjc5FgKvO7UW16Ma7nHLXzoHEyayfgrQyQHSktmV9HUpt5pR9F6W5w?=
 =?us-ascii?Q?nnW6Bb9wTj267if9LPdY61gDWRGohtFR6DQqWKkDVr/zzG5dRQlDR6qQx5yC?=
 =?us-ascii?Q?3YbcDR8w4ii35CEzZndwXj1FGn15gGKJqWv5zNpUXFYUN7nq1Mci8piA8ONo?=
 =?us-ascii?Q?+B2QlAsbuZ1BzSai8d9ywyVTv7k0CIP0Ol+p723bS2lKLmd1cSrxwjjtsel8?=
 =?us-ascii?Q?R3GoLgQHFMftiIfWNJtHcZYV1ANcwNKckRJAi7lwHiffgPt4MN3NZ7+TprMo?=
 =?us-ascii?Q?gQWXEcEhIEKg+hn5miPLyk3Qc7rqfdOTm210UBYdkzxUCOQiDu0rLGU5Zda4?=
 =?us-ascii?Q?3QEuXSETJTcdhL+KIQb5VxC++BfSim6vCH1YTfFVy3fzg/z/IOh39ivVHtcs?=
 =?us-ascii?Q?wGtsmOo+pH8jer0axYUwyLlnaE8nstkEMtOu4b7KVXKBRMseCX4DoYfsbEnD?=
 =?us-ascii?Q?DLuujq40p8evzqzM7KnFzKGfMwAfODrzoOWy6+E5570JshVKz2+/NKHtJaPy?=
 =?us-ascii?Q?wND/82DzZWQMaXzQbKKJ9r8zz54QzR870jkhXrop+B4SjYj17IiGOhlT1qii?=
 =?us-ascii?Q?Z16YCpUhOu6itWG4FkJlocD0IPxUNu9lVcJRU2ZvDKe+ZjujtpYL2xuZlgAX?=
 =?us-ascii?Q?QvAPhXYFF9XUvl/DioR1ltszsWlSVSmAIqH7NgLg0DMxUKThp/h6TlHtrd/2?=
 =?us-ascii?Q?zGCTIyzluo62R/O5sybpe2to64e8GhmgXWzvu2L3prH/1MKsznpmQKI2N4I0?=
 =?us-ascii?Q?xC0o12rLnj9UEwtPPdVQAkR3GTFmhfufDD8RIsw0xtJDbFj1T3y4Nasyzsst?=
 =?us-ascii?Q?UYEfyshyht0cHYwHyegYlNAdf50A6DGR+zP+5X80rdflpaauetV63NJqzuiG?=
 =?us-ascii?Q?nfn5fhvO3RTYRMkeVdr16x0clT51f/FEGBArnwDE6xbIVYD+O0l3/dtcWqwi?=
 =?us-ascii?Q?emVIIFZYMDkVSs3dFlr2R0A2fi20PfumfDrt4n/heN+uhqTQF8kLNvEXJDDJ?=
 =?us-ascii?Q?wvPlS+QBVtTs+oJJg3u2NexUptKu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gKZwvU8OJIGuReGis+kzVH8WbF4PKDJydsb5MprTIwsIMxZzmTP95hvBST17?=
 =?us-ascii?Q?J1RoIt4uUH4XNYeHl8lU++K3OPcuknGSu5HtVQkbcUrkHZf8hQyBExdntz4n?=
 =?us-ascii?Q?JCX8bbe4ZiZge3nAZRBAlw7JhtnGBfkNZ6rluorz26p2dkC1qvyb704LMnVM?=
 =?us-ascii?Q?DVDYvxbgmo7/mzeoM71I73rGS3I0zCW3x88wi2nXAn6Je0PJgVqbLsCZIMIT?=
 =?us-ascii?Q?42KIyNCOraAuOM9HDJqyeexCM9X1y+ev5XOZdEFn3sYg+HveLi7AgdFf88Bw?=
 =?us-ascii?Q?6uxTc7NthY/IL4a7g3XAWTncw8dQ1tetS+DCgdOPyvaT/7X6ukRpoLZJ2l0/?=
 =?us-ascii?Q?8RmTogEwKVv3qgAdDua/yiOAmU++DUNGSIAOLNkP55O5iB2BgCCYvQy29dHN?=
 =?us-ascii?Q?1VDBW6dPO1TeodWO6J0YAdSc4Mvq4dWm3cFnRzdhzUf+cpQC1WtumF738pIv?=
 =?us-ascii?Q?WVLuBi2PDchpARN08SqQG9WNQEEr98mKlMrXakKAefRYB2rIWKmJn5YIqyOE?=
 =?us-ascii?Q?2NXQw4uQDXP076UwUmm79U1s6lEar8MKDtIDECMSW84Y9jw4D8/AieT7wvH9?=
 =?us-ascii?Q?GZOqhkQOowBnPkdCR+8vCjy2hHYUuRyo9w91asHJ0TGAYxbqsEjoogfwc6Yq?=
 =?us-ascii?Q?TRY6hdiaY7c4F2q9sbbKZQ0Q33yBdvUNRYcWdnKUHoxZ/1C4fp5meg/LStyc?=
 =?us-ascii?Q?QcuXQ9vcgCfvAz5KRT0kVoa9U/w/2HApbj2QJX/LAiW6jv8hCDrExqU9ri+I?=
 =?us-ascii?Q?P13N5ilXqY4ry8vJYglnXCTTu/fjXILNNQm8fwFOcfYRlNGZgSj+zfGiPZqA?=
 =?us-ascii?Q?/DioA5cyxVGMfn3rT83jBFDz5A83QNttw5eLDOosUvMtrprxd6feXjARJegy?=
 =?us-ascii?Q?Vj03yYOeSn7xD8ayJ4xHaK8o4gkprpVLId8y8FS5sRxWRpCmFSt5KfqcS7S1?=
 =?us-ascii?Q?eY5os0jkBFRLFyzJV0u5QAC+KJ3vp3nkIDPpCdFy1e2OkueZ9T1z8sl+3QVe?=
 =?us-ascii?Q?bR4ZdorMplIl/t1qHpvDFzb2idjYEn2U0WXDexMzIRK2XplkH5arMLuXsbbh?=
 =?us-ascii?Q?CbEMbHAqa3OwlhO9zt9ILs0A3CzjTla0MBTo1Lg7Zacylnugz+fUvVaN/a7p?=
 =?us-ascii?Q?WFqi9FroD/y3D+c3zIYix3TKzYJK3Jn0kg/JAZHAYmEBW3+ITjhhUUkxtvb8?=
 =?us-ascii?Q?NI6Nfmwo6jFUFGLxigepfOBiNKjOvtrTFkLDE/UawKLprmVYLKHZmIn0reck?=
 =?us-ascii?Q?H6hsFBWkvBoJ6+7ci9ozx/szr2dRWCpoNXDgy8iPQYErq5WByhiXSzv5506W?=
 =?us-ascii?Q?g4oBA3r6k6FVIM82qVWAtOlWx3MexVn7UqfwMb//uFx29Pzp7drqv6Vwyw9e?=
 =?us-ascii?Q?0N2cIoxRXvMS1Zs6eqH56dsxu1H4yAxZo7U3+erFbNwwcTeKGVNn+pIJxO+A?=
 =?us-ascii?Q?q6/ZD7VERW/zjINP5+ZJPmG1+RxFERwM7LeuONVE3FgukBInW7LfiZxraBZ+?=
 =?us-ascii?Q?gmm77SIMj9Eu6VWyw29OY/WSPhXzJXtMOVJ4U5MuN93f0MaqfpDZLiD5dHvG?=
 =?us-ascii?Q?YJsmF42LcepzYrRG9YInHaLFuLNym13kjxFc+v9lGDT5UUrXuuq8nDXXI3Lx?=
 =?us-ascii?Q?Iw3DVSPsUVueI7401DZsuWs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W9A2wAbAyRn4bsbmH4mVyuCkV/3Wr4OtX0bcSo3eZoFbz7BARDlXB1Cn7rpN8ycMtPfvpvRk9uYdnd9hyu29Pj4027r70d4gK79fgxEiU/RajdnikT6T0ZmObV90oEHtinuLK26WbCh3yF/HtNACjHKmLZ3N0oJ94X9YRgk7mzXdQXEIa5hmWpbEOfTPaPIzD98/hcLU4MHYazh2e8nGrdPTD7VOs6Tb1KjeGIGef7AEVFXEm6AYJdOHrCcC6yqjLLKshB34omffMPvbRcU7waKxlIx58DfBnw1xnk1AXkx9aqnIF+QsMvrYjYkW1ayibamz8PV+YWJNOTcHPto7WP2wmWCJSrzIQ5ZiXVyNcBFdOKaKMctiuFNDK3yrYhNw5q4ostU6iDL/E3zTgzIxDX9gcWergImmjL2SmHthrO18Xik1ucHPrT2tiR7QoGThLomtFAwdQoXqIfBAPrdG6IPyIJgDBBp5ZGRH2LdN+Ckhl/3kNJ+IwmSicAdwYPq6m1BlP+wJi4xM35Y/2inajbKpEbTENI7vc+7dNQHJO+bie/fzw8hBQ0izkRskKmLf4VZ+2fmBIUlDU1kfUfgtZxzf7gSyPLqHRoHvDmBGn+I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11674b5-bece-4551-3535-08dd5dbfe6e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:34:55.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo5kd6pK8Uf+Z1EInvRh8ba5fmAAby3ekhZWYVNqB5Qtpt19BsUW+E9hjttHMVl59b8O8h3hAf2C9gxFta7BELGDrr+N4EalWEAzAin2rVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-GUID: -WBY_yqPEm799_D1WbRNKKT01iISDMMq
X-Proofpoint-ORIG-GUID: -WBY_yqPEm799_D1WbRNKKT01iISDMMq

When encountering a <sym>.<suffix> symbol, a symbol lookup was done for
<sym> instead of <sym>.<suffix> under the assumption that names with .
in them were not listed in kallsyms.  But that is not true.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_rawfbt.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
index 4c8e8130..62f2f4f0 100644
--- a/libdtrace/dt_prov_rawfbt.c
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -122,27 +122,9 @@ static int populate(dtrace_hdl_t *dtp)
 		 * try to determine the module name.
 		 */
 		if (!p) {
-			char	*q;
-
-			/*
-			 * For synthetic symbol names (those containing '.'),
-			 * we need to use the base name (before the '.') for
-			 * module name lookup, because the synthetic forms are
-			 * not recorded in kallsyms information.
-			 *
-			 * We replace the first '.' with a 0 to terminate the
-			 * string, and after the lookup, we put it back.
-			 */
-			q = strchr(buf, '.');
-			if (q != NULL)
-				*q = '\0';
-
 			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
 						  NULL, &sip) == 0)
 				mod = sip.object;
-
-			if (q != NULL)
-				*q = '.';
 		} else
 			mod = p;
 
-- 
2.45.2

