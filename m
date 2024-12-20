Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026D21A42D
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733524; cv=fail; b=Z5RNOQKgxpnfc5yxWDWCdMudJmWbfqK5wNJ4SQUMWEVzP4zZC0H0LbKDiEOQjsh+T01i4UbAj7kGzrBw1irhMZhWhRf/IHxkUgm4qJYfF+KK9sZwHnpFaRNglipAbk39Jp4m+utwzbo4iQvAOal9CFLgXKdHnra7XjZW/5YRV0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733524; c=relaxed/simple;
	bh=f+oqipy3Rc4z/8yP4s34RLGYKddynlykd9roa8+I63U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFszJrt2TJdTPOBTWS+1VeRxh0m25y3tTBDNNI0EGTnS2P3zdEse0WRijossh04kYS1RC9A/1cPopRdpW0+U23gcB6r8NGKlqO2zxrhQUl5qvzaPje6vKODNS3SeIDYhVBR/33avcFRlqPi2sBXO+0YjowlkTKoNNvVLCgEDh3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JF9+fTwn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FkDPD82Z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JF9+fTwn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FkDPD82Z"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNJgs024875
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=hJrlxzVgEXch8j/Ry+
	znpQCx8VCBd0EkTNwa5vjG/Uw=; b=JF9+fTwnOFPmncJzW/8MSbnpLu0p5ij0Wb
	bhCUADrvihmK7OupykygBeZlyirZuNHTgoPdGquvIKw9A0eJrC0hSnFCMAi+HiWs
	/oZcFPARZnQeVi4ksbJYoGz3+oZnEF0/uVHagbuLwQfA827QOz6y1Gn+u4+zpreF
	wUrHSurjVkSNDq9dRJtm5jSIUfc6+7zoQfvVcbO9JX70HJzauZsoS9kTTcuS+Ppu
	ufCqMZrIkOiqTb/DhoUyUw5LGULQdDUpCz11X9AUl4+14VIWpjqRxd6OU7E+uSHV
	+9oY+sx5YSspsVWtx0v4+993Fj0tpD8LwYmlq6r2AoP0s2BRf0uQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0ecdyh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLWtM9035729
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcykaw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxgsvksJjECnf4b/dUeeVBqINGUqYcB3kMDBb8w+NYw3Io1dFKPxQ2604L6KHA2dNpiCVVCFzcfkPzHheKbCiYtTb6sJvW5Gsl18WYiJCraXVz1W/KPV2hrYDG21r+DK63z9585krHumsSsowjqdKApGYaon7mRUYemohqFCC8vaMc+OrMnwRSWw5S5z4Y7Ra0beq6DolXFN7ih7K+OyfOPLeCD5ylrmY8hBfbXiwuhs3tQ3qTUPJ80M95riTkRTnTUctpYiKS6BiEsWmN/XRaS/9vcl1ydfcyEtWS28hBD0QWJmSEqX4RwtbT2cbnnnbxQYQMiKbT6gO8704pUZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJrlxzVgEXch8j/Ry+znpQCx8VCBd0EkTNwa5vjG/Uw=;
 b=Q1rjz/iBHubKgx9rYUSGX/PiMULjm4SrAEvqt8W2VAH/h/xzlZti+GehgPCppaqZECMoH8QhVOJr8hkVW9L0Ko5H19AaRc3R4EXGHf5T4fZu1spSFRLGMUhdrkWzhUHRzxwQNFMLRmokS90DGDvOuDXLAUbV6tClqJdMQjRVZi0jVzULHA8N4EPX1NsV10P7zsuclLU+IXoDMaqX+3u9K7dEOg1/2TzQ5v9elLQP+7TBbdDXoZiAsqbTtt4UifeGYpt33q2FSYUwKiO6pswiJaJLAJM2Djc802zxOj+NgYSSL9BeDA9/ZO1s5obKU2GiVWzUG5NiEsh9N2RKB9uFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJrlxzVgEXch8j/Ry+znpQCx8VCBd0EkTNwa5vjG/Uw=;
 b=FkDPD82Zkckvw4y9hpI4YaZAIIedst8sdf3mGDxX6+uuzH4xSdFlMCpqAQm5DFy/0G5oi4Z/0UnsRENJINbW/yPWsncLFLXpz4daiMNpWGpFw6v1gJ4EZ22xP1mhXEuhxwu86UuPY7KjnQjgNF7xFor89sj15z0lhrU7Fng6Icc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:25:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:25:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/5] test: USDT probes with multiple providers and shared libs
Date: Fri, 20 Dec 2024 17:24:54 -0500
Message-Id: <20241220222455.18351-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222455.18351-1-eugene.loh@oracle.com>
References: <20241220222455.18351-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e444f6c-bcdf-44e8-ac1e-08dd21452c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aFjYAMg9bzzWBUBDBmqo8gIlK53csFBZTkp4s63GQIX3EHL5wObK2slRu9P+?=
 =?us-ascii?Q?EC/Go39+s9mDMCkeKHALo9ctD7f/WfrJzxUd3UJHTFHBSPZY7N/dzJ2bdkoN?=
 =?us-ascii?Q?sELC7E+4DuQu6QeJxKwo6lY5p/ZhZGZaqBVkQW/Vd3YHfTp/T15OaB1Px3U1?=
 =?us-ascii?Q?sx2u/7TdeYzoBsWXPzzJr+ETe48x4lyceFutiYPQIwzYhmgzxTAafivbvFNY?=
 =?us-ascii?Q?UzH/5BjExkWsCDN1k6GT9Yqo9VBnpMDo0EiNcFXWCb9jhY552MqzakyGulPc?=
 =?us-ascii?Q?+heHJf1jjH7ZDM6j67FwG3cqtpb+NdRBq3nKFsbjwLHQi8BbD4voZtkBI7Lk?=
 =?us-ascii?Q?ZemYpxQkQekbiJAeKWS7gaEUq+qf56dP1gzdwc10Tjgc3k0+vBeV2j+90vgE?=
 =?us-ascii?Q?+AxEvCorQOEg2QMV0+E+OPZyRXO57xzUgpqRym32+CxmDA3Woor5Q/zoRPQx?=
 =?us-ascii?Q?ZybShbjQ5d30uHMhxF+HfzMzkISpZqwhSHHk8DWbc/PxbUx+mCSSBnzABegZ?=
 =?us-ascii?Q?V2wLNlXICNN2T3XlyXfNj4pLSFASWOK3D4MIA4DJfLK/SfdQagrDmc0Y8dfJ?=
 =?us-ascii?Q?qz+8DrLVlfRHZFNIcKpyAcOo8CRDFXTCv4Mm3Shrq/W/GUZwz5UV1cyhjzW+?=
 =?us-ascii?Q?9/48kd22possmdfl4/BB3QwuNmwXBqrHprRIvaWdgNAYjGFEu7A9L8eBlNwD?=
 =?us-ascii?Q?3SBF1e3kHhstTqgVXVcd35qOygrsKlOaJ48ANN668NJ1872pQ7BNmFcdeHho?=
 =?us-ascii?Q?UPoRxROWp6byX3UnRnr8qoJoTfmIvFKj6PIrdvFltd6rZyRrb7ia7p1JkjxM?=
 =?us-ascii?Q?uzThmJscEZjMQ0qju3aFNEkimZmJdrNZzecrhHjib5IZIvxh2Pf3lkqF7sis?=
 =?us-ascii?Q?nrXRcry0QS3b5cLBeeohsg7VOYEaAudtUYCrXwWfQ+mlmENIMbbYTXQSLYWg?=
 =?us-ascii?Q?ZrO1528UgAEJtJz9w1Cjxf+HBJS4I2IgoQFxKBREcb3IXzmkBituqiFnZyIy?=
 =?us-ascii?Q?2MZictdoplND2xZDNxN6uVInH27s1PqnBE+jKo7D1R2jSzogMpgpgd4Tmf76?=
 =?us-ascii?Q?HOdMYBXS7/w8jrhycMUZqJpLTVSwq8tlKLZUNTU3RK04uSlkwjG1e79vFKVy?=
 =?us-ascii?Q?tqt2bajSRoJFs1Wag1vgS0wZObnY3uL4XIqKM9j0DiNBt94idJwvyShUv7VG?=
 =?us-ascii?Q?5bIeoCZS0k3/FRSUDtcHY7gcX7+rlc6Gyfaz+jVSQ8pmsVLd+EVeLdc3a3MU?=
 =?us-ascii?Q?JST28O2VLD983KFy0vhG7m6hNmbRXFBvSwUO2FwUUfCMHwQLXjOFAiN6aq/2?=
 =?us-ascii?Q?3up+pVcv+waHWmp57ZIvdhdGFEjX3fvYfvhMP3MMdQBNwqOYoF18OxcPYzFb?=
 =?us-ascii?Q?T3FKs0qeD/JisCCnEToMs2fckZK0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4Iiogpdb7a1mihlIrUOm523SwHmVKVNG+dTK6pwM97M4gW0RXh+vsO0N8b5?=
 =?us-ascii?Q?ojLIBSn/V0MZLFijC5sP/dC3RActSGGufUDF3bSpcrNTa1ueBI1hglAqumJX?=
 =?us-ascii?Q?/9hnoUHFxU/L9DazZ6TkSLstqh95GHhNray63z9XE3irLmG3jvrAIKfRZJqy?=
 =?us-ascii?Q?Oeu+Y4fFC3uH4evjNPNPKr0bbPW/vf3YUqQw3ecHCGmWioatjpACrkFhW4D4?=
 =?us-ascii?Q?qt5B6HtOe58dahk/WGSLonBE8NkVAmFlsE6BKT85CAIvsS9AOCuNfz6onYhx?=
 =?us-ascii?Q?bD9TVTcgzpjgG0bOOYRqZV+5Z2K7HaaoHFb8IKJh03JYR1Vr+Xxqnix+nUlG?=
 =?us-ascii?Q?akJ1vtRi/piMSVSwcQPnHMvM/Q388uZiqR8eSkb9XQXEnbfKNBxGRykbN9Gv?=
 =?us-ascii?Q?uWB5g6QwiIN7X44wHw/7R7NW7owlLxK+OWmOqaGaw6vo6umZ5M9sAJjZCYEM?=
 =?us-ascii?Q?JI3HP5bj3cevpqrAAga0JAlrzGbAcZbx4hZOi5jPg0IDID4iLjN4QdaHpT+y?=
 =?us-ascii?Q?XSRwqw5T4bQW0wOptPhkaRIVDIhaK6dqrOFd2W9dy+NjwvQZ+s9G54jCxfS5?=
 =?us-ascii?Q?5FvgkDeTG950UiZPVeyksXHjRgRNBSZvfvU56xHo35AIYtdmtuAfpXbYwC7N?=
 =?us-ascii?Q?SDf5MLVTUQDlROSSN845YzaitAwiqwB+TA4xLC+Ya6Q2NoPcti8KauivgrG7?=
 =?us-ascii?Q?quKK8tpEorzpwWc4uFbARtNofOYxVtmFjyKAlCuu7gZAVUAOuPLekjW757ay?=
 =?us-ascii?Q?WjIeOnhxUT11tDFIfITYN9DZA90iMoSfO7X3WdB99lMLMBbmBu6eTDLnK+Mu?=
 =?us-ascii?Q?tGBqRPjHcQQFw9HATTM1JvJO9RFEkutlGoIvfFyAHJ3lLNBXp3tXDxiA1Etu?=
 =?us-ascii?Q?UuG7bqdqAAY9rWR1MIyQFGJV/ed5q9FzZlFQFk/vs2NelAi+U+wtTfponuoQ?=
 =?us-ascii?Q?s+3TlPzUexIhBuJpodPnMtjltDlBD38BIkUQGzQ2Gojyq4SI84SO04wU5NG1?=
 =?us-ascii?Q?XQPfNpACqtJX/FKPItrrL9vsxx8lOrQK4sy8pIjkvRSjPuFIYGSvKzJNz7cE?=
 =?us-ascii?Q?x9TJLTFpAYMBEyxGP68HlATwphny1Dcr88a3P9onsZeL93idRsCsP1z6Cbu9?=
 =?us-ascii?Q?306tZkIptZsXNALsgTxRzd8KGR83Ncj5q43OetPuOCYg8PWEmYsEdJEIW82e?=
 =?us-ascii?Q?QgTfAJH2aQt11IPkThtLyUpyDTeOLI2yZeUBbz8yrDWdUyWHC8PUKALqrzWl?=
 =?us-ascii?Q?k6fysB91qzF8hNqB9bNzEwLl/g6qpalUVLhKaFXdzR58p8nl97KRaQT4o7Fn?=
 =?us-ascii?Q?em1Q0UON1zZed1sgLSHRzEyXhl0zT5LuNIlKMbk+bSezNosshQ6ytmqyyAO4?=
 =?us-ascii?Q?u7l/mAvqF/uqqqbOrf2cIhiTPOkiWsB9fMlAlK1ItmeZ5fA3qgjq1d3mQm3A?=
 =?us-ascii?Q?FJbJqPi2lcIgFQwi0irOQvLNsFHX12QUllsjapeUZxykINEFjBnqV0OpQ1rz?=
 =?us-ascii?Q?zKpbFDpFlb21HzzycUROiFMYGT79khfh63AikAovRUUegbNgYhgSOghQxCQ5?=
 =?us-ascii?Q?yuzMm2OF2FJJQTAc15wAfmotvJyqPVBkSl74W+kQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	op2tie6A5OC/1x1WZL1jCkoCj4M8kAyGNbOOexP76IJbRjB0H5lYLZl/v9ZMnXRjlNxqg2IQLFTFgBDB1Ntll6SF+oDJSzT379C5cp1eydviPEXs42XUIA5YvlkDoZ2YjoQUvAs5IqqUBTVqGcNI27iojtkXidcRf8XkncLaPqHvINvyfdd+/LbPMHqNnkji6jlt3Z7ZyXy8wkkfCNH4a1ZsWL3iceZ+TpIkgcfxWvi9FaWCLynpCuJYfvikBT8+X14ub4ff4n01UNMdLW64NwFIQoTNatrKjYBf+Y8FlE6zQPSd3rqJxIxSOhIsNOAjsclLgnH+Yvbc1JNeQz+Qb/EFOTRGz2KPuhmWdHprdIkGVXeaJ03r06DciUs5od4g09+mFnxkCLughpycqD8OoGq7oE6TZzqUIL2p/JEt6I7/VpyuqEhNsmBvqfRAmgmYoe97H97NWRtEB2JL0NQowl50OFXW1Clo0UNbLSspRFSNar8JpzJcuSPeN8IBBQ5oW0QREBAoup0Ge63DODHPEimDAsne4zAxi2JlBs0lRNg2ybQbHgzIxxt4ovxPh2IetspZydjrtmj1OMOOx4be669wnuXYxI9RLlojXxwp/oc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e444f6c-bcdf-44e8-ac1e-08dd21452c7a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:25:14.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVQktRToqVGv0gbyWOfU0Ia78qdtliTTDXJ1z/g3x2UyU2iK0tggZGF86VWtCVpYdc+aE7vJ2Z+ZeNOxhBJPew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: ZvUpwRF1yPvHAomjeyDdUcCXJentdXGh
X-Proofpoint-ORIG-GUID: ZvUpwRF1yPvHAomjeyDdUcCXJentdXGh

From: Eugene Loh <eugene.loh@oracle.com>

A simple executable links in two shared libraries.  There is
a different USDT provider for the executable and for each of
the two libraries.  Each provider has probes named the same
as for the other providers, but the probes differ in arguments.

Run dtrace on the executable.  The D script first dumps the
target pid for later post-processing.  All USDT probes are
traced and their argument values tested.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../usdt/tst.multiprov-dupprobe-shlibs.r      |  20 ++
 .../usdt/tst.multiprov-dupprobe-shlibs.r.p    |   7 +
 .../usdt/tst.multiprov-dupprobe-shlibs.sh     | 180 ++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh

diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r
new file mode 100644
index 000000000..c3b21177d
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r
@@ -0,0 +1,20 @@
+provmain$target:main:main:third
+provmain$target:::third abcdef 1234
+provliba$target:liba.so:libafunc:third
+provliba$target:::third 123 abc
+provliba$target:liba.so:libafunc:second
+provliba$target:::second 456
+provliba$target:liba.so:libafunc:first
+provliba$target:::first 789 def
+provmain$target:main:main:second
+provmain$target:::second 56 78 90
+provlibb$target:libb.so:libbfunc:third
+provlibb$target:::third 12 AB
+provlibb$target:libb.so:libbfunc:second
+provlibb$target:::second 34 CD
+provlibb$target:libb.so:libbfunc:first
+provlibb$target:::first 56
+provmain$target:main:main:first
+provmain$target:::first
+
+success
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
new file mode 100755
index 000000000..ff7128a2a
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.r.p
@@ -0,0 +1,7 @@
+#!/usr/bin/gawk -f
+
+# first line: get the target pid
+/^target = [0-9]*$/ { tgt = $3; next }
+
+# other lines: substitute the target pid with "$target"
+{ gsub(tgt, "$target"); print }
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
new file mode 100755
index 000000000..6595737f9
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
@@ -0,0 +1,180 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# Try multiple shared libraries with multiple providers,
+# all with duplicate probe names but with different arguments.
+#
+# @@nosort
+
+dtrace=$1
+CC=/usr/bin/gcc
+
+DIRNAME="$tmpdir/usdt-multiprov-dupprobe-shlibs.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+#
+# Set up the source files.
+#
+
+cat > provliba.d <<EOF
+provider provliba {
+	probe first(int, char *);
+	probe second(int);
+	probe third(char *a, int b) : (int b, char *a);
+};
+EOF
+
+cat > provlibb.d <<EOF
+provider provlibb {
+	probe first(int);
+	probe second(char *a, int b) : (int b, char *a);
+	probe third(int, char *);
+};
+EOF
+
+cat > provmain.d <<EOF
+provider provmain {
+	probe first();
+	probe second(int, int, int);
+	probe third(char *, int);
+};
+EOF
+
+cat > liba.c <<EOF
+#include "provliba.h"
+
+void
+libafunc(void)
+{
+	PROVLIBA_THIRD("abc", 123);
+	PROVLIBA_SECOND(456);
+	PROVLIBA_FIRST(789, "def");
+}
+EOF
+
+cat > libb.c <<EOF
+#include "provlibb.h"
+
+void
+libbfunc(void)
+{
+	PROVLIBB_THIRD(12, "AB");
+	PROVLIBB_SECOND("CD", 34);
+	PROVLIBB_FIRST(56);
+}
+EOF
+
+cat > main.c <<EOF
+#include "provmain.h"
+void libafunc(void);
+void libbfunc(void);
+
+int
+main(int c, char **v)
+{
+	PROVMAIN_THIRD("abcdef", 1234);
+	libafunc();
+	PROVMAIN_SECOND(56, 78, 90);
+	libbfunc();
+	PROVMAIN_FIRST();
+
+	return 0;
+}
+EOF
+
+#
+# Build.
+#
+
+for x in liba libb main; do
+	$dtrace $dt_flags -h -s prov$x.d
+	if [ $? -ne 0 ]; then
+		echo failed to generate header file from prov$x.d >&2
+		exit 1
+	fi
+	$CC $test_cppflags -fPIC -c $x.c
+	if [ $? -ne 0 ]; then
+		echo failed to compile test $x.c >&2
+		exit 1
+	fi
+	$dtrace $dt_flags -G -s prov$x.d $x.o
+	if [ $? -ne 0 ]; then
+		echo failed to create DOF for $x.o >&2
+		exit 1
+	fi
+done
+
+for x in liba libb; do
+	$CC $test_ldflags -shared -o $x.so $x.o prov$x.o -lc
+	if [ $? -ne 0 ]; then
+		echo failed to build $x.so >&2
+		exit 1
+	fi
+done
+
+LD_RUN_PATH=$PWD $CC $test_ldflags -o main main.o provmain.o -L. -la -lb
+if [ $? -ne 0 ]; then
+	echo failed to build main >&2
+	exit 1
+fi
+
+#
+# Run DTrace.
+#
+
+$dtrace $dt_flags -c ./main -qn '
+/* report the target pid for post processing */
+BEGIN
+{
+	printf("target = %d\n", $target);
+}
+
+/* have all USDT probes report their fully qualified probe names */
+prov*:::
+{
+	printf("%s:%s:%s:%s\n", probeprov,
+				probemod,
+				probefunc,
+				probename);
+}
+
+/* use different clauses to report args for different probes */
+provmain$target:::first
+{
+	printf("%s:::%s\n", probeprov, probename);
+}
+provliba$target:::second,
+provlibb$target:::first
+{
+	printf("%s:::%s %d\n", probeprov, probename, arg0);
+}
+provliba$target:::first,
+provliba$target:::third,
+provlibb$target:::second,
+provlibb$target:::third
+{
+	printf("%s:::%s %d %s\n", probeprov, probename, arg0, stringof(arg1));
+}
+provmain$target:::third
+{
+	printf("%s:::%s %s %d\n", probeprov, probename, stringof(arg0), arg1);
+}
+provmain$target:::second
+{
+	printf("%s:::%s %d %d %d\n", probeprov, probename, arg0, arg1, arg2);
+}
+'
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

