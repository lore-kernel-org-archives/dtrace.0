Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0051B424F
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758222862; cv=fail; b=uY8tI4gNx0/hMC1w07XY/TlihM1K4iGM76vshB5Ix+Hmx9kbkKNJ9HRdvo2ZrKSdBKBQVvnaNKTBidoPWeQGJRUpkKaFEmiXmEuGME9pQDEm1YZ/5DYRxSHq97W+Xa7aT1us3y76SjXI+0LW5AeR8Shr2CedKfomZ5x97uu3Bz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758222862; c=relaxed/simple;
	bh=07vpOn8ot4Ul/vMipnrYzEd78mPLW2TT1p4zulLi/xs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=LlENPVRBFmw9BxjMM0JF8a/COev3qxqkpsKsIjysqbmnOqxnTVYGTJnd9h/430bjXdf2YqDlWIITR8v+qyLLFx91DcWgVRu1mWDDLq04Zq5yJFOY4SNoO1R8BoYmyIUcXfUgwVjaPuoFPJTGwqn8CKjzeFErWHAUz/sfUKbuu54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wso6zVL/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pTdqBbIN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wso6zVL/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pTdqBbIN"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IG6vT4019440
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gyEHeuqrd9vB+opZBl
	ZJoms6XUn5uuRrPLIAivrIGCU=; b=Wso6zVL/phsf5R1IHWeFwpyeLn/CDoP86F
	DzR22x9SsCU8XMDmzhEuoaiW2HtPDRJiXogr+m5U4YDtcaYTWPAOpoGmP2xO3/VZ
	JBcVM0MDlA0xLqzKSG7SuxDOe36JBc6GeztefLT6zBcz32858Tl1Qv8iK1Lm0KdP
	az96iJgj425tq5wEM2poz7iGB7AYAL+fokIbtSueIbnCyXD9X/+OJAe8b97/dhy4
	/y+SAXhBBAPTboY698+CoGyxJoNDNB2zT0NfmKqQE6yvuOHJWXiPY4tviE8lAC0B
	f09D/QN4MthIgUA+Vp0dVx8UdZrQcM5JzbvAAFayBGSGVYPdPAAg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx6m7jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:14:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIaaWh028831
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:14:18 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fkkg7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSQafE+4IUxxMF4WkIuTq01taXGBcfXqAf6mkM8Eaqv11u3RODsxaLn1MUhbUPWUVZ3xYK45TYV8hSg079MpRJCUebNkuYIIPgCMVtcY5yFcB4U5s8pAqqsMvIf7UZKtvQbeAcoBh1o3ZKmm5Wwz+NJRc94Nd3VueQyy9DehDRVht+vXt6aRsXrnQnI1SVlp2pa6ZKcygyfE2tf9s11a9aD8PQddcapPEl4vGupcInHbxZ+g/UIZClGwxtYRhmvASYBAOjFpqodft8pV9YuNF90FxKjBMjXBTnX7ufx/4Yae8DNNmr0WF/8wAddC0fp3klTPHgSDwiTihfvqUiVJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyEHeuqrd9vB+opZBlZJoms6XUn5uuRrPLIAivrIGCU=;
 b=PMVtIQKbt8QaVCPeS1j8CMTvUdOd5eS+LcFZoKncbcONgSsdxTqKe+7btKVaPkjpNvXCu5fIMwOIjng693Tz4DCPwheR4en0vN1IkzZQJoXpjBfnZ3AMEe+ZuloHJuEPyEyq5z1D/pgs34klK5FxJGxf1BpTYiIM/F10U27hyvtsgDNe4RMMUpxYalYpF42s/6cAP5ONeBF/mXNFGnUIJAuFJ9NindBoHFQITvjuAbAjur6jUEqldK66ejRgWqKU4ZNjaXcMvB8mzKyTxz7YCQ2KUB3+IEV0wXrhtyoCOgbWCmA+03eDpr+hDGE1Gb/jzWH3AsVO1fCmhKli/TywFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyEHeuqrd9vB+opZBlZJoms6XUn5uuRrPLIAivrIGCU=;
 b=pTdqBbINfIxiKLw8CmGMP+k9muhAicMGsPvPr2kqI8NGPM0Y0/iQ6Hc0Nh5JgxdY9ClCMIAgbl7NN5QHMtojj6JaWQjjRDduF4Q3YGHAJCs4+65jw0GRpgIfYkkP+ZgJvdyDTsmmz2m1Qqp+4vQKwtdAfe0u9u3dQ++dk+LKF3g=
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b) by LV8PR10MB7845.namprd10.prod.outlook.com
 (2603:10b6:408:1e5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 19:14:15 +0000
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822]) by DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822%4]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 19:14:15 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Elena Zannoni <elena.zannoni@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [PATCH] Add examples directory to installed doc directory
References: <20250918185554.1754957-1-elena.zannoni@oracle.com>
Emacs: The Awakening
Date: Thu, 18 Sep 2025 20:14:13 +0100
In-Reply-To: <20250918185554.1754957-1-elena.zannoni@oracle.com> (Elena
	Zannoni's message of "Thu, 18 Sep 2025 12:54:53 -0600")
Message-ID: <87348jlgje.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFA0EC85B6E:EE_|LV8PR10MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce971b2-d054-41a5-137e-08ddf6e78eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/j7GsaGvfJDWOfKdp/3ATnb2igDSSR6mkb6qk79tfDyx3HLiYVOsGySFclG?=
 =?us-ascii?Q?yyHwNndJNyt90WnNDgEatflg/WykBgJdxAqgF6TK/ihZU0TXf5K5px4gtRvc?=
 =?us-ascii?Q?1lZPjcBap/hL5smtGGFnfE5qMT0rKVvgwVQFwlt2A82WbsTtC6wzVrC/A/dd?=
 =?us-ascii?Q?iQoFRxcYwhBJ/Ehg8cFHhvLtVOqAiLbEYkhIuoA4vFD7Vqj2QZ2paufEwY07?=
 =?us-ascii?Q?XANQCoPNudVxHqhmWFS26xtLeDRdvRGX5HwpQP7Q0BQ2vfHLk4QPLYEtTnxo?=
 =?us-ascii?Q?LswDkUWXrPTJP6+FXKmw/Hmn+Io7NkdcdAyAxXthn123qZB3UKqqoKu4szrB?=
 =?us-ascii?Q?PW7cJt0ZSZ9KJZQ90ZUaUoYCozr+HNwo3Un5cvT0dBGC5o56tmMH0JwwZPSe?=
 =?us-ascii?Q?0pAhg3VCxVpNBmJO8qvHUQXikoXL0P4Bl8G++C1MleVK1yKZ9VGWo4pzKx7h?=
 =?us-ascii?Q?+K260e/PTWXDVCkGPA0p89X6h3ecfYriSgRNq3WV4ych3BqKLHfp7w/UhRww?=
 =?us-ascii?Q?s9OA8c4bWAMYhcYv25/j082Zl+c/OlZYqjNaatVuQdhFhSWqmAQO32hFczB+?=
 =?us-ascii?Q?q5EIWRYceOp0xNnv+6IekAcag8SAI4IY5HB2d1vIShYELnlUsd0eaLw2Dgr4?=
 =?us-ascii?Q?ZfKhVau3yWD264V2fHS35llYpSiXpwl/ZgvqOkdTIzWTc3QtHyBK3hNkqQbG?=
 =?us-ascii?Q?pM2PGBXt/a5hAZKWWpLT3xEFfQMeAW98R2oFUOq5ofYdhSownCp1C0VhoJE9?=
 =?us-ascii?Q?RDntN4NiCFD0RFZ7QoxwJDWSnecqt29SkK8hTz0WQoDT4tBUwSGC2+7pE3TJ?=
 =?us-ascii?Q?rMo9oriraRrE6xRulZNNgqfjT453gt70Tvr9/oepGYG55J96DMDbzItrjLa2?=
 =?us-ascii?Q?K4o4DKUF0yy1FQN5VTsIejcCaXJ/g4n9VPXJ0pYThSdtJYFYJTCNFwcQXWCO?=
 =?us-ascii?Q?l6yp/AP4b0dgOHp0tXkBsiAybTvyZI835MM8WiJGEO6YdofuVpYyQqavO8R8?=
 =?us-ascii?Q?TKdSPjWRE5VCpJolFj02rcgphhwzCNcGW2+/dGvE4jaPjgaJXgWIab8/Kh1t?=
 =?us-ascii?Q?4UvvkNAgu8cOW8LsDsRVgfzxvl4aJ4GZYQDVh5i8Sn15K3OFbBpvWuS0689k?=
 =?us-ascii?Q?kfU/VaJAsSXwwHH+FAzN+dj2ZTQ+98LVO3HH0R8JRjfKkR7kvuUTpYrxZ/jK?=
 =?us-ascii?Q?UcsFIrEyiPoyLPEEqWv3uGHI7JhVIDNXpqWc3vmfxwwNObJfSun/bra9LWdX?=
 =?us-ascii?Q?Gh8a181nCXYmL2f1LqbJsM90CSzFSrEROgAGqbcojbeG/OHh++pYNYgoaSDz?=
 =?us-ascii?Q?iTAsIqQeiwJKzM2eJYtlCo8kHLmPs9Y/20wxZQIQmUWrG1HrAiL3EYvWd+pk?=
 =?us-ascii?Q?JoyrmRtk8sz0qvSjFTHSouepZcT+KyMYhLHdPzU1aG5czCo9a8fR/s/pLzJW?=
 =?us-ascii?Q?Xr+jte0oUJM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFA0EC85B6E.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68ZD+iocXoNNteqJfGAqQbZ7XOBRZwU/JlOBzjmDZTa8MYLtsBVKfMyfJE1S?=
 =?us-ascii?Q?3zBiBlYcatQjbJ+9m0oEGAUUvUVqrKTUHCnZw8XA2SG6O68UUF9zJidADqji?=
 =?us-ascii?Q?FkXDvl4iopB64ywqM8G5W2xWoaJT9LCrPalJlT2T7X5dqBweUD5VdVAS6pmG?=
 =?us-ascii?Q?jCNT1wriuZx9NDQ4u/q7KZIwUBSYq8gqYNU0AqbB4fPqbg4fRLeIcOCmezzc?=
 =?us-ascii?Q?PUbd2c26W8sVZTiOH4yE2VyC3v13KWi07GHyCyh7pm6F0NEg8hTIR/OBOAX3?=
 =?us-ascii?Q?6QKWjtYOUUIPK2B9uixrJiNWt3M5wwnjkQ407nUipkUgYepfzUcyCf7zzvFu?=
 =?us-ascii?Q?jlyXd4P1RaMJfYoAFPx4UW0wIUjYPhzM9kUGIAo+0KYcw+Sn3MWFqLcASUS1?=
 =?us-ascii?Q?oXSA7NlnFEgq+zP4eC602Qo7fACp4aNIu1mn0VUEahkSAzmI818ShwXMbX8Q?=
 =?us-ascii?Q?ew+s4vI6oxkfgEPIjKNdpcoFWbOwMcNabgk4TtwSCEG3rdrd/kHgjVmv7Qse?=
 =?us-ascii?Q?qi4p+uaRo1c3SceDRh+kwCR7YHHm3R5/tfKrwU4p7UqUh2V6+Pp01Xd9GWce?=
 =?us-ascii?Q?rhwp7jpiV/HeV/NQOnj8R319KIudfWd+TalSxJn1NDkqPj6bcOeiDDDa3p10?=
 =?us-ascii?Q?4MHcdUMfERnoTxUyf34uv7fIrRvJjhN8cvNecFZDgzhudQ9Vh6QItq9p6ndw?=
 =?us-ascii?Q?92LKwf44AmaNsPfU/ni/pFh50drgJWI6sj5LsjLMoOqsRkquACJzlVZ3WoBb?=
 =?us-ascii?Q?ga4yOSxxBLgqIQGKODl/A8Iwc3Sad+5PpUlwtRXT/WPgT3mWqI/pnwm1xC8s?=
 =?us-ascii?Q?ekJVpkQU65jLY6DS9JWYZuqLEPAmdf5wCZQYbpYvIlgEMSxZOUfi7tlwbOju?=
 =?us-ascii?Q?CCHEDhIUuBrPOKWJ1Phx8L8FaerzJJ7yTbVPJuFdYaCziQJGEMatGJ2T7hoh?=
 =?us-ascii?Q?UyntNI4N/8UhhcIhqPiiTShPloDo69u7JgINxx6CNFV3dl7pQFyvShRP5Wad?=
 =?us-ascii?Q?c7nhz7btTdLa3RfFT+Bp+Izdd4Pj8aqt4pc+tJDy4SqMwlvVD1A/VmyEEdr1?=
 =?us-ascii?Q?Q9IuYGxz2CU2iUPKv2LKUmqrAkk9w8fiUsHzEJXkQvZ5qk7sLHTpwWjX67/E?=
 =?us-ascii?Q?yZZfC1QTbzTSHpm2NnODVed/feoObsHfL2g9ouKokzaKBUimotiIrmPWgtv8?=
 =?us-ascii?Q?LyH/VDryVDbdjkcPsYzwwlcTJaCZt9Id3jNWr3lUrS0wgybDqVG3la9b+mfO?=
 =?us-ascii?Q?0ErMijGCvHXCDR2ERCHvOagnT9n1qE9QromCngldr0XbmXSGS2MsJpye15f9?=
 =?us-ascii?Q?y2Dtbhnx5YK7Z4Vb/MM2UZ3zoTy2q9PI+PA6fKHMLvgurypKLKyS0uEi5SZf?=
 =?us-ascii?Q?1p0WJrKECpXePzPNdD8qdM9ySe07VW2HHuR+4S5DrWszt5unnR9F+eYFszv1?=
 =?us-ascii?Q?iGT97a0NxDtQcLmz5VM8r2VnwACxGSirhp8h+5bHIhIy37ktOheOoMnV2CQ3?=
 =?us-ascii?Q?S2VmNoLHz3iR4I3AYLcc2UehLlY+y+ouvCusE2wDfO/wFfKQUF1zuhl9TvRE?=
 =?us-ascii?Q?/hG/KS9zBBsjEHc0Wj5pb5L+EHifE/b2Dd33eJrjdmV+N943bnFzjNHGjCvo?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SydJ4k6WJX7py6FgRiwixNkomeuKiCgFgkt2tc4lu5dpOoppbmp2SS2+MozxbAiPlvRkKP8rHWVoguf4ei5FSufxuysWWc2x06YI6HCavvpTmsvNZblUMhAUigGFCcGzI9/deA/m2lBh5uwJJ2cBA3hz5za5AHtkIauNFXvAy0Vj9yG6VsS9py40BTUwLoETmME+J+dUeGof0xP8qu6Df98vZFSiy3NO3SJ3am0ounybK6GITsMLYas6BoPtqNk+XKC9/pxdwclt6K02+IMeRbJuAXolrDdU5+wxenRBsFH5XYtCE3qCTvx68nh9nsdDFIoLrDtlX9Tyy3DFwmi2FrPqjfXmy92OBCBXOjzQsUR3Qqq1XHfAoo5AGtqy/DRBvEA/+4tEo3MZdhUj/yzAppUUDWy/7NGDvq4Msg4xwFiDbYjLO98JJanhjZR+EWXNqnzb8Y+tM+LtSAuEKntGKPhBW78AjlCcDyx1kBXA3l+IWkBp/1XCdkPeysNaPZzgRY5W6vKdHPDvsOqimLSLFrT9gcTZXnx7U/eZNWnZ23ABsIqajaR5Ztczqr5bskPXuZljJPGRQ6WVz4umePUicFpIsp8a7RLKvJuzUOm/aXU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce971b2-d054-41a5-137e-08ddf6e78eeb
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFA0EC85B6E.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:14:15.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5omaryBuVlREtEfcvG3A+9f1enxN6qBxDgHW7XzMo3twNwFSHC//dXDfsf0D7xkBWGbUWg6yIwLlx8YOvz6Klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180171
X-Authority-Analysis: v=2.4 cv=TqbmhCXh c=1 sm=1 tr=0 ts=68cc5a0b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=owoEwDJ9xg2cZ19bMQQA:9
X-Proofpoint-GUID: nyRvK22sqHOWvoe7D_YgPUC9ORQj32se
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4frI470A1eGm
 2ZE5vVFUyMEnuEL2RhEoJDsPVxGTOQ9ZQY+8PWAWLmNnQ2jlEYZ93oPlRfzNOXy+2+f0pqlZE+i
 YkOLi5mVqizeZ3kbeORgbpucq4tS9oV92U7Rr8wj8Fqe8gVszIzLoLJtD4tszHfU2RGg0ilJWQ1
 /Lky8/+QsBPuBV+pQt/mXZGq5ExBCuS9gG5YKgG6yIDynIy8JVDCvePwNZYXpNci/ksqrLWFALw
 oUSKgTXSPJy/BtV6PLI1zw3fVJ0H38t5qnfFOBnzBnH2fL7DkvfPKvXeNpMLzMrxTxUusLvB/eM
 T8FMkAW47sGTUU9+bpEBS/izmMBilw8Wf+3f31htZm9cK1XNAnhubwx/5PPsAFxXcGAT8yvjbqq
 hO5e/+E5
X-Proofpoint-ORIG-GUID: nyRvK22sqHOWvoe7D_YgPUC9ORQj32se

On 18 Sep 2025, Elena Zannoni uttered the following:

> Make sure that the examples directory gets installed. 
> It will be installed under /usr/share/doc/dtrace/examples.
>
>
> Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(Though this seems to be built on top of your previous commit -- I guess
they'll get squashed together or something?)

> diff --git a/Build b/Build
> index 1a66a824..220c9784 100644
> --- a/Build
> +++ b/Build
> @@ -7,12 +7,18 @@ install::
>  	mkdir -p $(INSTDOCDIR)/userguide/explanation
>  	mkdir -p $(INSTDOCDIR)/userguide/how-to
>  	mkdir -p $(INSTDOCDIR)/userguide/reference
> -	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS doc/userguide)
> +	mkdir -p $(INSTDOCDIR)/examples/
> +	mkdir -p $(INSTDOCDIR)/examples/language_features

That first mkdir -p line is technically unnecessary (but harmless).

> +	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS userguide examples)
>  	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
>  	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
>  	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
>  	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
>  	install -m 644 doc/userguide/reference/* $(INSTDOCDIR)/userguide/reference
> +	install -m 755 examples/*.d $(INSTDOCDIR)/examples
> +	install -m 644 examples/README.md $(INSTDOCDIR)/examples
> +	install -m 755 examples/language_features/* $(INSTDOCDIR)/examples/language_features

... you want the files to be executable? I suppose they're .d scripts
starting with a hashbang, so that makes sense.

-- 
NULL && (void)
