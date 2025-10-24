Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898B2DC350
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320028; cv=fail; b=aWnfAZ8MO/twBPWfZ94xYegIad+hsc1dr7Hy8NFX/moC29RliZZqaBc3+lOOBWuts5fsCDOHz9E2BPzSrzKSXLJwScUZOUi7wc5+8K+QSxKzbuoGuJD0P/VlSLREu1rEUcvwrjegGC7xE1FcE1S1KZY5RD5w5emQ7ZhB0VfkprA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320028; c=relaxed/simple;
	bh=+f3SDyQDEDX6Y4c46p7qPT+xH3xV+pxVHEuyo0XlyHg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ek+jhGWemWELv6f88YBe8HGH6SlceQGGKhmyCRuIgGLiFFqN9al0bo3HpXXBdY31Hyhb64hlXOgYbou9hLVt8KlZwuYysVVvhXR8JZ93+kDesT8DleUpb0n8fYgqD/6LkWW+0iDoN7q1Rr7DCHoQsDXtvAYVfRphC4ZL8vIYiX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gxwAEuZm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n12GSIQ1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gxwAEuZm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n12GSIQ1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OEg7kf013110
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=UG//UZBrlKrt8MFo1R6B3uOPWvQOeln3bXE0cUzvjsM=; b=
	gxwAEuZmhg6X8nGb1yQZCUr+8OAZj50nFzU9o2xylMKbJzihxCxCKkTz0GtbT4uB
	A+NkAjQ1rl9TDwFjL7ltAZHO+yH6OdSfQ7UFtxJ7quFcDcHkgGFnGDmvggwebXcX
	gh0bxg6vuQIPLG7ekhmYBkTNfQi+q65Qim6gDUSWIpFaierbVlsDBI8uo+QROL2J
	LVm5jrJfFiTkMTeXWaEXA1KzTIZqpV3vvDIwueFZqAH91wCFuOSqlAjZtdmiYH8N
	gsMl6QneS8SfgYjTHjyLVUTGn6vdFiCkRQig7LdBI23e6K8GEq6bBHU6fCNh2NkG
	2Ki41NSJtswgkttkSSRB6g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3kw034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:33:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59OECUIO030503
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:33:43 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bh41jc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwDP39V9fqfK+ngItzXuut+IciqjxeO7FyRI09t1Mr+sJBZf/wRiBtzb1kTAMWck0vtGMtegV2RE3Xw3hDMnBfrY4WgfxSdAF3103pdAKtAWdzNucWhnBiDpg/whVBsEn3EA667pEAzKEwsUbaZu65Wbf0dCdTl1tq98tOj6/u19rCI2u6gx+X7SGLkVTTIN/z1bITVDVd2vo2E0wpFIGUSb77IlT+87dQHhNcKfI+IZRmHNlsiSob2VndXVFwVVF3PpkZEhA7PvAiphvJp33SKXCwLgo2DrIzQ2SIY8YYnl7QxxJSYiLFHHPbJ+l0z/0V/2IGqXIVXCiHzgNI4OxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG//UZBrlKrt8MFo1R6B3uOPWvQOeln3bXE0cUzvjsM=;
 b=LenXW7hZnrgte6398As221IhpsHVFD2hU99QAAXlJWntGRml9fMPcMtzO7eDsWbGKDNh1kY4Wf/es9yDes3IJv8fwo8iE+XAcMvInW9/29wTxjJVquE6QZkjL84aaHssI1ecCosAeJA/TD6UtgnJjOOeYPkKgD2/2W1pBZIX3pGxEkVysg73f70Ea9MtfBGhV3Tczq85rUSx8iMa0jBNND/pHw5blz0quFVld+C/8HmivM6pwCFkmsfxmCSixG8a7rDDsuCu13vkT8On8E4bQD74w1IFOZv1FMq9hhARjmLvXoCT+p2rf3kfLUHypuP93Q+z55s2Jdh58VMQCEGfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG//UZBrlKrt8MFo1R6B3uOPWvQOeln3bXE0cUzvjsM=;
 b=n12GSIQ1dBNslNOEaVQto91C7ZZ09NtywmxDrl6/d9/olMmWe7qzHhtGo8XjGMvhkUcTjCtqIgCaGW3rCZrWitoTxr42+5lynZ0Qe215z9ncwbMtZxWH4hpi353VzeldN2r+bqcbpC92cy+19d00tO3lk3FiDFsSWjPp7pz5cno=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:33:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:33:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 20/20] doc: Add rawfbt provider documentation
Date: Fri, 24 Oct 2025 11:33:38 -0400
Message-Id: <20251024153338.15592-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 5873c475-9b5f-4f6d-1889-08de1312b58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G16O42m0HlbjaPCIMX7SwzCk+IxMMWmlVYVP2xSlzZBNM6T/uYiolJuafEUO?=
 =?us-ascii?Q?yfeibGySavxxhpgfEfCHJ0STVcwRcMppaL2QyKzIry8Tp6x1NHenwdmr37RY?=
 =?us-ascii?Q?OBrEJBVdwhh0AxQ6JrVk7a2GPSsPmbr33DqYQob0Ws8ZV3MSlG+G5ZP7s5Gb?=
 =?us-ascii?Q?L+diJiWQBZyEukdTwtIErJIjNpZvVoZGZCbtBWWs+q6oUZIhgsQqNvwtlvuU?=
 =?us-ascii?Q?FVkIIDrfoG0mRz0LNOxfpW5db/7I14uOUoHlo3UetJlo5yQ/+VhwfGFql0Et?=
 =?us-ascii?Q?po81Mkvzh9gIwZqsUKU3i1drZDKIFbS8JNKLtHLN0/D8nnXizDkiW6lJQrSn?=
 =?us-ascii?Q?QUJZWMtMFpdMg+y9aBRP9C1yqXQC5Y87N3h2pOqTnQ2wTRaYY6mKo4FU1F17?=
 =?us-ascii?Q?aFQHjNMyGAld8IpY1PuSm/OnBnWHiUr3Nz16xGxcqBj6LbWtAs9AuKHya1I4?=
 =?us-ascii?Q?aFKXUiTm4nI26pHBywgj21buqHi4MLYwx/dxgDgXkN53xnjDpyKzXELZpvgu?=
 =?us-ascii?Q?1lXMwLTm9xO4T6YIQrfk62WKxU3L+QIopNEFpqd/JeDLPbKe6WbG5DVHxq/P?=
 =?us-ascii?Q?3pePiSUxdqCKLoSC/nl5b68nWmL2wOuw3xGyhPQIEodX0flv7DMy6EjK1N6L?=
 =?us-ascii?Q?jxtkGOUFFiO1d24aK1CKK4uyMQXrUEKTkahWBLUyJ6q+Xi5hQ6yuUdqnT1VV?=
 =?us-ascii?Q?qwdpCMb/kaxp3N2TelgBnHfWxBhjw3iYofhICaJnyx7YGh44Gprod6qXdBEN?=
 =?us-ascii?Q?ln3lc4I1we2S/zgqv/dDJWB+JSpGUAaNvkblFt7HQ98x9S/VbpzGTUu5Q7Xv?=
 =?us-ascii?Q?rGTPe1gGFFXadyacf9wcqHnEscRs6dhK809utEHE5D4K+xWWIrCGH5474Zbq?=
 =?us-ascii?Q?lVF15+tO298rJG+CmplPmQ+Hr1krT2Wh8j1ALHhRdlkqFgCe/WL/McK9V1Vs?=
 =?us-ascii?Q?sevUuil8spgx/7tZwQPTGiFTTvH7/Dim0MI4TMXbjgAkNHS7J9OYB93pPXCL?=
 =?us-ascii?Q?18XqT+1weaNzroPJLFk2HrcLgCPqoFiovPt0txro7fH9zAIOQtVkSDtJ1xY1?=
 =?us-ascii?Q?vzljDG+kDx0+TQ0xLN9njwN9Xp7eAkCoCpkMfMsmX3vY6ABk+UYZyGKeDL0z?=
 =?us-ascii?Q?qhlon/ZnQmPSUBNjItlaV2SeZ9PDS2dNiPRBWSRGmci5CE/fUJ2L1wgauKPl?=
 =?us-ascii?Q?d+MUjNFOWO486NfI+K12ba0GnX0rJHwNdJlEN+E5HE2z1bGV1LbCgeX3EkUb?=
 =?us-ascii?Q?/nfWPKSHikwAikgnC9+ntlN/pcLH5V/X2+2W3SlL/uyy5KH+Y3ByqbBsmMKP?=
 =?us-ascii?Q?FTPA4sMq0MY1hxVrc9ojXF6KLpVIA+9nE8ZeqMLfOXvEMbnQi+Ia7x8GQEH+?=
 =?us-ascii?Q?ef/5MD+5V65qYxL7Ln07JLLVCVusr2dfqVh0JJam5wXK7hHots3KqVcjW6fJ?=
 =?us-ascii?Q?/obN2erSkXtoeIB2I1qMSQU2jpuN5Q4X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j871t9fABFqFcPayMX5wHEpVaAniicWDSqJAjcImzIx+aRjumw0TDyZAtjqW?=
 =?us-ascii?Q?eO3odhl4ndnZ3oyOJEuVVONuP4ZeDTcPeblpWQ6s2X1TFP+zKy/zK6BpPeNZ?=
 =?us-ascii?Q?ABLayUH45MRmRmx450BHq5Sb9qsGir7CWREDKFFEfKVafQWkpWrAkMkn0YyD?=
 =?us-ascii?Q?i+9mEYLuReNd8zjcGInIMUfVoaZC+mlJpk1KvuckkEFmbhqmYEK1+Zw5oMsy?=
 =?us-ascii?Q?g18+dd3gFDV6tHNgvr0vHrTelkOscu9+trbgeXsycrMRH93Kj7bsCqNvBbEX?=
 =?us-ascii?Q?IM6+KyyxbeNw3Ka+b81z9qSz5ePPBVN4sSHzYzK1XihJuKAP+W/hzSuQvqWy?=
 =?us-ascii?Q?b1cZ64TBQOWrGR6sLMrZKhMzbYmmykZLhVXXYukoFRQpYrKCCwJARZ2t2lEi?=
 =?us-ascii?Q?mvJ1nknBVscYkgj7NdhFlihW6mZMElAcUAbFl88utffQy3Du46sjKTUg+FzK?=
 =?us-ascii?Q?mzQocYgjikGlFIDqOrmbFFBPWwhgI6/0S5Uhmof62Kc6U6/gGDGttEAWLIxQ?=
 =?us-ascii?Q?ay1kVSOz1nafvSidqPuk+5tlhUA+0dFcf2/TmTw3oTx1lqsOnnXijnUUJMuw?=
 =?us-ascii?Q?21XiCTw4zZj3/6wBcjx/sqD9mClXwdyBXLu8trd8i9vyHf4BOvU0FEkgjAHz?=
 =?us-ascii?Q?w8hh9yz+WvL/Sq9iK1UfPf1jfHwVzrNKEFeE/paL6X1WK3KYkTXE5nOHDgxB?=
 =?us-ascii?Q?WB77/12RnscGhzp5oLwncUAHdDEdUHM+QsbB3deos9vF1BQ5+FXbM+mjs2aH?=
 =?us-ascii?Q?wSmUdi/Bcr4nZMnnmKEqnxsTWEDQIf0qNMjSLNYXH01a/PHvtmKoyYz7RGj4?=
 =?us-ascii?Q?eONKp2aHQ8QhNri/jVADuz/pY7KC9W0XTGQ4aOm5nmieXN7MHwoEoz9PJmEG?=
 =?us-ascii?Q?xjvG3Fo1dVuk80x9AdLDnpi4/Kz3Qk0wb3XaJoUeMfYgwIM3zy8L5h3o4gqK?=
 =?us-ascii?Q?m70QXiN9NMjjdg+RED3DmniiJKwe3fV4gh6qGZOcfFs9yzIk2/ZxP3ES/uzX?=
 =?us-ascii?Q?d+lhRWk+OaKOQdyuorarKfv2/stLzSfESdCoBCgJNzl3/brUFFfYqd/rq30L?=
 =?us-ascii?Q?t6oQHuQVnwrDPS9CMxs2geaOTs+jTc2eqG7FQlanVHYJ2BPyxyXfdGtxA0JY?=
 =?us-ascii?Q?T0anAJWZSZ/87vgG/SF5nwo7Doqy80wLfjY1yl5OG+rcDrhJmKEP5wkzrO5+?=
 =?us-ascii?Q?Z6eL1zeYH6jwp0H2yvX+Lc4gOBJ9hhPMh3gTjm9YewcV466C+rqTopbcnlUV?=
 =?us-ascii?Q?5FhQd1Rx1NXNyI1xHExYy/J2JvzVWiTks5tYs0z7KQSynQgFOjyiHJ3rMveg?=
 =?us-ascii?Q?PEzpYxp19j/RqZfvURBfKoeJmIWz2vtrGRLZHqG/gbvEa7GLBQ5lvxjASfhx?=
 =?us-ascii?Q?y784LjW5G4md4b+n/3lXbeu2WNq1Ms3gQLtCPqrQCvlzzyqIdVCGx1MECFuS?=
 =?us-ascii?Q?TxjacH1M65cvJHEYyg+yaxVWDjGSpz8u6gGECWoFjnV2jWPa7U83nVJ05V9Y?=
 =?us-ascii?Q?ZajraXEmu8g0sWSceqpCd7kydI5fpntWWMg3PPgK9qeiBzvO5HzehCpJiNWf?=
 =?us-ascii?Q?f6PbCLatZhvJpHCzk968m1VmMki8Tl+3ggR/pI2x?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IVZ0NDa+pz18/XhPejEPU3rilEknuQ7QKc7OWRU/547LzWbo0LQNzgAcmqDCHd1aNjrfiTO/2/bx2SoHeZQb4CTpzm5pUYdm/k6jb5NQIbtxvLXREtgR9rodGd9cC6nQbwVI/zsp5FdB44v0jxf9TFfCIKxW8oRgzxNRBVowm+rqN5pJs+kH8v6YYZuz44YLYM84y+ovPh8pAGmV4Y0LV0KGK/dhH7wBRzWRjoQ49WhWiFln65N5lOwfpdiqV7PSVRR0PC0pF4Nffnh8aAvaUouO57Wc04l6FdF7RjV7/Ym42lwT2pO+ieibEwZ30EM+WomiZAx+3+8Hfa5O4SM/+kLWsOdU5Y97Ho1X/3vvWKg4m4dOcvpVZEfe1CBmos+ii/PSeJnh+MLusEot7iQ/Ku+t+Uq/W5g17Hx/qUhV70tBHnG9IUg9/3HNZrQtpqIsT2m3zoOFyKgF1kvMZtC2erjJL1YwdxJymWl2MihXqLxWKhg07ikruXqSzdqvoxQXKuUUvgpQiKixYbgCDeYZGaFFvd2ZHmpi90EYSvkwQoLV3+Qbp3/p7bD1c5xvriWs2UdQkUbiUqDMU+dV6lz+jaBZPK8lbVZeOu+FOPNC5JU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5873c475-9b5f-4f6d-1889-08de1312b58d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:33:41.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWmCyuscaKxVCuYhWy7P6d4PL1mctONKz3Ov0AJhGCh6OPkVeVMU+y5KxtUjIryfDbETPPz/lTqhhkOjgUJqMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510240139
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=68fb9c58 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=v5vgSPytC6PihjlyA-wA:9 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: DN5JsTHx6y36RIYLoLB4A5mmPhZcboOi
X-Proofpoint-GUID: DN5JsTHx6y36RIYLoLB4A5mmPhZcboOi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX9zzzqXlawc0q
 8INtZyQaocYbXNO4qKrboAPUM/wA+F+GVvNr9E7z4BeGs2NHHyUH2jazwWoDPJCtc1ORqcrjnJA
 XPN3mWMg/TEsQgoTisUdqkrOVGmyBi6pwF8KlButSzy4atgh4dm7SKv7DZ4UF6TZwrYSQX9v9Vz
 WeiVjRRm0wBVMkUa6kKeDkBEYBtm62syqPFBugFW11Ri4DKqLH6LJByz09i/jwZkHvfM4Bf/vAz
 XslcmygRLEKqDkGbQNcfRZWimf6CdebQ1l4WlIGO1MvjLrbhB/QuxaB3LFAsJiWUz9vQwndTRDq
 XxGSW33s6xtdJBYuqoK/9pt9XjZPAsVSm/EC2obC7oT3A9mBlOfXWwGZe+I7oLie5JSYlWXTzC+
 CQxD+Zd0yJU3Xw9NAVJE5pWsr/FPpMbp5L5GTpVVdNfFnsJRG6o=

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  4 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_rawfbt.md      | 50 +++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_rawfbt.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index f86c8b9e5..da9a08687 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -241,6 +241,10 @@
         -   [profile Probe Arguments](reference/dtrace_providers_profile.md#dt_ref_profargs_prov)
         -   [profile Probe Creation](reference/dtrace_providers_profile.md#dt_ref_profprobecreate_prov)
         -   [profile Stability](reference/dtrace_providers_profile.md#dt_ref_profstab_prov)
+    -   [Raw FBT Provider](reference/dtrace_providers_rawfbt.md)
+        -   [rawfbt Probes](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtprobes_prov)
+        -   [rawfbt Probe Arguments](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtargs_prov)
+        -   [rawfbt Stability](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtstab_prov)
     -   [Rawtp Provider](reference/dtrace_providers_rawtp.md#dt_ref_rawtp_prov)
         -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_rawtpstab_prov)
     -   [Sched Provider](reference/dtrace_providers_sched.md#dt_ref_sched_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index f11bacb2f..45623d92f 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -21,6 +21,8 @@ The `pid` provider traces a user process, both function `entry` and `return`, an
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
 -   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
+-   **[Raw FBT Provider](../reference/dtrace_providers_rawfbt.md)**  
+The `rawfbt` provider is a version of the `fbt` provider based on kprobes, allowing probing of synthetic function variants generated by the compiler.
 -   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
 -   **[Sched Provider](../reference/dtrace_providers_sched.md)**
diff --git a/doc/userguide/reference/dtrace_providers_rawfbt.md b/doc/userguide/reference/dtrace_providers_rawfbt.md
new file mode 100644
index 000000000..7b1fc7723
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_rawfbt.md
@@ -0,0 +1,50 @@
+# Raw FBT Provider
+
+The [fbt provider](../reference/dtrace_providers_fbt.md) consists of
+probes that are associated with the entry to and return from most functions
+in the Linux kernel.  It does not support tracing synthetic functions,
+that is, compiler-generated functions with a . in their name.
+
+In contrast, the `rawfbt` provider implements a variant of the FBT provider
+and always uses kprobes.  It does allow tracing of synthetic functions, such
+as compiler-generated optimized variants of functions with . suffixes.
+
+You can see the raw FBT probes on your system with:
+
+```
+sudo dtrace -lP rawfbt
+```
+
+As with the `fbt` provider, there could be tens of thousands of probes,
+and effective use requires knowledge of the kernel implementation.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## rawfbt Probes <a id="dt_ref_rawfbtprobes_prov">
+
+The module name of a `rawfbt` probe is `vmlinux` for built-in modules.
+The function name is the probed function.
+The probe name is either `entry` or `return`.
+
+## rawfbt Probe Arguments <a id="dt_ref_rawfbtargs_prov">
+
+The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function.
+These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
+
+If the function has a return value, the return value is stored in `arg1` of the `return` probe.
+If a function doesn't have a return value, `arg1` isn't defined.
+
+There are no typed `args[]` arguments for any `rawfbt` probes.
+
+## rawfbt Stability <a id="dt_ref_rawfbtstab_prov">
+
+The `rawfbt` provider uses DTrace's stability mechanism to describe its stabilities.
+These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
-- 
2.47.3

