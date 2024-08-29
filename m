Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB2145FE5
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909190; cv=fail; b=GnAtTGl3PwaYM25DQpK/5td2CdDfW7UFGvVjeGw6R0RujcFRytkcoxsw0uJzC/FMrk6wQp3vutpFcWXARfk6IWqesQFLEHV8uRPca+Azj9tD5kwEpcAnOwwhvJbnMEwoxqX37cIu4tHHmIC3oJHgC1Ax3ZDInuwUwVWgqbpsCbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909190; c=relaxed/simple;
	bh=fCQ2nKR6kNiWZleS98oIWOtiIeRLVXUIYqO9BhGP9h0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dwdm6AXHDu1xLzakLaCiUa4zf8WXqG6rNKc3snZWNCDDMa5yQ7uWxo6dUigiwmSeoqcA8+cpNuYbeksAOFuOChL6UpVFsWfseR6vNrKk3VbOEOIfB6fcJTKuY2TgfrM6vGgzlI/nXeYa/ABUoR5oZXEdbWCDI9VvrbiqZmTtJ3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LsF98Jup; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BedU4bjl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LsF98Jup";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BedU4bjl"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g2CA006650
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=VBzO1jG4NIxwP5
	eIf/VFpnnKZQ+DcTkX477ZrtV2GyU=; b=LsF98JupYCv0HIeXrqUPLnNh8rj5t7
	QMM9lhoOphp7OmLKpw15g2GizbWoNBH8FRNOeVmkO+39tbwbdyNk6OItRpr2cFrN
	ogIYEuujnfItgSnhLujYrz6+DFfJXsmk4yN1ar4eko8SDcKHC1QbKdblq4LDGAAN
	xysaq1U7jqF/3xequ0ASjsBkRSIXzt0PtpuaHGyMxkFkCUtjpQtQfaulei0dzhfp
	PdFEsI3TyRpQDuxLHeBGY+2N9GrQi0duVUBT6w4PH9NCf5Vw+dP17YHGdVbJC0UF
	nVJ3QVqFGH6vLb2FhdBQG7aKNGkkRs3Rn5KfoGUeckZ3R72mU1GbwQCw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Bsk0034954
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp66-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq/vIUTOpOoA7LjaikxAC6WmVVKCRLxHN5KV3LFrBQ/W7vVcfLnyJOgeh3lvpa72xR12WwYnVTk+qrYGpGHFRRd1lLZzV2J7c5lq84PRgaMPT2EygHBWUyeqEuwFJd9dCpHsF+rZEsJ4xg4uzGg3vFaIRknmONmwjb3rtGEkGWttsBMlu7P3ZPd31mnmIXW7ycaQE5uhqTihi88W0vcFo9kJxH4MCLEaUJgtPQ2IBS4FhW+gE9Xw2OiNwl8sslD1TPKWKXIg90nOnrvy5Zao+lmkoeNlH7Sfz+KIEQicCMPlM8iwwIl+b1iH2RSFlfyUKCgA3dbgnJDkheskrabReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBzO1jG4NIxwP5eIf/VFpnnKZQ+DcTkX477ZrtV2GyU=;
 b=JnBloYqVVrGcyZWuFs72jT/cLFgpnkQ+F21Oqn2xKcYDkztL3LVEgiAeEpLMU2/BLTs8ic3vSnodtHKJzbglRY0myC0qFdyZQENvza01esAq3FIKfjvD5H6ImUIjMB6aUkNLf+a4ZBcfWWNN+lkmYIPBtBQgbQzPwjdnSwSBlE2Ohffnzhx9KBCtOKJWp8ZhX/IQM8wCBHWatOznv56bkjXbbFrPi6zvevc81dWM5Aw1mHX1PTlLnzuR74pVg4tnV7lUYJsBtKD0m7fm/hHNr/mBM4sOAG+1JY72bRahLvKaeFiZocMR7k7Q6IJ3QIf0UkKtgWJUzWJUHAjRAxDD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBzO1jG4NIxwP5eIf/VFpnnKZQ+DcTkX477ZrtV2GyU=;
 b=BedU4bjlwOrZC0XQaIwQYLZSjr27bXWihlzAVLVW1bsKf8APuK7wrWhPH/O/kHV03djlG15gpJ2ppsRwHb1HJxrzIzkOjw7Bih3iF9LxN2PAO9HKUqwsimVZvZZ0UGgp/HexudvTs7NL/qaFNVgl+w/BvuwvfgzEDHzceobj4/8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/19] Remove the is-enabled provider
Date: Thu, 29 Aug 2024 01:25:49 -0400
Message-Id: <20240829052558.3525-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b08a768-03e7-4c02-9bc6-08dcc7eb2004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDpVMO34P3sx7p11EeZemowMm5JEFLp01ixFDBUmGeYO4WIbu9u5CjL1ThnR?=
 =?us-ascii?Q?Q4QTpFExWFH/wqBgIqKUltRbbUeWJkH5BcjQziq+WTXAgl0r1JKJ8N6yLj/0?=
 =?us-ascii?Q?2nxnD7lvIt1Iup+p6jdWgpHsEwDmGLriReYt5iWrOpPQd5VK5pdj8U1WpW1u?=
 =?us-ascii?Q?7dqK5QgIEQsAVnJozCtCPG0SxgUJ1jtXnqZ5WA0ivORYurumzgrrDvXcnW37?=
 =?us-ascii?Q?zKn8GWu9WYTQ4wo7NzgMKAgU/YA8Zf0Z0u3JCQ22jwqjgFzCjIq8MvHQ5+g5?=
 =?us-ascii?Q?JaS7GZMDBulNVtpDZP8g33cn0QwAh/HP3YMIpD4wpp6NPqrWjS/H7VCzl6h3?=
 =?us-ascii?Q?uiLcWOvvr+oeXs0+fw6ihoQxJmt3830aFBHagYUCBrSXllPQkgheVXManPjU?=
 =?us-ascii?Q?glf/FyMEP5gejS69oTzl+9K2g62C7FkzIERf6yCgVEncLrxMVIc7oS4D1MyN?=
 =?us-ascii?Q?+nQAgSGXhRUJQmJQ9Qevdvxl9e5hA94PGKSMJXsXVq7SQXuit5POkSoE9UZ+?=
 =?us-ascii?Q?LTveYeu6s0lu1dZ824xn3AsqNrntXh8Sqrc3rCurIYotyaRK8PsRgPgKW6om?=
 =?us-ascii?Q?xoCtqb4Dmi5rZ5z89//QUkOPz9iRVKw1iKFWEhOPGUIXAm6Se63XlXKE7iRA?=
 =?us-ascii?Q?kLE3qpRSilJk0E7ls2X+Y9oaBTwf688PDzY3pWcbPA/x6WsxENMqXsDbhtt/?=
 =?us-ascii?Q?4saqwC3aGPIap33aarKHKrfbjoNupBWr9Gh1Ru7DddAF16afykb8EtLV+d+A?=
 =?us-ascii?Q?6feECT4tCy/tYIwnOxCEUnWCNi1z30mWglNZ+jZjSJGzCAnBQBUnDbbqw698?=
 =?us-ascii?Q?lDlT4wUjCTCA1xALGh5gcVKiOzUDSnV6lPXQOAj7mpvZZHl4hKe3VGyEAyE+?=
 =?us-ascii?Q?hSXPPlGgiS/Q6Xz2tL1N2IAOAAmE1oSuV5eb5SZj4uUmJmCog2uL1y1IJQ1/?=
 =?us-ascii?Q?0DYlPZIRU03l2xd2QRTlAWNhCCG1pG2qjp53vw4+h3QSzd8/kRy63hs7eOGq?=
 =?us-ascii?Q?JvUKPk9gkKfjy1WDMjCzvA40QuUkqK5xaeEmTtyns7/1s51I3lf9DizeetJv?=
 =?us-ascii?Q?OVrjRPG/7EuU4HWYh/c5d/LQ17Tdf8huiLF0p7wb6n6eZr4MHUcF3SBWYOfg?=
 =?us-ascii?Q?1tzyZ5oYonV5AbT4xP63Ee77sJgV7zUnm8lBHaoTWJRhVsnA0gVxzRdmo+I4?=
 =?us-ascii?Q?ODkhYm3ukmYU5tjlx8fg5qJr40kyhG5SKAIqnNjfba/NQixuHuu97fvznOC3?=
 =?us-ascii?Q?hiUrCDWz6imYb9i2zpstsOnDRQuHfTzbiIWREBgKzTkAeLuqCf4DUAZoNOAo?=
 =?us-ascii?Q?nJEfjsh2Oqv3m7TZI55788KTmR3CFuNt12NomKxdEWrRSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h+xLAOPWBYBoXvbLBNewOWRQoKudxTx+dIGuNiJWH5+cjWw/jIAMv0hD1OEP?=
 =?us-ascii?Q?G4pNUSc52SFvXuGlnLCjvnn0OoSQlm/H4bRUC7Mr027cbf7QrdwwRq6l1Eqn?=
 =?us-ascii?Q?lDbLa8MAFdPQOjzEoMPOANIc2ACyE7DecUVsxm7aSTMwGB5NNJ0tzyJlItXc?=
 =?us-ascii?Q?TdXmvbfoWwB8u6ld3N7cvp18evr6jRgdt7rWiwtb3YYh5qEFJDuAuDlPKUzi?=
 =?us-ascii?Q?bZZkLU+n7uj+78ykxYHJy969z7ZT+08raW68a1zOMLzKyvF1k/fpI+6UnHrE?=
 =?us-ascii?Q?pEtgRZEsPUXOZQBvfgnw2mMsKIq8KIIbMLcYhJJaguo+UENkAv3L2YBDDzJA?=
 =?us-ascii?Q?7cQAgY/Hj70+MF2R5etRPif2HTOFIkpH3o8Z/0m/cY/skcG+DQ+UCzp6LAz5?=
 =?us-ascii?Q?zBXRooqbK6g2Mxuno9q6brI+oY2ZglRwPsjSgian4MayOvr6xCIaIeFzjnar?=
 =?us-ascii?Q?svozdsPKrMugxoyMD0zqqhwhLNgz+2VLIRgTwU4atCdsRNOnYmR4qEdVEQzN?=
 =?us-ascii?Q?CquTTB3ufAR23PhtzaWC+vgy5n5hIMqC4VRYYn76y/+WcOoVKNpq2BlGZQoL?=
 =?us-ascii?Q?vzLD8y+SxGEwXVo5BpeAUXwjuqrrcpbYllSt/EtOpREQGC9L8rhcknEj7N6s?=
 =?us-ascii?Q?y+Ex/kj6jfDIPLpI15ZjOmUwGDshpxYsSP3+zJiTZD1Zc9o50NI9TCIymGzr?=
 =?us-ascii?Q?/JiDQLk9uVag8Kz1o0GY/ozc2q4L5yaZcw2/KPLJlHVwgyvCv4F1NlU776wv?=
 =?us-ascii?Q?lbe4wej/MedbNoI2g5dZFdAJJJhI02Z0qrRXsKPPMSv4dQfDi98SDGYWOLgS?=
 =?us-ascii?Q?DyiW9/dUCiZ1nqlH9B9YaNjnn2STDqD0A0X5negcCsca5jX+ivgOz9ZWuqFh?=
 =?us-ascii?Q?AzIhQiUNjhOxXywkZXf+UvibSn3fYi7zM+fO6PU6Yq5XPXGUytPYa6AVe8/a?=
 =?us-ascii?Q?IRrpg73kztP/L9WOF/++WFhNtmQs45CmRUhKwyHrKqwdq65k9cCyJlgAVSsE?=
 =?us-ascii?Q?JeQ7pf3EHrBSCPA4tdeac/LegPCmljmQD7/uZnfxdnTHVBPxEzwUPcTKxI/3?=
 =?us-ascii?Q?VirIghC2YY5w2ufKxdb0PA8u0RYFuM7ar64LB2W7BimlSYWLWcO24Kd0easd?=
 =?us-ascii?Q?w8wHRk1m05lVs3tHQXc4Dxh5XLGa8D4vBShG6b71Dg42kvT0P5EQv76P6nLU?=
 =?us-ascii?Q?bDwcHkYlUrYOW9hOKaSdcZMttDetTVtnGPhrt+ObqncmQaQf13apLM7M6I3d?=
 =?us-ascii?Q?Pg8Wfaolfmlh3T19sfm3BAhCcGR9vBKXAdoyxjc4xRlJWl/9rt09vHx89857?=
 =?us-ascii?Q?sI87SKFbC8ACMd8JK+KXyVqKA6CjOI0oi3XKUcDked+VZok92yRFQU1k6d0w?=
 =?us-ascii?Q?GVtqXR63lYDaJlBOFUDBzmwXyk4by6JxFcvMhuRy/bhhkTi98fcM+/GjFImu?=
 =?us-ascii?Q?sq9A7Syf7hX9cIn0+wxZZ8woVw7DH65wnfu8Ae6WRGDdRIQNm1B+Nudfvb23?=
 =?us-ascii?Q?v1dqv4MVKrrLg7U6CWDJdmL4wWkpDWWVQwCgfrmRDheq4LpgAmGIATBJrymf?=
 =?us-ascii?Q?HOnryZ/APSFF8Qzoev4sMCZfx85CudmuX7PobZKQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OT00CW8BGpLtrQVfdA8crHefqEXUlXgvoPtoFJtt0TgHsnMCOVbGtcTigHsJq76MmbCMp9kbnmS7tumrRe6Q7hcA3RnpzgDWK9mZwg5koGb8Bu4TVXOL5YwhsjguHyUFxZQ9jwOIH/Qqv3LAIQ7OIG1YTMt7oCqgulgsGcLRbX5zJ2IcIVip5R2biU+UjQ5wsunMMHKW5JEn6B8fyDS/koKhXxi4TIwBvjpxkJ4Fto0CwO5TVpLWifFr+AN9fVEff4aHtks5J19BbNPY2ZbzYjpjxGcv9Mmn3h4NgUzAnEm22arbmE5/EmYtai0A9m8xQnZfTtVU+Co0RPabK5zV1q8/kTONFTJQ3GPAziKo6aSC6tsQfQGwyzLkN2gzM22HvPZ4GsaahgrvTYbqSnRLfn4HqdMMPlMH3/aScA0sWwKH6nYxE7NOkxQ2uozrdGu2dSXF+HsSxc8qVFIsWKsFxSN9yH4IEIyfegVTM2yqAdJFNGMuHr1sVgrU7qGUdpxDfI96zCYTpCoCtrVzDzUWbGjYh6eyNc9yc6rdgtz+IH3e4WrfatHVXOLHeSS8CgLtxaOtJG8DzHm7M4PjXbsr7Sql58aXoE3I3PABO/beSxE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b08a768-03e7-4c02-9bc6-08dcc7eb2004
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:24.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NdgjJJU4zdzAAXmhlUQF07rkaesIIQ2523k22wuhE1Hoj39Y99ZJfAObNk50FL/6HnXsF9jIQy1bCUieWhV8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 8XNBp7YADDQRMqpEJza-hWSoHdkpplCg
X-Proofpoint-GUID: 8XNBp7YADDQRMqpEJza-hWSoHdkpplCg

From: Eugene Loh <eugene.loh@oracle.com>

The trampoline for the is-enabled provider is unnecessarily complicated.
We do not need dt_cg_tramp_copy_regs() since the copied values will not
be used.  Nor do we need the (second) copy of regs[arg0] to mst->arg[0].
We can inline copyout_val().

Actually, we can simply consolidate the USDT and is-enabled providers.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 165 ++++++-------------------------------
 1 file changed, 26 insertions(+), 139 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 6403842f..98d7b79b 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -44,7 +44,6 @@
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
-static const char	prvname_is_enabled[] = "uprobe__is_enabled";
 
 #define PP_IS_RETURN	1
 #define PP_IS_FUNCALL	2
@@ -82,7 +81,6 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
 };
 
-dt_provimpl_t	dt_uprobe_is_enabled;
 dt_provimpl_t	dt_pid;
 dt_provimpl_t	dt_usdt;
 
@@ -93,8 +91,6 @@ static int populate(dtrace_hdl_t *dtp)
 
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
-	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
-			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
 	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
@@ -404,7 +400,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
 	dt_uprobe_t		*upp;
-	int			is_enabled = 0;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -427,8 +422,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		strcpy(prb, "return");
 		break;
 	case DTPPT_IS_ENABLED:
-		is_enabled = 1;
-		/* Fallthrough. */
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
@@ -439,7 +432,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	}
 
 	pd.id = DTRACE_IDNONE;
-	pd.prv = is_enabled ? prvname_is_enabled : prvname;
+	pd.prv = prvname;
 	pd.mod = mod;
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
@@ -631,21 +624,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 		dt_probe_enable(dtp, uprp);
 	}
 
-	/*
-	 * If necessary, we need to enable is-enabled probes too (if they
-	 * exist).
-	 */
-	if (is_usdt) {
-		dtrace_probedesc_t pd;
-		dt_probe_t *iep;
-
-		memcpy(&pd, &prp->desc, sizeof(pd));
-		pd.prv = prvname_is_enabled;
-		iep = dt_probe_lookup(dtp, &pd);
-		if (iep != NULL)
-			dt_probe_enable(dtp, iep);
-	}
-
 	/*
 	 * Finally, ensure we're in the list of enablings as well.
 	 * (This ensures that, among other things, the probes map
@@ -790,6 +768,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
+	if (upp->flags & PP_IS_ENABLED) {
+		/*
+		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
+		 * prototype looks like:
+		 *
+		 *	int is_enabled(int *arg)
+		 *
+		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
+		 */
+		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
+		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
+		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
+
+		goto out;
+	}
+
+	/*
+	 * Continue with normal USDT probes.
+	 */
+
 	/* Read the PRID from the table lookup and store to mst->prid. */
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
@@ -839,110 +840,11 @@ out:
 	return 0;
 }
 
-/*
- * Copy the given immediate value into the address given by the specified probe
- * argument.
- */
-static void
-copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
-{
-	dt_regset_t	*drp = pcb->pcb_regs;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
-		val));
-
-	if (dt_regset_xalloc_args(drp) == -1)
-		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
-	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
-	dt_regset_xalloc(drp, BPF_REG_0);
-	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
-
-	/* XXX any point error-checking here? What can we possibly do? */
-	dt_regset_free(drp, BPF_REG_0);
-	dt_regset_free_args(drp);
-}
-
-/*
- * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
- * prototype looks like:
- *
- *	int is_enabled(int *arg)
- *
- * The trampoline dereferences the passed-in arg and writes 1 into it if this is
- * one of the processes for which the probe is enabled.
- */
-static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
-{
-	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*uprp = pcb->pcb_probe;
-	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
-
-	assert(usdt_prids != NULL);
-
-	dt_cg_tramp_prologue(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Copy in the first function argument, a pointer value to which
-	 * the is-enabled state of the probe will be written (necessarily
-	 * 1 if this probe is running at all).
-	 */
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
-	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-
-	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
-	 */
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-
-	/*
-	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
-	 * will be used on the BPF stack:
-	 *
-	 *     offset                                       value
-	 *
-	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
-	 *
-	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
-	 *     ==
-	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
-	 */
-	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
-	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
-	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
-	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
-
-	/*
-	 * If we succeeded, then we use copyout_val() above to assign:
-	 *	    *arg0 = 1;
-	 */
-	copyout_val(pcb, DT_LBL_NONE, 1, 0);
-
-	dt_cg_tramp_return(pcb);
-
-	return 0;
-}
-
 static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
 {
 	char	*name;
 
-	if (asprintf(&name, "dt_pid%s/%c_%llx_%llx_%lx",
-		     flags & PP_IS_ENABLED ? "_is_enabled" : "",
+	if (asprintf(&name, "dt_pid/%c_%llx_%llx_%lx",
 		     flags & PP_IS_RETURN ? 'r' : 'p', (unsigned long long)dev,
 		     (unsigned long long)ino, (unsigned long)addr) < 0)
 		return NULL;
@@ -952,7 +854,7 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
 
 /*
  * Create a uprobe for a given dev/ino, mapping filename, and address: the
- * uprobe may be a uretprobe or an is-enabled probe.  Return the probe's name as
+ * uprobe may be a uretprobe.  Return the probe's name as
  * a new dynamically-allocated string, or NULL on error.
  */
 static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
@@ -1114,21 +1016,6 @@ dt_provimpl_t	dt_uprobe = {
 	.update		= &update_uprobe,
 };
 
-/*
- * Used for underlying is-enabled uprobes.
- */
-dt_provimpl_t	dt_uprobe_is_enabled = {
-	.name		= prvname_is_enabled,
-	.prog_type	= BPF_PROG_TYPE_KPROBE,
-	.populate	= &populate,
-	.load_prog	= &dt_bpf_prog_load,
-	.trampoline	= &trampoline_is_enabled,
-	.attach		= &attach,
-	.probe_info	= &probe_info,
-	.detach		= &detach,
-	.probe_destroy	= &probe_destroy_underlying,
-};
-
 /*
  * Used for pid probes.
  */
-- 
2.43.5

