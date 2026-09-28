Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E45282F0C
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618609; cv=fail; b=hFJJf0wCuXbcT5jFF+vNXE0obP9x/GjboC4crjx+UwvLLTdVxLVY/BWNkCEs6MJtHnwVLvmkkbqUAxUEM72hQxYxs198uzruTbT7An34MH/nC5OHkMlJuK8trfeagHpvSCdeh41Wt6cSYDvfypT63xTGoNLJggreqMHZ2ysrgqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618609; c=relaxed/simple;
	bh=WAk58bQNWoudDf8QwZq/4vIWi0VnRvHlMJ8dvs0Du6M=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=nBE8/izCixMVivq4sKm4Jq6yntFTz69ZNIdoA63MbnDu0b1SU++TMh1a5oF65DBpE3giK10a1BT453roiMyQtBCxF/8f1Kh9Sgisu7heQUZ9y2O4l2NjNVRysy9xQezBFySqoMmniaTKp7qaszuQvHLh95yPWYQAcgAavKeOvCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cVUPUQfY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qufwv3hu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVUPUQfY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qufwv3hu"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDgFLc2548738
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=9E/6HTVR/LuoE/Pzk7MQniG4zTX8t2X0M3lr7EWmoiU=; b=
	cVUPUQfYGBQDwqtc3S7FV6KCfOWFCXtCDUaqS8KwiBrcl9pyNOjRQst/y2p71GOf
	fb2VXJA+XGiK+lNRSdfKLT+nZ1q8vHoNIJFdLduoUicP+WtBmpzyrT0dRvOr21Xm
	anQDtQoEHz7ChRFMORh9hbktMfuaXLebRrNWSes1ditnIkqcteynLTRj1xYsEHwB
	yMZyq0zRWU1hRyU0KjwpDY0OYkRIlrMGuOiRK07S1zWU0bA92b9pVInqBldmFWXn
	jKv5BbZ7q7QZ8omhxHqT+vYVE4XB0R4yxRCOFV5By+h2ICExmQN1ssuSnZzmV0lY
	ggEo+AA+ap7OWPAD8mesIQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4y9bc1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHo4sF040533
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:26 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gabedh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjVFcI/VyUTPAkrltacibnTNMivKDqUfuayMaXlXQddpMlVmC+1FRPTyLetLcG+DjtqDqmD33MO+4mr3y4YfPMul3IEuOTcfX51Iwz3jT5oaKtG7QiST2+o2tNFtOrUrrfctHY/GzzcTapjUEeNyOc5OoNKWcoMY3+/63Ixd+cnugKTgg9971Y70znfuNjvTYZ7QyA71vIu77le+2yVNWhjJotnPOP/Ij4jPc7qGPU+jx2N/1qP5Pu/xpEVOTgLXnyNy16e5PKr9ZvowH445Oy3esuEH0k4WABC/0bH94q8uJ2muLaXh0aNHd4XBsj+1cZw0RnOVjxypDzK+AnJ0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E/6HTVR/LuoE/Pzk7MQniG4zTX8t2X0M3lr7EWmoiU=;
 b=vGpXhn/vhkCoUPyXwyMJ3OSZ7hKGQvMEFQOoAG9RJxjHIz4+x3zaG13Ciu89y6I0OhGeOy+HL4e1X2C26Y91XunOJTLRfAEQDkVRVh6WdLX3JN9A9qt5g3ACfQzSWvlAUEYxoKeODQ0mjlb8OMBjxZlUob+VfOsyUdEPZGPWdERsnElXx0DkD8tUj8DVOQBxg7GDjtWtN97YpYYyZgDZtOeLHAAjbMSB4HnHpQ1ioE5KRn+tiSgkXg0LpIozZ4MaGGC/plISIYcwtFyr0dWAo2gzLzXV/MruKjzhSRy4hZlDLPBeOc+EfbCs/Zz1haQ0EZiLaSXYxQioUe79+l7ZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E/6HTVR/LuoE/Pzk7MQniG4zTX8t2X0M3lr7EWmoiU=;
 b=qufwv3hugQEvdznXVPEZXit0TXzZXlYjBOar22VRnXndvrNH8N002Wch74B3IAINWqAlihh9RhlPlbK4Eyt0oRfb2FEImB18Z4w6JONoNk5kvDPzcFO3nZh/F95qII3Cw8UlCSP5YB7jpIBSG7vERwP9XBX++mg4aps1oGYrxqA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM3PPF5816B0BC4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 18:03:17 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:15 +0000
Date: Mon, 28 Sep 2026 18:02:01 +0000
Message-ID: <0e6de12176cd57395d3095a31930775c@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/8] parser: reject scoped type declarations
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM3PPF5816B0BC4:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d1e4ec-5788-42d9-677f-08df1d8ac4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|13003099007|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	RA3Eb9oqXBKoBCJPXKcE6ue1ngIn6mQDpnY9v4DuJUGUtfaFJs3WZDVbP0AhlcMsLFA28xnf9+RbN66tqRW38gifRwyEWwGwSQKj8lqlDC2NM8/cktxug3FAJJ+zcX6jRHtZ6Sk2E06H+36awTV98lmcLeusJlkkEDfABkWnWyBDoZO+YsKEVFkRevwVsCLyEm6idv6GJ7cGBCern5L1G40InlS7rC32RE9iGolyBA8sUhyEP3UyO8NORoGQ30WehPOyiKv3JQLAoD24yWYhFn22rdEB9q/xYKkNWas7OqMo0X2lRRkphPFu/v9aR7EmHtK2sCeDVKblqSr7JXEK7x/wcM0/jmNvpqDSk3VFpbbWviXEvNZ7s5psbF2cYNt/AupZQQ4hEvUqKo7qxhVA5hQgcjkE9pZ5x2ATpkYRHfSXlUxcEJksWwpNTIMj3a8os2ZEieGFWJ7/nozOI0TQ+FYKIIV4t6KeEis5KlQx3Ct4VIe8Wrd8iOUs6TxApg3VlpOROZ5BVXIsd+FVDK9Ab31cEWCW5dfCkLG3YESQ302G5l+ncld6WKn5p0KQBj2/ITh0MTCPhZl+rI0IxD/JlczzFuWCxnokAPWKo1lGDbhCpEPr6WfNOoOFgOxcQo4VTV2kCOLLn/Hpbli5QZ+snrNvbGQ6LiDwRaIEuoogxrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MqBqOxcAXhSk+yceVcnqgBAj939UZNWKpXENLbTKj3oT6H10MA4FC39M6OHq?=
 =?us-ascii?Q?Hgi9KbxT+9mqMc3x95xzKp9gNOiCeql3SM2xjeWLidzQgTYk4WhhCR/LFrDZ?=
 =?us-ascii?Q?eGOeRoIyITtNG/0YzZ3j2uJCT6/8geR+jYIXIBPdKD+HXQQs9PwLTQCjlG80?=
 =?us-ascii?Q?SDxAsXij8DJz75kKeLaOHDu3pBpaM/tlSE2QlZoYV+HGewMgjgZK6nWS81gI?=
 =?us-ascii?Q?OAD3KZ5oOZ3llByYjiE+uws4wRtA+syVBFaCmFoGXvMPxx44cOeDn5abnnqN?=
 =?us-ascii?Q?7XtfqsJRQz4b/W/lxpk/aKr4EOJ0WHWzHqlhgG0VmoYREcVbMkos+muuq0wQ?=
 =?us-ascii?Q?7KqHIqF/EB2UztkIyJ8el11vnpUj3dljXGI0OM5gBOyh4cwiY01dy/Bgn0tt?=
 =?us-ascii?Q?dgczSqso4WEOaG6Gdk8akfFUIo3aB4vBJJetMZI3MIe4jaHGHzNTC/S0LZDm?=
 =?us-ascii?Q?Y85VH+Eyszd7RBb45U5i4N8HP0pVpeVnyuUB45EHwHeXlkOHaWbtEhc+X7is?=
 =?us-ascii?Q?pnW7OSrGvOSNeTirD2XZ01DVC6MzPoXAg75/EguKvdOWfQxuhUwjyALxiYhk?=
 =?us-ascii?Q?cOZHzJbMSY/4+oYQE+9QuA0FypdYlNh6l86WoX361QT4/EcJ+vK48egkCCLu?=
 =?us-ascii?Q?eiYfEc2WYjj0ScZG70XmLNy6BYLgy2M0PW4UfQqOvWlTnXHXABo6S6hevnEn?=
 =?us-ascii?Q?rkKcozhD+qcIJOQ8VUEruhJnPiJ2yefx4rnPC/gHWrrxeKtm+7Kw1cGzj/Qm?=
 =?us-ascii?Q?5TFmgR1f4pKY/FmWtfm9MXXQH/GHLns5JXBYjTwvb5moJiV3uWO1KUT6rWoG?=
 =?us-ascii?Q?+pMVKMwaIYmZeyQ8Uz0KdVE/bjonReLR6tzg6n2uuOz6UAY0IaHzX/qDL4gU?=
 =?us-ascii?Q?kKQGKi7V44Y63bXrG+w4/UH/LItiVNKy36m0pg0oZn/Aye+n37CYykXtEji+?=
 =?us-ascii?Q?JNU/KzLs9EsF9zhlgvd0DhfvTWX6vFxJG6reuutCOFjikjF87enW+DR8G16P?=
 =?us-ascii?Q?tpsyWD5ViVv+QMf4tzyYTt7rYz58soGa3LLGpoodCMqONQGHBJOwIQLR9Vm0?=
 =?us-ascii?Q?vvEIOixOvRBRxGaMuGMgvGeaQNZnI92fT60vNh5qyGgs9gGu66O5Sblm//lC?=
 =?us-ascii?Q?9YYaGAjMimvw4m6vHRMLOjn1UR5LZha0zyYMZ3JVyEyGtEadhbyQk5Bo5uRx?=
 =?us-ascii?Q?apxoJI1oeaw+s3Ivb6f/+Syvqv2xG5PSEiqBRvr3Ui7VXChiHBo4xyHSTner?=
 =?us-ascii?Q?ZDmhYXFlqsa/SJZoSImFyi07947I/ljwcWp0kUQMttQ/0doCD6Gl3php1z/p?=
 =?us-ascii?Q?T9jzb4OPfG3pGK1odFm3t9Q+UWg7b4ekNUj47pFsVhc0MqUW0HtnZ2BD8DZC?=
 =?us-ascii?Q?yv2EARmWrMU7Ahl1a1ARjbifiPqYBNSZFBHXbAvhwKQ7zJ/fqvRAfui5pgiv?=
 =?us-ascii?Q?hvVaIJE0ZWYErmQp4L/ybWpMUhUgn0cjpr32yv9s+5K3VTAvg6sCnt3CcedR?=
 =?us-ascii?Q?sCiDpjjjKMzgTo4LGN1XuH3yt+lCcodqPl38CvIWvN9WvGK/3Mng+1cS2+q8?=
 =?us-ascii?Q?xK25QLP9fBUAye2Eq+/cjK74EtQY5aQTCP7KYiUB4hvfoBbFgvUvBmKX3qsB?=
 =?us-ascii?Q?fzQQGcOGSRCkqnjr9kHDnh+UiVaeB8WwDPfG7l1bUIM8yi249L/w+nwt5Zci?=
 =?us-ascii?Q?bzkbAh7abb+arZSzqtwvHdeBCgZSTYKS2gx5n0+u63JKEEAXRtVxkZVqXrO2?=
 =?us-ascii?Q?ERLhwsWL/Feq9ZKIcUZkG7DqUvLi4P4=3D?=
X-Exchange-RoutingPolicyChecked:
	dFB2qG6iqHn+7kUwxfm8yw+fxpwCxwLO8OZFBocw1bs+zlEJ81HZrIvbhI0TT88b/qSy5hmTbZWyilAo9+vZR9hHQAXYKreUggfsX5SpUiMOuxyqstaczDUKBjuq3jNDy65aZ1H4lb0tpdaLPATXtsJgqj6T3B6+eJ7iQc/I0+rD0HibDgqj1tJuNEEvS5XZ5heUZBXzbouRbDurz0vouPhNMl/CkF1v8swGaD9GTw92Q3uon5DlPwzbmrsTkG7IuMnMqvQRJazkaqEZG4jNgvcleaHkwuktPn5jdrPTd8cKVMPFPviViiuBxNbqpMY1ywWSWpRBuKDXTrgfsH4a6g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9ZXGnlnxf8HHKXr/6SLa+K/1ni1xioir9k37PIln9A0pwYogzKuvurh5Pes2m5GNt9r+tT2Gcqv0S3wACKOj9sWvZP/mLpbY6obOoT5KjU3dIbbEIHkmN4qrNDLp07XNGKd5YgX6kXuvJAqBvZzBY7kjXuS+GOQyHrGFFNkOPUB5S9ale2aP4WjZoYm/jKnq77F9mkZ5mpOQBYqgR9xDmdty1a2dZQ/CmG7sy3pgFBdBdN2QqC2lVA0UYcEEhqUV2kH8gxNxbqWW7yZWwJSTupGQFQPrDZjcylKW6qoblPvT/CVhZhNSer3HujPnVyzYII7fAfOkX7Bs1gY00c14Lv/ZZI0e7+mmNlXmsvZI33HdfGkb3mX+MrTAJBJc64lTQ9LiN3x9eqBnNxcUNRblAbwP+RuVxR7jnygMaKZz/sogTOqRsGx/ipRjcrFGJoWgYw4C5ChzZrKw7CVDo45Jzf3kUUoUcAmzI9TC0tUUl2bgereYoddDX51yTBDJTWUZaStbHswwFb+uyhKY7ym/a3PDShhbQ3IvJC1Pn6B/JTDkU6sku91VIAcQk9ZZooUCuMeVYgu3Lk8l28L61opQIjfgvKVtkLcXcfoYm/AOh0c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d1e4ec-5788-42d9-677f-08df1d8ac4b0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:15.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7lSqk0eYjtNlr8CBqqgmemyvzsuGI4ULUwK8kLmoTIvatY5wrlth5ZfF7NW8OD2OM0+73RVXgUuq0EVqxRctqwhQgN86SFz4Hw1RZpGs0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5816B0BC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX4SmmsiYzwlW0
 Fgtp+lcoXq+HlDILLt3p4cxC3F7VCFigoKNqdtKoHHNaZEwwzZo3imy66WphaCB9YjZQAimHCPF
 +16gO2zOeZVvLuEM2aPzFSM38QMQrHJfVmbkSZ5yKpXDA+EMY1aqhptAjR2xWRYd96aLb1HhxdO
 nYa3hvwDScWlc/P8TnN+OtaVoWPHhsVcBbcwXEpQs9sZ9Ni4gJjIp88H5QYSYzKaxTSKj3qjj+U
 cVht4H+j2z6cwYfAtz/x7ZlZohCLZBfSoGFqi5yT5se7NlhGRdOVqyNSWQ+IsncWM5V/IROdWSw
 hBysQGcf6/PKUXb9EeMFZG+lujyMMhLDBznXMEdZY/5RCeDZW2MmX1PECFMK1YF5HDDPAc4x1/b
 yOXCpaHZZdT4Bn4FTvDkv5KvQbp+lMBXQx2wSJLSd8/MHGKOML+0TcmCvXhkF8AVwH6eTHIeSIA
 NWigFxw45XzWZ6oTQzw==
X-Proofpoint-GUID: XASJUAByj77rlEKg8UTHcxJlrw-PCzUg
X-Proofpoint-ORIG-GUID: XASJUAByj77rlEKg8UTHcxJlrw-PCzUg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX8l9+cXDi1n+4
 MByIiPuRURxb6M1cxA93gcrrDjc54oQZxk2CXJQG6id06Xu2uKoehPrYv3Bxo1ka7K6FeQ3RDYW
 6qYcp4IvPK/nYIrrW/8YU6HujocqJG8SGjId9qzIElXoiKhU/Y/4
X-Authority-Analysis: v=2.4 cv=IuyL47/g c=1 sm=1 tr=0 ts=6abaabee b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=d9XTJWTS8EW2p23YFIAA:9
 a=WmVTiCyuxqgg3mnwYu6p:22

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_decl.c                              | 10 ++++++++++
 .../types/err.D_DECL_SCOPE.scopeop-enum-tag.d    | 16 ++++++++++++++++
 .../types/err.D_DECL_SCOPE.scopeop-enum-tag.r    |  2 ++
 .../types/err.D_DECL_SCOPE.scopeop-struct-tag.d  | 16 ++++++++++++++++
 .../types/err.D_DECL_SCOPE.scopeop-struct-tag.r  |  2 ++
 .../types/err.D_DECL_SCOPE.scopeop-union-tag.d   | 16 ++++++++++++++++
 .../types/err.D_DECL_SCOPE.scopeop-union-tag.r   |  2 ++
 7 files changed, 64 insertions(+)
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r

diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 68999422..80ab7826 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -440,6 +440,11 @@ dt_decl_ptr(void)
 dt_decl_t *
 dt_decl_sou(uint_t kind, char *name)
 {
+	if (name != NULL && strchr(name, '`') != NULL) {
+		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
+		    "in a type name\n");
+	}
+
 	dt_decl_t *ddp = dt_decl_spec(kind, name);
 	char n[DT_TYPE_NAMELEN];
 	ctf_file_t *ctfp;
@@ -637,6 +642,11 @@ dt_decl_hasmembers(const char *name, int value, void *private)
 dt_decl_t *
 dt_decl_enum(char *name)
 {
+	if (name != NULL && strchr(name, '`') != NULL) {
+		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
+		    "in a type name\n");
+	}
+
 	dt_decl_t *ddp = dt_decl_spec(CTF_K_ENUM, name);
 	char n[DT_TYPE_NAMELEN];
 	ctf_file_t *ctfp;
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
new file mode 100644
index 00000000..e43e94e5
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in enum definition tags.
+ */
+
+#pragma D option quiet
+
+enum foo`bar {
+	value
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
new file mode 100644
index 00000000..3e0caeb5
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
new file mode 100644
index 00000000..3f786e58
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in struct definition tags.
+ */
+
+#pragma D option quiet
+
+struct foo`bar {
+	int value;
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
new file mode 100644
index 00000000..b071cf9c
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
new file mode 100644
index 00000000..5e504cf5
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in union definition tags.
+ */
+
+#pragma D option quiet
+
+union foo`bar {
+	int value;
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
new file mode 100644
index 00000000..7f35b11c
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
-- 
2.52.0

