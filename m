Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EE122578D
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599977; cv=fail; b=VasehYAw6czddcSzTcwA9e3JLTRE68nBpLdzglUpXKh8QgNcQ7hN8rL6p+Qqo5qZTzUW0mI4clUJbOP/UYn2PKMWIp7M6rQ07+e7aNiPl1NKzg8yk5QVc+5lmeDWLjDaeZy0g1sBDipOFLOnXMej8bmxXL0NSo2CmxWruvf2ox8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599977; c=relaxed/simple;
	bh=GO9c77mqushqY8jVWiKvANVi+nE3CmYkkpX1/k24bdA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fy7DW9jMAObzWxn0GZpN1eeJ5poTITMobyUiLbIZCPbv9xIjwcL1X/7DteXYAkcmXiinEPMPE3+6YawMGP+i2Z9yLJz+iigw0f88Mp3sve1PlI6Xri4nihO5xqWPWN2w4BW0YMvOodc1ZmpWy3Zk72l4saAXwp61wkfRuD13Xx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NovPwMp+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B3O42rke; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NovPwMp+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B3O42rke"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbRCw4013404
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=PP5AUrjyNg8c4wg1UOhUnVOfXNn2LhCbd3H7QTzezLs=; b=
	NovPwMp+Rzlja8uBcdEid973ech0cbDdxuwEoILAxdh10L0YcZvC5aTrVp1tSwWI
	PgtYGTdVfL/w6JZq6sxEKw8G1oXOO7N1/wCIqhsUq6V2d5e/cYHIyQPsQ8L9CoDJ
	2fqTeBTUhQLb6w/eKWxDmcKKdGAXYIv7Gve/Rxa0YuoV1eGSSlU1rOPU6BXdbbuk
	S9oASxqwGlCy9ZP9PN8KRCXGULtmU8IQsz4PeaUjyb2QRFFcXaWODsHz0rBpNevb
	086az4QPV+fTPLtCBnv9A3tRELnK7Uu8dW7pSNh1CJukdc0VEixK8rIgnLQWFmdk
	V30Qxe+90QsszezMZH/qsQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvhe82ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:46:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKEbJe015897
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:46:11 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv6sjqn1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfPQCa4/IZ9l6YhoPhY++S07ZfYAqoWrwxUcWQNGcJSxDbiiKdpDhidoZEECloqXqk/3svwliyfY1uJ/WBmqlE8ndV4woYjxal0jrETVj68mZ9psRfvYSnC6ki9e/S7SWD/InuH29wHf5eT2MqCHvd+Ez4UrligSwqydivZ3PLDIRLdXwaxp/g7wnaMUWMnEb1I1u+1fV/liZlCoQk5qKboIzKX3TmIX+1GKgIueFxVCfEvPL4BOQUoIRMJY9LXu8EIuyFNXmbuVA7sAaLdZQlK9EaKnF6yXH3xnZrFRGhoXn2c1djSv/BZUJROawv9WVh710Yoyfiat7FoHsvExCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP5AUrjyNg8c4wg1UOhUnVOfXNn2LhCbd3H7QTzezLs=;
 b=QCI9GYAyKb8LmUj0afhhSZqwnHsS6rlZ2RmsqP2Fea0TG1s4FjrFy9IDF59DKnFLe57yQ2yQZGET9rl3WQIE+JRgZNfFgAkJ0t0lwg52EsFJQ1U11O1Gx/zp3erIMHp166wxHAjJGFynfRKHu1LV4b5C5AyUapvi7Td9noiOMgJPNSzx5ocWnxF07bDWqQLpuWxzLM1uEP9upAX8fS2DhBXRQOfqbiiFjoV+XRUQOkogvxLPJyHoDhyEZFCz28qGD0dH0ohcPAS0yJghkdyY5+4I8rUAFozM1Le7pjhmRAntkHAh8AOVcfZAb+pgPeVPNdmnnw/6rvPM1hPNEZ//kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP5AUrjyNg8c4wg1UOhUnVOfXNn2LhCbd3H7QTzezLs=;
 b=B3O42rke43OT4uu9O9m27eslLg+BeHlWzz7Ocw2+HqauvZ0cxVb9DCFZBdhusN+AJhZnFdfCL4l1E+4AQEjAMBf1M9/Uj7GjQ6tHByZx1UPCYxLwf5hj02+FvR1N2rEMEKLVPkaeiiYrlvpW9KbLIP4UcCTYTaTyEIJoLszoQpQ=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SA1PR10MB7710.namprd10.prod.outlook.com (2603:10b6:806:3a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:46:01 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 21:45:58 +0000
Date: Fri, 16 Jan 2026 16:45:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4] test: correct file permissions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522826E8A633859ACE9C676C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SA1PR10MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fad01d-6b50-4098-977c-08de5548a278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ls02DZLcsKrvp9I/e6o0n8VYRGGB+zSrDdlXWxPW6QQGUITXPyPxKsFEfKpK?=
 =?us-ascii?Q?1CUSf8L/0eZzoybnbhJsdlJAR0VhdhkD6BWLd1QRHUBOhscplhegvjbjkDpG?=
 =?us-ascii?Q?uwkUeKAtsvASmMpXdd4wG8gksTSU51DI27gE89kOA+igp2P4L92FmgJxasKA?=
 =?us-ascii?Q?hPBpaRNbjWRJR8JMDOKzWWysuHCsv7cG9lwOGAyKgMp5j54Jeq9Vg+HjUEBL?=
 =?us-ascii?Q?JDvVQHM2q9JfvXoj1W93LDNkyubn0dqiFwJQevt7YJYeX78jUOhLdqnvjU+9?=
 =?us-ascii?Q?nNTIgRoHgngZu5aKoeshnqIZaDL705xFH+n8P/SPB4Igi+FqSxUl8Vb+rQlM?=
 =?us-ascii?Q?J6DjVCb4ZfR9lzRNtcOTW77SK3U5hnGlrU61br0CEOnG3u6q6YTi/m/PjVlc?=
 =?us-ascii?Q?+oZpSvVS1nEw2FJg65vLoPQCH8xPyYv0kvT8MJlD3nUVgDkptGuU6R60X6tU?=
 =?us-ascii?Q?Sgb7pCjhatnFzVhVJAV1xKYJIdzMr+TfUnV3VZdSy9cdqLDCfPuCQhHzVjmd?=
 =?us-ascii?Q?Ydya/cD5NslNjgSbUdOOlYvE19INo+0Dph/jl2L3mAkvOVHhcn//blbpsmZZ?=
 =?us-ascii?Q?0QJev6tUK1LQiuv3ihsJIfg4PJ6sJ0meMAlY/fYRYEIry3p0uU/E2VuvG70L?=
 =?us-ascii?Q?TpsZMiBPMWKPmDlS2cJy/4OSJB0dM4/N8mbtUGHVMdmYNQEemJmHujB6mU0P?=
 =?us-ascii?Q?rY67i3xePiiyAWxt4XOM1B0WRjP0fzp2RVtSY/KtI/YfNDNuyNdgzIVyLw/v?=
 =?us-ascii?Q?dG8H4HYzMikS11Dgz6WA/ovQW7y4bC0iP9KxiV9ky7BUKbnQqAKbNnD/yVec?=
 =?us-ascii?Q?jK/EGs3pAAIf8jGSXzXAlzexF9wHN8K69uBtTd8Kpgub8Lala4eNDd1fx4Xn?=
 =?us-ascii?Q?u49mEdxHJUXj2SqQXTRiVpj+aXTf9cWNexio9d/oLasrA0A5JhPcKbGNrlPk?=
 =?us-ascii?Q?d00o3er75FJaTT9QRUJ6eH20RBN97KIdnw2I2VSowVlBTFaPNexKgK2WDv4T?=
 =?us-ascii?Q?Ja0NdfRpOlw6gdM7hyYfzm3FyFsEM8KwT/js7NvUJwDQH1xF3BOTKpZ5BZ28?=
 =?us-ascii?Q?UCGjXatv3ekZVj0Wkx1sB1IbdzwePa1bQFN2mf5LrcVKptpuES1OFyX8qGrT?=
 =?us-ascii?Q?MFXrQireKPrRq9AGrzo6La1KaKMirjkQkiTVPLbi1YBnqUdiKXcLMKhbvzFM?=
 =?us-ascii?Q?NMBB+7DVwu+fkP181sjyXTg4sPM31olvk6W7jObrYx7UgYUarP6lElIFT0g6?=
 =?us-ascii?Q?ZJVtFS577DM+GkLInAxcECk+67CdjxiZYSHYT9YLog/Xxtctm7rpt1UbhOzI?=
 =?us-ascii?Q?rKMY07nmEXeuG2uUSfV4T3BirP6z6TECx2fob1CK3RoINKYpXCVa4L23V76M?=
 =?us-ascii?Q?Ix6q2t/GFIlyDfTUUPrfWITIV7ldPwL7afksecF7oU/VkKuIWtjnBJ9NyynE?=
 =?us-ascii?Q?dPeeGTrgc13EdBYJBezbbz1FLgVFSHVPAvYfzZ0sCIG+q/7qCjuw/qJPIS12?=
 =?us-ascii?Q?DrOMYeIrlrb2ofgXt0cOimi2ydalA+ZJntH1bDyJWLK/ydnnLehYNdjpNyum?=
 =?us-ascii?Q?KPOw0qi6k9iA2dDKv1M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uyxO2Xc8/YvjriwZ9fTGrCzISxpevd3HgNm1D+icOzzEBWK5gcfClBypYmMS?=
 =?us-ascii?Q?fY2pWWC2hHV47c7X5K9u1znjEiqQtFJUHDQ04Xhd1nnKgrQG5CXTUugUc5hm?=
 =?us-ascii?Q?V/vjsk+o9JOUiVrWa9mlf4aY4mPD6orOY4WXiRaFGqZ7F2kma+dHYDYRN8dg?=
 =?us-ascii?Q?M88owR2Dn3GfDQLfPP2Z2AinFpCGP58IShXepgRHU/qTUCpmiAMlL6XaBll0?=
 =?us-ascii?Q?zRCiGM+C0myG3V+x1NK+DjzT3YXGL1tSgfRvIemLEGLwrqfBbT0wRmpxpJnt?=
 =?us-ascii?Q?hfYsEjEETGymqd50mUsQ2WlmGzPvQhg2lQRTEAQyNdl2QDoW8YHw6TKzexD1?=
 =?us-ascii?Q?zpeFOGjRscEHvJlM7fXgVLC3h1+7h2i/LUq9YlDJMoP0pdA9Mq43OrW2Xg/h?=
 =?us-ascii?Q?PPbuZKVRlBY09sS22pHWJFygy3SvrLX5P2vCnslAXzMxBZcJ/iLPW364VJhU?=
 =?us-ascii?Q?gO8i6RqCcDEhp+38OjbDVW0TGbHXCfvX/4AvlJgfOHUrSP/fCTTOOlYxig4j?=
 =?us-ascii?Q?JDE+qjtZJYi4A9rT8YANB6NCUdEVe6H+ptLKAmKjeTThozjUMc8hzlycQc/C?=
 =?us-ascii?Q?rfZhzzm1q8Mm38Pzv4EYc9QLPSwnyMmEgXOzytbiRYtEueiuFgSJwDnPyg9s?=
 =?us-ascii?Q?cS6BJ+VYQ6ba5xxrCFdFc0m9oB2tImsCJjq6Ddv6106shMGSpZHRCx0utXOj?=
 =?us-ascii?Q?x1XPzvS6ARD874WFLLTgFbLUcnQ7EQI9SS3vm3fGBHYhEiDs7tvdWojPjNtg?=
 =?us-ascii?Q?hJgNJYj5bPnPqahnjib9/8pcca/1CLPlY88DfPYcnuHJfQGsDCyrz53/gt0N?=
 =?us-ascii?Q?kJiF6rBn5EgLl29n1mxOmP7/YZZYpN59wRNhJHqpIHs11Zp8QjFXzJP9hzRN?=
 =?us-ascii?Q?YE+3ZPi9XuJnQBg7etePOKdw5WJvmaIl81NOHGVJsY4MOqM2LVmi8oQajo3L?=
 =?us-ascii?Q?vHwbo3fQIToN7eH4ykCC+7geo5lR//68n8WD9kmWJheAuHnhe8yIV8HX8fQ7?=
 =?us-ascii?Q?+XgBl/izgpeRJK6jnF8+vJl2sSisq1xpL2bup/E1DW5RBreePPq8tN/Go3kp?=
 =?us-ascii?Q?eBdLcFTkVEcSC8ooI9P4rWNR4YX7jzGuIP+Jvj0k2kYh0h5Wg6Z1syEyp3Rp?=
 =?us-ascii?Q?JnvypMMSFz2cyZfoOPBuuEjDkPrISSHpG1TvRdPEjCGc6sGs/rhfwWh1aMCZ?=
 =?us-ascii?Q?YxBjh7tuhb4Js3c+GMlmOgpi1Yx6tuNrcRuj6Y/MFafDgTuAW97/jTqWctrv?=
 =?us-ascii?Q?lp8GYb61L9CpEQtyPu5LECJZv8FscwwV92ETd/0ZG17oPklM10IANmkF2yyc?=
 =?us-ascii?Q?9zISofk1U4DGOb6V2wUTpTznFhor6C4nehNF52Z+PTycq87q/6B35dHFlHGO?=
 =?us-ascii?Q?4HgPEBiAWhJGsxRNuRsn1MosoTFWvUU58cndmBzqr2mkwZfVN/eYBE+bw3We?=
 =?us-ascii?Q?ztlOwT/iuHgukfOnZ9sRy89mJ0JOEDgmpkKnBDHEZnbCcugWSvY7y9Zg1noG?=
 =?us-ascii?Q?SzZwMegRxJH+gvLOwPG6FB1yWLQ+rz4K3hyId/dFl/0QEv2VR9lkTFy9hoDl?=
 =?us-ascii?Q?Fw+n0X1sh7s6LYXnk8bWoE3xAYlqHOrRwdk//YlbLmlyytDWBarLoYM8G6b2?=
 =?us-ascii?Q?h9/x5nnD4rQ30CBnGj+KcilH5S+BjQlZN8Cb9pnlVF+ZXgdsyio08T3zxlpV?=
 =?us-ascii?Q?FibtdwYEtQ9FUjPyaWvJ6af8aa7vSWSnkRn8nVBgtmAxUMkKeQOqldCv+izr?=
 =?us-ascii?Q?Z6+imjRU9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B3RZBGWObvNCcIzJD0X4CwC7FwyO9KaItpnJZKxrblFLSuLWw4ecfDQc05TYgYp+lmaE1cpCN2t8H3bbO+PU4XRslJqeqXgIMDFZbU+La6R7YphMR59oMwfNKOUwV4JCBzyQy9CbLIH87/1uLtFXoZIU6EoXVJm/N8HxxF5iIkXI2h85G9SSFKNX0IK/e7ARSLsuQ7p2rClRMOAYJP1UtORgMjIrtUYZL70zLOROxjYlt5kAYCVBscxUdmOtObfbke5oKVrlL+fPyGpQspty/F6JeDaPpoIV+vRMv/pmAHcjyY80976VxLTKFU24FzRL7Q0ULYqi4UYts69Rlq6wYZov9ihVAw41PwiKtXY7ESiIceRn3xA+V9vvjfgebhLnkDcYaMzna9i7SyZJGuJz9qV+P1iTE8JeSWBw5G+KrL2Qsp+q5YwcVckbx+kJSukBilT3/WaFkYzupge7kexHz+W4jZ+6vseQIxC9zgbuvpubU8TrxQ0hPz526Ip8ZCBOWXtKotis9Yad47Rz+1osIDtD13d+so/T8lg4cM6CIyDSyH67naIRHe7R+rC/Pk59aej8Y92XQnEbKrUbmGEZH1as88f+0+Ua2frik7VWODc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fad01d-6b50-4098-977c-08de5548a278
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:45:58.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCRTSeLSX0h/Dl+WzNJ7hUYBzShr6EUjeCOmXt5fXGCUb5NzexihM8o4/+kAupm8hkURplwXeyebuSC/G8CURnI17W9edFaEazEPJAy9YyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7710
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601160164
X-Proofpoint-GUID: gU63JFtiB-tBop8SCk5EvAb2mazI0aUu
X-Proofpoint-ORIG-GUID: gU63JFtiB-tBop8SCk5EvAb2mazI0aUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NCBTYWx0ZWRfX8lGBkPsyEpiL
 04/K84Zp5U+2jeqYlmpWcNv1Mayjo3+HTe9lEuyBOBGgMzdVU3Kxs+JJMAowNiIm8/8gwWA6X32
 7YehgMv26exRwHN3Zk+uefKMYfejuKhWNXy3QmdHREGCBhApAAVwIT1z256kdTC3skhZqb4oK2x
 aMgNkwu+KYTCsh3QW6H1J7Amtrsf+5UcX3Mm8yS0SXA86U0Qup4IhK/qd6NBdJXdlPQxUFqvN4b
 eONJSpfG8MBQZJue0B8YdwgniQSiuuQEUBk/Fu4tMsdVIT+j8M6a4/FAwfWeCrnxCgDUVFbxxmw
 byZJ+fVQXbstfKzglB+Dl1V2ug0BuFOFP1TMDiujbiRpb7L4S5hx9eMsK4bxljktH8Si0BaHqj2
 3qiQ/eJtIgBbWyG9HGcyecC2+/G72ddrv3x2ZtPVnFTLdRyUwdtolF4T3HXgdXp4a7GhmnfEb2o
 D+Pb7aCXBQfzpmSEFdw==
X-Authority-Analysis: v=2.4 cv=Aa+83nXG c=1 sm=1 tr=0 ts=696ab1a4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=k9U2Ook-XkZQRppUD3UA:9 a=iv76wg4OxLMjXHVm:21

Various tests had a #!-invocation while still being expected to be used
as scripts fed to dtrace.  Removed the #!-lines and marked the files
non-executable.

Various tests that were meant to be invoked as standaline scripts had an
absoolute path to dtrace in the #!-invocation which was not recognized.
runtest.sh expects standalone D scripts to use '#!dtrace' so that the
correct path to the dtrace executable being tested can be inserted.
Corrected the tests, and ensured they are executable.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/script/interp.d                                   | 4 ++--
 test/demo/script/tracewrite.d                               | 6 +++---
 test/demo/spec/specopen.d                                   | 6 +++---
 test/stress/fbtsafety/tst.vahole.d                          | 4 ++--
 test/unittest/lockstat/tst.lockstat-summary.d               | 0
 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 4 ++--
 test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 4 ++--
 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.concat.d               | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.desc.d                 | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.inval.d                | 4 ++--
 test/unittest/scripting/err.D_SYNTAX.pid.d                  | 4 ++--
 test/unittest/scripting/tst.arg0.d                          | 4 ++--
 test/unittest/scripting/tst.assign.d                        | 4 ++--
 test/unittest/scripting/tst.assign.r                        | 4 ----
 test/unittest/scripting/tst.basic.d                         | 4 ++--
 test/unittest/scripting/tst.pgid.d                          | 4 ++--
 test/unittest/scripting/tst.pgid.r                          | 6 +-----
 test/unittest/scripting/tst.pid.d                           | 4 ++--
 test/unittest/scripting/tst.pid.r                           | 6 +-----
 test/unittest/scripting/tst.quiet.d                         | 0
 test/unittest/scripting/tst.sid.d                           | 4 ++--
 test/unittest/scripting/tst.trace.d                         | 4 ++--
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
 37 files changed, 61 insertions(+), 80 deletions(-)
 mode change 100644 => 100755 test/demo/script/interp.d
 mode change 100644 => 100755 test/demo/script/tracewrite.d
 mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
 mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
 mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
 mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
 mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.trace.d

diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
old mode 100644
new mode 100755
index be690b56..fba39e41
--- a/test/demo/script/interp.d
+++ b/test/demo/script/interp.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
old mode 100644
new mode 100755
index 0c139ead..f888ecd8
--- a/test/demo/script/tracewrite.d
+++ b/test/demo/script/tracewrite.d
@@ -1,13 +1,13 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@trigger: readwholedir */
+/* @@runtest-opts: -c test/triggers/readwholedir */
 
 syscall::write:entry
 /pid == $target/
diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index e7dbc3b2..b3769789 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -1,12 +1,12 @@
-#!/usr/sbin/dtrace -Fs
-
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
+#pragma D option flowindent
+
 syscall::openat:entry
 {
 	/*
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
old mode 100644
new mode 100755
index b918e663..732ae3ca
--- a/test/stress/fbtsafety/tst.vahole.d
+++ b/test/stress/fbtsafety/tst.vahole.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -Cs
+#!dtrace -Cs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
old mode 100755
new mode 100644
diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
old mode 100644
new mode 100755
index 45c37efe..6fcb4d54
--- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
+++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
old mode 100644
new mode 100755
index b51e1160..866a7f32
--- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
+++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
old mode 100644
new mode 100755
index a4880cca..9a9d1566
--- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
+++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
old mode 100644
new mode 100755
index 8f7b210f..8d6e5f64
--- a/test/unittest/scripting/err.D_SYNTAX.concat.d
+++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
old mode 100644
new mode 100755
index 34ae864c..e8ec7851
--- a/test/unittest/scripting/err.D_SYNTAX.desc.d
+++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
old mode 100644
new mode 100755
index d3338cfd..d2ae68a6
--- a/test/unittest/scripting/err.D_SYNTAX.inval.d
+++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
old mode 100644
new mode 100755
index 01044d6e..1f383dd7
--- a/test/unittest/scripting/err.D_SYNTAX.pid.d
+++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
old mode 100644
new mode 100755
index 905fefb6..d2aa4345
--- a/test/unittest/scripting/tst.arg0.d
+++ b/test/unittest/scripting/tst.arg0.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
old mode 100644
new mode 100755
index 9bbd8e49..cde5d64c
--- a/test/unittest/scripting/tst.assign.d
+++ b/test/unittest/scripting/tst.assign.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.assign.r b/test/unittest/scripting/tst.assign.r
index 103e9945..8b137891 100644
--- a/test/unittest/scripting/tst.assign.r
+++ b/test/unittest/scripting/tst.assign.r
@@ -1,5 +1 @@
-                   FUNCTION:NAME
-                          :BEGIN 
 
--- @@stderr --
-dtrace: script 'test/unittest/scripting/tst.assign.d' matched 1 probe
diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
old mode 100644
new mode 100755
index cd7b716a..792d6f06
--- a/test/unittest/scripting/tst.basic.d
+++ b/test/unittest/scripting/tst.basic.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
old mode 100644
new mode 100755
index 8d82f2bd..44ce7515
--- a/test/unittest/scripting/tst.pgid.d
+++ b/test/unittest/scripting/tst.pgid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.pgid.r b/test/unittest/scripting/tst.pgid.r
index 6e512550..15f22b61 100644
--- a/test/unittest/scripting/tst.pgid.r
+++ b/test/unittest/scripting/tst.pgid.r
@@ -1,6 +1,2 @@
-                   FUNCTION:NAME
-                          :BEGIN The pgid is 
+The pgid is 
 
-
--- @@stderr --
-dtrace: script 'test/unittest/scripting/tst.pgid.d' matched  probe
diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
old mode 100644
new mode 100755
index 2d0499d7..70197c86
--- a/test/unittest/scripting/tst.pid.d
+++ b/test/unittest/scripting/tst.pid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.pid.r b/test/unittest/scripting/tst.pid.r
index 9430557f..b8a74268 100644
--- a/test/unittest/scripting/tst.pid.r
+++ b/test/unittest/scripting/tst.pid.r
@@ -1,6 +1,2 @@
-                   FUNCTION:NAME
-                          :BEGIN The pid is 
+The pid is 
 
-
--- @@stderr --
-dtrace: script 'test/unittest/scripting/tst.pid.d' matched  probe
diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
old mode 100644
new mode 100755
index e4f1395c..670761d8
--- a/test/unittest/scripting/tst.sid.d
+++ b/test/unittest/scripting/tst.sid.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
old mode 100644
new mode 100755
index 148e5c60..f52b14ef
--- a/test/unittest/scripting/tst.trace.d
+++ b/test/unittest/scripting/tst.trace.d
@@ -1,8 +1,8 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
index 50bbf177..044b5a95 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
index 1590807c..206641c0 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
index 47e248d2..e02577d2 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace (1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
index d01ab558..ab7c6ed9 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
index 14cc1d5c..dbb8f294 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 char a[2];
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
index 89592786..f57aba47 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
index 43a41440..00f56e1d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 string str;
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
index 3bc21b18..da4038aa 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
index 80a3204d..9fb6a1e3 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
index 3c120a03..7c15314d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
index a8c1c4d4..c239bc7a 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
index 136f5cde..6e85370a 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
index a0bca73d..dd20eac4 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
index 8cdc6ba1..98725509 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
-- 
2.51.0

