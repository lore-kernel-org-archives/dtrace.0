Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D856CDBA
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769917; cv=fail; b=c9raM6V0HEPgnEEzDJD+nIbNgjNyB9NEE/jgbAv8ouktmej9xvRJDEPxdd7TMl8m/79qP18hJlLoFDq3jvGdrNvLtrotYWv49CIKMgl5mO/gZKl9q08+c7w2EE/Q8nMK6DGmh8tHcWV5ScrCSXfF8GbOHeT0qJt0zfEBwTMhL/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769917; c=relaxed/simple;
	bh=l32PkLK6eu5vEpXtJZopqZ7zUWy3ErJxLAfEDN+bwKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QMfFEKFMKx/bSYdG7KsaaX3P2WMxYxuag6bkosRpG/mcnQBIzDZMBgMVoTeybQgcj0mUFW94UDp6CSlzvod7d3blHhUnNJvzuVUs7IZzqOT+r6+S1NJDDVgk21t0+CB0SUft/ANud19WnblJ1CtzBFMpaeiER/ycndhYbk1dNGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JveXJhFB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WM+A+wtl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JveXJhFB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WM+A+wtl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fo65012067;
	Thu, 24 Oct 2024 11:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=shuTQC8S3sbSaas0wTjKFePTTQp8H8FuWcFEuEzqoQo=; b=
	JveXJhFB1inyLsk8BrfTUzJTC8vztjEm3QoK0ov1KXkzux9AINKdiLIuMbwFIzjx
	aPTgJY7ZTllXu9YjffwsUvUJj9BC+asOIttiEZ84X1jS78ijpqrisdSGZXWtRhfV
	YqoU/11Wu9iVRtl9zH47ELvVgR/ok4sZ9ZoiyMpMAQy4igIsHVb7AMkeiFimoQPN
	KZlyxknITteavI6561hf37akF1TIZn8VxbzNqsAjeSlSz/ZX7Tl4wJbVxr5n0NO7
	iFS3Lb67maFkBe8H7IK6T9y4H/xTF4ZoSpFw+TZb7qLFxHObL+8uxyoQlYmIHAzS
	wN48GnaqNY2GOQK37JgGfw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53utb9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAUPNc027356;
	Thu, 24 Oct 2024 11:38:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh45ych-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG4P+6v7Nr74JBqSfD0ZFUPEVLjLDfHS/Kfw5ZdaSxkDVB7zYc5Wy/lqTwkei4WFjGsT1EGNPO07t/kSGtGmTu6kp7GSj4FM7350svGo4zTB664J3IBv1WJy/t4vXoppKvsefTtpdmIbY+kCsNqoWkYxbFPSANAOkHExD6GHfKpMJiSahXhDgQV1xO5VD8tECQFA9V2bA21M28nd18xaL34zXS0Ynz5LzjoKJhob1aBSJR8DCFl4IIfb0u+z768/0neggCKd3nCBjLkcGoRFszdsyS07nFrAVWgDOzLw46WT8NdOLwT4Gcl4OvP6RCuyUsnNU67E0MH2YOhwZ2TDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shuTQC8S3sbSaas0wTjKFePTTQp8H8FuWcFEuEzqoQo=;
 b=Gm6OxqjmvHLDSRGjdieSTCwngIbtC3YYhlVbrHDwpLK3MoWVrJzvc0kEX+dKUqnhPnY1GKKf0WlrDQ+vfFCQXJ/wrkrveiJTbLLWmDqBtD776qUaBrUhui2z3/D1gr53NvUBvxnHeKnkFtqdYIdRLMp8VyoD5ZNpjd639vsXGfahBGdriSBvBwhnjyxJXvr5jW/7NMc1OPM0OdwVI8ThQ91bnLVT2A86R7d719QHQh5rf4472CWkah+0oam2GKxz2n6cOagHyC/Qcr/SzTpsVJYxkmfCJQVbNM+Az2yHhyQmKIHe3J79PgakX6aty5CEO5PNac8zidoNj79+fJG5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shuTQC8S3sbSaas0wTjKFePTTQp8H8FuWcFEuEzqoQo=;
 b=WM+A+wtlR7JwD3WNACXOrxzlOw+vXbg530OxMzx41LBINiistIbAqsCyjRZJkB9ALTEPCQlYefiPXq5FSd3Ah5lZj9xftM+ugJX9wsb5lhliMuvW86s0nyCuER/73V1maLokYexwDAHwSBe4fw2GqyBfFJmKHPYLjhIEJq0AKRw=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:05 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 02/14] pkgconfig: drop spaces in variable decls
Date: Thu, 24 Oct 2024 12:37:46 +0100
Message-ID: <20241024113758.182050-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0016.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a464ac6-2578-40bd-2595-08dcf420537f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ewNmv17TnTCfo67IeOilz0rKDuPBnsezlhWuK95uq0HipnP39lRNkhFT1ObR?=
 =?us-ascii?Q?kC1YclJlosKmIXNVaqUBzKs2Gv6W/QgblxgYOtxKkYt+xrdiyEqeVZEGistx?=
 =?us-ascii?Q?p/YbTQJaBLr512n8mMoamF/NqNl4Fga3CXZTR80MEKWtWn3a32juQkWsNMiM?=
 =?us-ascii?Q?m8tr2IRm8KNceTmqhztv/AoxzZ1Ct1dQi4+ODS1DOUTNV9yGGnWFZ1eEca5U?=
 =?us-ascii?Q?FBIXsUZrSJObLlmNKoahl5XKmt4R0t6i3ohR+Q3jA3ZG5c3TNV+No9VYTQSb?=
 =?us-ascii?Q?ZutR1xekG/jRweZdvx08gCPRbhc/cTwMQmAOhpW5onaybjhE6832MW8KQXsK?=
 =?us-ascii?Q?1+J+rtEnzSEXdwzWCFi+JsJ3QendiFcUiqcdmCe9IOM0ea36yuH/jjZr7yzQ?=
 =?us-ascii?Q?VR8PYGtChtzI3n66SGX5xmNRzw2wQnFx2cDkaApnErv204yrNRpUMz2wWxiq?=
 =?us-ascii?Q?8qBRPKqjKacZIu0Cc2aW+We2YvpVWmyrlB71T9X5NObxzJWCmncFRnTvAiMB?=
 =?us-ascii?Q?eRLGwysJyGEaB1Y6Wm+VPlUHsHNQMInvODzEKp97/5aK+1VSTiKPXx4ROQTJ?=
 =?us-ascii?Q?5O0uO9im/T9BBL2YNxAn5ue6VneSVjrSiZSV/Ov7j5SPhrIrJAiGl84Bm+fk?=
 =?us-ascii?Q?Kvid0sZG4zksYML2l+wVWywVLSD9HFUgpt992a7O4lofu7Abvq4SxTrwZ861?=
 =?us-ascii?Q?SVHG8E4bUHAeEX1ATfdDIk18+Ci+MYRZYwjda+NVz1RV1vY3kzpyYlzP2ukw?=
 =?us-ascii?Q?OAWVZGlw4UcfWn9xYZnj4440AFsygZfPurWu7mu7ftGixUIrzoYiZohhaWC8?=
 =?us-ascii?Q?M2D2TTf/3IEWJz4l8EnQVNek9QgWtYj7mxa2YW8qEpwnYU6aK++hMrNZnBn9?=
 =?us-ascii?Q?dF3+WHywG19N2dU+C6WPtxXmiXpOMddmrcDEjaRuanwShgSnxhGsgmiRch25?=
 =?us-ascii?Q?kAtosL9+hYGVlGemd83Ec62sGtc7PeK4BsZ3oIKp9w8J0xb/6K+Y5dsNPzfO?=
 =?us-ascii?Q?t7R3cYVfidtYizv+OaiyofLygKfqW5kXVaqeUY0mhs7cCjc+EafuF0LLS/Cc?=
 =?us-ascii?Q?4rXQ24uoznvNttfoiqpsbNWGkmeBITLzeU2PJsqAFxHSOx+QGsuIFg2PhXK8?=
 =?us-ascii?Q?EQpCn6PbPZOQe16ze2hiPgWVX4K1DYpGuzC3UC15LZ7XP5WmpZXwUbWmFEWl?=
 =?us-ascii?Q?xedbdkCGuFkRyzmi7TMG7gYoYmACjt/YtE0qdgtYFIP8bqECauSH70UcJeqO?=
 =?us-ascii?Q?MMOjNtNe5X7SpggCMSUt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LuMV5LVZhajuA5k7evTFwvpv0v0EgjARJoqBXRop0q/hrAlwypdtIuQxr3hU?=
 =?us-ascii?Q?kcocpPPilJgvtunXH1o9aRsR5GneTBUj46oqpQ3js+C8wSWE0ZLkSXFdNXc5?=
 =?us-ascii?Q?rrhd07j3BUVo4zxao4CMOZmzZIJNU4vh4FdTmbUNipLQ+MuLY4VKs4WfX198?=
 =?us-ascii?Q?vW74OPfuImBgPpajuWpRnuUOkkrxCTKx6I6EcCkNJSznreZEwBppgtTrrFdU?=
 =?us-ascii?Q?M45OmURCJbd8Pr/rfqvLB/5Y7A2M3uiV2Kh1Fx2e6T9ABFAoTj1D8qTzXVUC?=
 =?us-ascii?Q?61hx0x7+20ILnmbvD2Poa8/e3R0q6XF05LBgtzwrvUL6txlfVrbCtSbYE17j?=
 =?us-ascii?Q?4K+dZIQntZTkl47ifdhDtV/y2xboMXYq9F0LFULVooSEjnj5oTNJcL4MocZn?=
 =?us-ascii?Q?8SwJi88iZLtNGWappe2B3YS0ZGEguQhsBkFs9tJSUgfbL1t7dMkqqt99HNHd?=
 =?us-ascii?Q?kQbl6aY0flJ5bsgkjyu/Qkl0ZfxNPEICWaQzSHdyzGIGGljzU5E+k2wQTkyW?=
 =?us-ascii?Q?wlByR4GGV59ZZXFvdPG49hhXzl7BfUyoSuSm6PzFU0QYXuaB0smmjFMAdVy+?=
 =?us-ascii?Q?O+WqrWG/qPMotcP+RCdzuBDcvg5UOGToUFqEn6ha9ucQPfl0/M4WostRETb0?=
 =?us-ascii?Q?znRGApCVxjDTb27mJwE6wFdWjUYlgsRA7Ef3Ve4KKP5y+aC6iRl7ggCYE8/M?=
 =?us-ascii?Q?JWoFe84RbiGZ6oaWX4y5/SgNkaLdwIUu7X66U68ab0Heyd8ryXFHNwdevK7Y?=
 =?us-ascii?Q?6diVw25SEg78Y6Ep1Qg5SZQjkJ8tLiQQi7CKm/nOeIyC+KS5QyynWacp38tq?=
 =?us-ascii?Q?rxG5HrNHF6gaJ2hzaUtO2ZYBGktfTdfP0P2ExOmqCmFx80UhNOektpsfxtbx?=
 =?us-ascii?Q?Kwb8cqejQ+SQ3PiaVpLYfWY6nv8kzUZECgUCNlo8Nq+Nk2x901azxZmmRJfG?=
 =?us-ascii?Q?EXnNdeGCNu0w7K1rcUZlmH61BxrkUQ5N0q1If6wnfvTLGD5HXki8Pt47zEvX?=
 =?us-ascii?Q?2Qvj/trWvqiqFNtZqT0c2zp2EYPSHJLw6u3ICYsRl8i+y7AGjqHXp1Q37mHE?=
 =?us-ascii?Q?yxNXyonnE8+IyybAhDywIvUrsVKGCydLijfonHfCGGnsri9tT8mZbOdJSV0/?=
 =?us-ascii?Q?g2hFP+xqFxQMC8JcvxVR4LO5QFe05MOD/55+jDCHYOUfRrSzAo5GRTlHQ5ZR?=
 =?us-ascii?Q?RgimnWSHFsDfJeqEiBf55pdPd4WdJgakOQ4rddinCKslHMqhiSBlKLHaaLAh?=
 =?us-ascii?Q?7NVpXeznApT386UjVvKpWtUwmM9CZrLgMb/qxQxWEy0Kqa2ZdzmETzTvel+h?=
 =?us-ascii?Q?ks1XNbGZoljal7mQ6cY0hiW1PU+RaeVpkFMW15mmd17nmFpkbH+CtvAaIlcL?=
 =?us-ascii?Q?jxxOwmK/vFS5BDFw6TR1laybWAjQIGVYqjghiyv2r51iD4YDJ4ntdndiZFdg?=
 =?us-ascii?Q?EYurFO7TXs1AfjbJiJB4sccYbnj1JuUPq96kJD7IKzj+WhASpjUDHOTgKxz/?=
 =?us-ascii?Q?tnom9POqhjXuY4CwqMRmK90eeFbRsrptp23nN/XzHxSl/liLhMCy1lvehuLu?=
 =?us-ascii?Q?MWutHbSDuwncfb+D5O7Fm/M4Fw+4FuRCh0qYjuV4eN2BR3N4MB16VF3B4ykG?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S1NRVm5KQmWqQtfYmLPalLN4cN0qo/n0RxAGlwhgWf/gn8AXZarAaE7KGZu/sJT0YEiJRPf7eGtAkWnUE4Ak2Z7otaEfrs9Qx6hz1s0iUDPHnyDuGU3A9JC1sGC5Kn1Txw5ZzrJEcYrWVShVgxA9UVNNVU3gLYMYRDl5jUu7yGRc4zEpBsdsMxIi8y1Uf2HwZSHN6B2eSXNJx4txsqQmM6+SlRQE0Gtu6Zk8wlgcsmTzWpXQ2Xg3QMJE6AeDl3GRA2b/yJge2aH6YAOFzmNJQ0gedR6HgIU+31hMEDF6zaULQnl+PL40vThkJF3V8cGPzpdqWQiGtesdJZ1Tg23l+VcQNxxuNjE1w9dI4SvuZRi13fFz9BHRVYDu6OBVPt9ZmhcQljsa1Nju8tMWw0czcvD7EpWxQg9xnmLCbiUU6tnEgTDcIdmYKJ7WHARNNIrYAqnJdcCAD5AhZd4qkn3GuNfQRveA9tQJALbo7Dvuy5KHmEgNIyE8Kh+Aakzswf/NmcKjCF+9HxWSHlTPbaR6CLVI1OjBm8bijk9uOA/cnM0KciicVqeN+TOEIPR6Spqaky95fuK8eTBpmy294xbDKv04A/h5pOUzeGLeE0N0HCE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a464ac6-2578-40bd-2595-08dcf420537f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:05.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHwdlQh/eOUOp/3W7FQ+jOGhG11cck+g8UyvHoaKMEExFciDDj7Vb5Z+LFQqVw/Yjcbwi0TosOalzEkliI3oMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: aoetigFKKVusZ8RbC6vONgvp_arrUbyZ
X-Proofpoint-ORIG-GUID: aoetigFKKVusZ8RbC6vONgvp_arrUbyZ

The requirement to have variable declarations with no spaces in them is not
documented, nor does pkg-config seem to care, but most pkg-config scripts in
the wild conform to it and pkgconf --validate complains.

(pkgconf --validate may also complain about the Version lines. This is a bug
in pkgconf, <https://todo.sr.ht/~kaniini/pkgconf/15>, and should be
ignored.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/105
---
 uts/dtrace.pc.in     | 6 +++---
 uts/dtrace_sdt.pc.in | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
index 9977082c5a7c..fda6f755166d 100644
--- a/uts/dtrace.pc.in
+++ b/uts/dtrace.pc.in
@@ -1,6 +1,6 @@
-includedir = @INCLUDEDIR@
-libdir = @LIBDIR@
-dtrace = @DTRACE@
+includedir=@INCLUDEDIR@
+libdir=@LIBDIR@
+dtrace=@DTRACE@
 
 Name: DTrace
 Description: DTrace consumer headers
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
index 32474bc3f75d..90977661b761 100644
--- a/uts/dtrace_sdt.pc.in
+++ b/uts/dtrace_sdt.pc.in
@@ -1,5 +1,5 @@
-sdtincludedir = @SDTINCLUDEDIR@
-dtrace = @DTRACE@
+sdtincludedir=@SDTINCLUDEDIR@
+dtrace=@DTRACE@
 
 Name: DTrace SDT
 Description: DTrace raw SDT headers
-- 
2.46.0.278.g36e3a12567

